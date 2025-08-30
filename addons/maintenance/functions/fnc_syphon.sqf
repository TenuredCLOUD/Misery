#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Process syphoning vehicle with fuel can
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_syphon
 *
*/

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle) exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid vehicle..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
};

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    private _needTools = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You need a toolkit to syphon fuel..."];
    [QEGVAR(common,tileText), _needTools] call CBA_fnc_localEvent;
};

private _found = false;
private _totalLiters = 0;
private _fuelTypeIndex = 0;

{
    if ((_x select 0) isEqualTo typeOf _vehicle) then {
        _array = _x;
        _found = true;
        _fuelTypeIndex = _x select 1;
        _totalLiters = _x select 2;
    };
} forEach EGVAR(common,vehicleData);

if !(_found) exitWith {};

player setVariable [QCLASS(processRefuel), true];

// Initial button disabler
[274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);

_refuelInterrupt = (findDisplay 274839) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRefuel),false];
        private _refuelInterrupted = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Syphoning interrupted..."];
        [QEGVAR(common,tileText), _refuelInterrupted] call CBA_fnc_localEvent;
    };
}];

// Determine the required fuel type and Jerry can type based on the fuelTypeIndex
private _requiredFuelType = switch (_fuelTypeIndex) do {
    case 0: {[QCLASS(diesel), "Diesel", QCLASS(dieselEmpty)]};
    case 1: {[QCLASS(petrol), "Petrol", QCLASS(petrolEmpty)]};
    case 2: {[QCLASS(jetFuel), "JetFuel", QCLASS(jetFuelEmpty)]};
};

private _hasRequiredFuel = [[(_requiredFuelType) select 0, (_requiredFuelType) select 2]] call EFUNC(common,hasItem);

if (fuel _vehicle <= 0) exitWith {
    player setVariable [QCLASS(processRefuel), nil];
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
    _vehicle setFuel 0;
    _displayEmpty = format ["%1 fuel tank is empty...", [_vehicle] call EFUNC(common,getObjectData) select 0];
    ctrlSetText [1001, _displayEmpty];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

if (!_hasRequiredFuel) exitWith {
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
    ctrlSetText [1001, format ["%1 requires %2...", [_vehicle] call EFUNC(common,getObjectData) select 0, (_requiredFuelType) select 1]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

private _text = "Syphoning fuel...";
private _tanklvl = "Tank level:";
private _displayedText = "";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_refuelInterrupt", "_totalLiters", "_fuelTypeIndex", "_hasRequiredFuel", "_requiredFuelType", "_text", "_tanklvl", "_displayedText"];

    private _fuelToRemove = 1 / _totalLiters;

    private _emptyFuelCan = (_requiredFuelType) select 2;
    private _fuelCanMagazine = (_requiredFuelType) select 0;

    if ((player getVariable QCLASS(processRefuel)) isEqualTo false) exitWith {
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (fuel _vehicle <= 0) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        _vehicle setFuel 0;
        _displayEmpty = format ["%1 fuel tank is empty...", [_vehicle] call EFUNC(common,getObjectData) select 0];
        ctrlSetText [1001, _displayEmpty];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _hasRequiredFuel = [[(_requiredFuelType) select 0, (_requiredFuelType) select 2]] call EFUNC(common,hasItem);

    if (!_hasRequiredFuel) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        ctrlSetText [1001, format ["You need %1 or %2 to syphon fuel...", (_requiredFuelType) select 0, (_requiredFuelType) select 2]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _displayedText = format ["%1%2%3%2%4%2%5", _text, endl, [_vehicle] call EFUNC(common,getObjectData) select 0, _tanklvl, (fuel _vehicle) * 100];
    ctrlSetText [1001, _displayedText];

    _vehicle setFuel ((fuel _vehicle) - _fuelToRemove);

    // Remove empty fuel can and replace with magazine variant
    if ([[(_requiredFuelType) select 2]] call EFUNC(common,hasItem)) then {
        player removeItem _emptyFuelCan;
        [player, _fuelCanMagazine, 1, true] call CBA_fnc_addMagazine;
    };

    // Increment the count of the used Jerry can type
    private _fuelType = [QCLASS(diesel), QCLASS(petrol), QCLASS(jetFuel)] select _fuelTypeIndex;
    [_fuelType] call EFUNC(common,itemIncrement) params ["_incremented"];

    if !(_incremented) exitWith {
        ctrlSetText [1001, format ["%1 is full or no longer available...", [(_requiredFuelType) select 0] call EFUNC(common,getItemData) select 0]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [_vehicle, _refuelInterrupt, _totalLiters, _fuelTypeIndex, _hasRequiredFuel, _requiredFuelType, _text, _tanklvl, _displayedText]] call CBA_fnc_addPerFrameHandler;





