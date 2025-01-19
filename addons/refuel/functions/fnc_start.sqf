#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Refuel Processing
 * Processes refueling as well as prompts and progress bar
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_refuel_fnc_refuelZoneStart;
 *
 * Public: No
*/

private ["_playercash","_module","_dialog","_PurchaseB","_ExitB","_Vehiclename","_target","_fuelCost","_Found","_totalLiters","_RefuelInterrupt","_playercash","_text","_displayedText","_delay"];

_dialog = findDisplay 982384;
_PurchaseB = _dialog displayCtrl 1600;
_ExitB = _dialog displayCtrl 1601;

_Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

_target = EGVAR(common,targetVehicle);

_fuelCost = 0;
_Found = false;
_totalLiters = 0;

{
    if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
        _Array=_x;
        _Found = true;
        _fuelTypeIndex = _x select 1;

        _fuelCost = (Misery_Veh_FuelCosts select 0) select _fuelTypeIndex;

        _totalLiters = _x select 2;
    };
} forEach Misery_Veh_Type;

if !(_Found) exitWith {};

player setVariable [QCLASS(processRefuel), true];

_RefuelInterrupt = (findDisplay 982384) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRefuel),false];
        [parseText "<t font='PuristaMedium' size='1'>Refueling interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

if (MiseryinRefuelzonearea) exitWith {

if (Mis_Refuelcurrencytype isEqualTo "DIGITALTYPE") then {
_playercash = player getVariable [Mis_Refuelfundstype, 0];
};

if (Mis_Refuelcurrencytype isEqualTo "ITEMTYPE") then {
_playercash = {_x isEqualTo Mis_Refuelfundstype} count items player;
};

if (Mis_Refuelcurrencytype isEqualTo "MAGAZINETYPE") then {
_playercash = {_x isEqualTo Mis_Refuelfundstype} count magazines player;
};

if (_playercash < _fuelCost) exitWith {
ctrlSetText [1001, "You cannot afford this!"];
_PurchaseB ctrlShow true;
_ExitB ctrlShow true;
};

if (fuel _target >= 1) exitWith {
_displayFull = format ["%1 fuel tank is full...", _Vehiclename];
ctrlSetText [1001, _displayFull];
_PurchaseB ctrlShow true;
_ExitB ctrlShow true;
};

_text = "Refueling...";
_tanklvl = "Tank level:";
_displayedText = "";
_delay = 29 / 100;

for "_i" from 0 to (_totalLiters + 50) do {
    if ((player getVariable QCLASS(processRefuel)) isEqualTo false) exitWith {};

    _fuelToAdd = 1 / _totalLiters;
    _fundsToDeduct = _fuelCost;

    if (fuel _target >= 1) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 982384) displayRemoveEventHandler ["KeyDown", _RefuelInterrupt];
        _displayFull = format ["%1 fuel tank is full...", _Vehiclename];
        ctrlSetText [1001, _displayFull];
        _PurchaseB ctrlShow true;
        _ExitB ctrlShow true;
    };

    if (_playercash < _fundsToDeduct) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 982384) displayRemoveEventHandler ["KeyDown", _RefuelInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        _PurchaseB ctrlShow true;
        _ExitB ctrlShow true;
    };

    _displayedText = format ["%1%2%3%2%4%2%5", _text, endl, _Vehiclename, _tanklvl,(fuel _target) * 100];
    ctrlSetText [1001, _displayedText];
    sleep _delay;

    if (Mis_Refuelcurrencytype isEqualTo "DIGITALTYPE") then {
        _playercash = player getVariable [Mis_Refuelfundstype, 0];
        player setVariable [Mis_Refuelfundstype, (_playercash - _fundsToDeduct), true];
    };
    if (Mis_Refuelcurrencytype isEqualTo "ITEMTYPE") then {
        _playercash = {_x isEqualTo Mis_Refuelfundstype} count items player;
        for "_j" from 1 to _fundsToDeduct do {player removeItem Mis_Refuelfundstype;};
    };
    if (Mis_Refuelcurrencytype isEqualTo "MAGAZINETYPE") then {
        _playercash = {_x isEqualTo Mis_Refuelfundstype} count magazines player;
        for "_j" from 1 to _fundsToDeduct do {player removeMagazine Mis_Refuelfundstype;};
    };

    _target setFuel ((fuel _target) + _fuelToAdd);
};
};


