#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Process refueling vehicle with fuel pump
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_process
 *
*/

private _dialog = findDisplay 733835;

[player] call EFUNC(common,nearVehicle) params ["", "_vehicle"];

private _nearLandFuel = [[MACRO_FUELSTATIONS_LAND], 2.5] call EFUNC(common,nearCraftingStation);
private _nearAirFuel = [[MACRO_FUELSTATIONS_AIR], 10] call EFUNC(common,nearCraftingStation);

if (isNil "_vehicle") exitWith { ctrlSetText [1001, "No vehicle to refuel..."]; };

if (_vehicle isKindOf "Air" && _nearLandFuel) exitWith { ctrlSetText [1001, "Wrong fuel station for this vehicle..."]; };

if (_vehicle isKindOf "Land" && _nearAirFuel) exitWith { ctrlSetText [1001, "Wrong fuel station for this vehicle..."]; };

private _found = false;
private _totalLiters = 0;

{
    if ((_x select 0) isEqualTo typeOf _vehicle) then {
        _array = _x;
        _found = true;
        _totalLiters = _x select 2;
    };
} forEach EGVAR(common,vehicleData);

if !(_found) exitWith {};

player setVariable [QGVAR(usingPump), true];

// Initial button disabler
[733835, [1600, 1601], true] call EFUNC(common,displayShowControls);

private _pumpInterrupt = (findDisplay 733835) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QGVAR(usingPump),false];
        [QEGVAR(common,tileText), format ["Refueling interrupted..."]] call CBA_fnc_localEvent;
    };
}];

if (fuel _vehicle >= 1) exitWith {
    player setVariable [QGVAR(usingPump), nil];
    (findDisplay 733835) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
    _vehicle setFuel 1;
    ctrlSetText [1001, format ["%1 fuel tank is full...", [_vehicle] call EFUNC(common,getObjectData) select 0]];
    [733835, [1600, 1601], true] call EFUNC(common,displayShowControls);
};

GVAR(pumpingFuel) = true;
playSound QEGVAR(audio,sound_gasPumpStart);
call FUNC(pumpAudio);

private _text = "Refueling...";
private _tanklvl = "Tank level:";
private _displayedText = "";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_pumpInterrupt", "_totalLiters", "_text", "_tanklvl", "_displayedText"];

    private _fuelToAdd = 1 / _totalLiters;

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
        (findDisplay 733835) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
        [733835, [1600, 1601], true] call EFUNC(common,displayShowControls);
        GVAR(pumpingFuel) = false;
        playSound QEGVAR(audio,sound_gasPumpStop);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (fuel _vehicle >= 1) exitWith {
        player setVariable [QGVAR(usingPump), nil];
        (findDisplay 733835) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
        _vehicle setFuel 1;
        ctrlSetText [1001, format ["%1 fuel tank is full...", [_vehicle] call EFUNC(common,getObjectData) select 0]];
        [733835, [1600, 1601], true] call EFUNC(common,displayShowControls);
        GVAR(pumpingFuel) = false;
        playSound QEGVAR(audio,sound_gasPumpStop);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (!GVAR(usingGenerator) && !GVAR(usingBattery)) exitWith {
        player setVariable [QGVAR(usingPump), nil];
        (findDisplay 733835) displayRemoveEventHandler ["KeyDown", _pumpInterrupt];
        ctrlSetText [1001, "You have no power source to operate this fuel pump..."];
        [733835, [1600, 1601], true] call EFUNC(common,displayShowControls);
        GVAR(pumpingFuel) = false;
        playSound QEGVAR(audio,sound_gasPumpStop);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (GVAR(usingGenerator)) then {
        // No power needed since generator is powering fuel pump
        _vehicle setFuel ((fuel _vehicle) + _fuelToAdd);
    };

    if (!GVAR(usingGenerator) && GVAR(usingBattery)) then {
        _vehicle setFuel ((fuel _vehicle) + _fuelToAdd);
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

    ctrlSetText [1001, format ["%1%2%3%2%4%2%5", _text, endl, [_vehicle] call EFUNC(common,getObjectData) select 0, _tanklvl, (fuel _vehicle) * 100]];
}, 0.5, [_vehicle, _pumpInterrupt, _totalLiters, _text, _tanklvl, _displayedText]] call CBA_fnc_addPerFrameHandler;
