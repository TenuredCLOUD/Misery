#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Process removing coolant to vehicles
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_removeCoolant
 *
*/

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle) exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid vehicle..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
};

private _currentCoolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];

private _found = false;
private _totalLiters = 0;

{
    if ((_x select 0) isEqualTo typeOf _vehicle) then {
        _array = _x;
        _found = true;
        _totalLiters = _x select 7;
    };
} forEach EGVAR(common,vehicleData);

if !(_found) exitWith {};

player setVariable [QCLASS(processCoolant), true];

// Initial button disabler
[274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);

_coolantInterrupt = (findDisplay 274839) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processCoolant),false];
        private _coolantInterrupted = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Removing coolant interrupted..."];
        [QEGVAR(common,tileText), _coolantInterrupted] call CBA_fnc_localEvent;
    };
}];

private _hasCoolant = [[QCLASS(coolant), QCLASS(coolantEmpty)]] call EFUNC(common,hasItem);

if (_currentCoolantLevel <= 0) exitWith {
    player setVariable [QCLASS(processCoolant), nil];
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _coolantInterrupt];
    _vehicle setVariable [QGVAR(coolantLevel), 0, true];
    _displayFull = format ["%1 coolant is empty...", [_vehicle] call EFUNC(common,getObjectData) select 0];
    ctrlSetText [1001, _displayFull];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

if (!_hasCoolant) exitWith {
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _coolantInterrupt];
    ctrlSetText [1001, format ["You need %1 or %2 to start draining coolant from %3...", [QCLASS(coolant)] call EFUNC(common,getItemData) select 0, [QCLASS(coolantEmpty)] call EFUNC(common,getItemData) select 0, [_vehicle] call EFUNC(common,getObjectData) select 0]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

private _text = "Removing coolant...";
private _coolantLvl = "coolant level:";
private _displayedText = "";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_coolantInterrupt", "_totalLiters", "_text", "_coolantLvl", "_displayedText"];

    private _coolantToRemove = 1 / _totalLiters;
    private _currentCoolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];

    if ((player getVariable QCLASS(processCoolant)) isEqualTo false) exitWith {
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _coolantInterrupt];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_currentCoolantLevel <= 0) exitWith {
        player setVariable [QCLASS(processCoolant), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _coolantInterrupt];
        _vehicle setVariable [QGVAR(coolantLevel), 0, true];
        _displayFull = format ["%1 coolant is empty...", [_vehicle] call EFUNC(common,getObjectData) select 0];
        ctrlSetText [1001, _displayFull];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _displayedText = format ["%1%2%3%2%4%2%5", _text, endl, [_vehicle] call EFUNC(common,getObjectData) select 0, _coolantLvl, (_currentCoolantLevel) * 100];
    ctrlSetText [1001, _displayedText];

    _vehicle setVariable [QGVAR(coolantLevel), _currentCoolantLevel - _coolantToRemove, true];

    // Remove empty coolant can and replace with magazine variant
    if ([[QCLASS(coolantEmpty)]] call EFUNC(common,hasItem)) then {
        player removeItem QCLASS(coolantEmpty);
        [player, QCLASS(coolant), 1, true] call CBA_fnc_addMagazine;
    };

    // Increment the count of the coolant can
    [QCLASS(coolant)] call EFUNC(common,itemIncrement) params ["_incremented"];

    if !(_incremented) exitWith {
        ctrlSetText [1001, format ["%1 is full or no longer available...", [QCLASS(coolant)] call EFUNC(common,getItemData) select 0]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [_vehicle, _coolantInterrupt, _totalLiters, _text, _coolantLvl, _displayedText]] call CBA_fnc_addPerFrameHandler;
