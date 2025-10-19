#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Process filling fuel cans from fuel pump
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_processFuelCan
 *
*/

private _dialog = findDisplay 733836;

private _selectedFuelCan = lbData [1500, (lbCurSel 1500)];

if (_selectedFuelCan isEqualTo "") exitWith { ctrlSetText [1001, "No selected fuel can to fill..."] };

player setVariable [QGVAR(usingPump), true];

// Initial button disabler
[733836, [1600, 1601], false] call EFUNC(common,displayShowControls);

private _pumpInterrupt = (findDisplay 733836) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QGVAR(usingPump), false];
        [QEGVAR(common,tileText), format ["Filling interrupted..."]] call CBA_fnc_localEvent;
    };
}];

private _preCheckIndex = [MACRO_FUEL_CANS] find _selectedFuelCan;
private _preCheckCanNoFuel = [MACRO_FUEL_CANS_EMPTY] select _preCheckIndex;

if (!([[_preCheckCanNoFuel]] call EFUNC(common,hasItem)) && !([[_selectedFuelCan]] call EFUNC(common,hasItem))) exitWith {
    ctrlSetText [1001, "You have no fuel can to fill..."];
    [733836, [1600, 1601], true] call EFUNC(common,displayShowControls);
    player setVariable [QGVAR(usingPump), false];
    (findDisplay 733836) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
};

GVAR(pumpingFuel) = true;
playSound QEGVAR(audio,sound_gasPumpStart);
call FUNC(pumpAudio);

[{
    params ["_args", "_handle"];
    _args params ["_selectedFuelCan", "_pumpInterrupt", "_preCheckCanNoFuel"];

    [player, 25] call EFUNC(generator,nearGenerator) params ["", "_generator"];

    GVAR(usingGenerator) = false;
    GVAR(usingBattery) = false;

    if (!isNil "_generator" && _generator getVariable [QEGVAR(generator,isRunning), false]) then {
        GVAR(usingGenerator) = true;
    };

    if ([[QCLASS(autoBattery), QCLASS(autoBattery_Heavy)]] call EFUNC(common,hasItem)) then {
        GVAR(usingBattery) = true;
    };

    if ((player getVariable QGVAR(usingPump)) isEqualTo false) exitWith {
        (findDisplay 733836) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
        [733836, [1600, 1601], true] call EFUNC(common,displayShowControls);
        GVAR(pumpingFuel) = false;
        playSound QEGVAR(audio,sound_gasPumpStop);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (!GVAR(usingGenerator) && !GVAR(usingBattery)) exitWith {
        player setVariable [QGVAR(usingPump), nil];
        (findDisplay 733836) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
        ctrlSetText [1001, "You have no power source to operate this fuel pump..."];
        [733836, [1600, 1601], true] call EFUNC(common,displayShowControls);
        GVAR(pumpingFuel) = false;
        playSound QEGVAR(audio,sound_gasPumpStop);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    ctrlSetText [1001, "Pumping fuel..."];

    // Add matching magazine type of fuel can to player if they have empty variant
    if !([[_selectedFuelCan]] call EFUNC(common,hasItem)) then {
        // Remove empty can and swap with magazine (fill-able variant)
        [player, _preCheckCanNoFuel] call CBA_fnc_removeItem;
        [player, _selectedFuelCan, 1, true] call CBA_fnc_addMagazine;
    };

    if (GVAR(usingGenerator)) then {
        // No power needed since generator is powering fuel pump
        [_selectedFuelCan] call EFUNC(common,itemIncrement) params ["_incremented"];

        if !(_incremented) exitWith {
            player setVariable [QGVAR(usingPump), nil];
            (findDisplay 733836) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
            ctrlSetText [1001, "You stop pumping fuel..."];
            [733836, [1600, 1601], true] call EFUNC(common,displayShowControls);
            GVAR(pumpingFuel) = false;
            playSound QEGVAR(audio,sound_gasPumpStop);
            _handle call CBA_fnc_removePerFrameHandler;
        };
    };

    if (!GVAR(usingGenerator) && GVAR(usingBattery)) then {
        [_selectedFuelCan] call EFUNC(common,itemIncrement) params ["_incremented"];

        if !(_incremented) exitWith {
            player setVariable [QGVAR(usingPump), nil];
            (findDisplay 733836) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
            ctrlSetText [1001, "You stop pumping fuel..."];
            [733836, [1600, 1601], true] call EFUNC(common,displayShowControls);
            GVAR(pumpingFuel) = false;
            playSound QEGVAR(audio,sound_gasPumpStop);
            _handle call CBA_fnc_removePerFrameHandler;
        };
        // Decrement the battery's life randomly (if being used):
        if ([30] call EFUNC(common,rollChance)) then {
            if ([[QCLASS(autoBattery)]] call EFUNC(common,hasItem)) then {
                [QCLASS(autoBattery)] call EFUNC(common,itemDecrement);
            } else {
                if ([[QCLASS(autoBattery_Heavy)]] call EFUNC(common,hasItem)) then {
                    [QCLASS(autoBattery_Heavy)] call EFUNC(common,itemDecrement);
                };
            };
        };
    };
}, 0.5, [_selectedFuelCan, _pumpInterrupt, _preCheckCanNoFuel]] call CBA_fnc_addPerFrameHandler;
