#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Mechanic Repairing Shop UI processor
 * Processes repairing with "progress bar"
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_repairs_fnc_repair;
 *
 * Public: No
*/

private ["_playercash","_module","_dialog","_PurchaseB","_ExitB","_Vehiclename","_target","_repairPrice","_Found","_RepairsInterrupt","_playercash","_text","_displayedText","_delay","_progressIndicator","_displaySuccess"];

_dialog = findDisplay 982382;
_PurchaseB = _dialog displayCtrl 1600;
_ExitB = _dialog displayCtrl 1601;

_Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

_target = EGVAR(common,targetVehicle);

_repairPrice = 0;
_Found = false;

{
    if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
        _Array=_x;
        _Found = true;
        _repairPrice = _x select 3;
    };
} forEach Misery_Veh_Type;

if !(_Found) exitWith {};

player setVariable [QCLASS(processRepairs), true];

    _RepairsInterrupt = (findDisplay 982382) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRepairs),false];
                [parseText "<t font='PuristaMedium' size='1'>Repairs interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
        };
}];

if (MiseryinVehiclerepairarea) exitWith {

if (Mis_Mechcurrencytype isEqualTo "DIGITALTYPE") then {
_playercash = player getVariable [Mis_Mechfundstype, 0];
};

if (Mis_Mechcurrencytype isEqualTo "ITEMTYPE") then {
_playercash = {_x isEqualTo Mis_Mechfundstype} count items player;
};

if (Mis_Mechcurrencytype isEqualTo "MAGAZINETYPE") then {
_playercash = {_x isEqualTo Mis_Mechfundstype} count magazines player;
};

if (_playercash < _repairPrice) exitWith {
ctrlSetText [1001, "You cannot afford this!"];
_PurchaseB ctrlShow true;
_ExitB ctrlShow true;
};

_text = "Repairing...";
_displayedText = "";
_delay = 45 / 100;
_progressIndicator = "";

for "_i" from 0 to 99 do {
    if ((player getVariable QCLASS(processRepairs)) isEqualTo false) exitWith {};
    if (_i % 5 isEqualTo 0) then {_progressIndicator = _progressIndicator + "-"};
    _displayedText = format ["%1%2%6%2%3%5%2[%4]", _text, endl, _i, _progressIndicator, "%", _Vehiclename];
    ctrlSetText [1001, _displayedText];
    sleep _delay;
};

if ((player getVariable QCLASS(processRepairs)) isEqualTo true) then {

_target = cursorTarget;

if (Mis_Mechcurrencytype isEqualTo "DIGITALTYPE") then {
_playercash = player getVariable [Mis_Mechfundstype, 0];
player setVariable [Mis_Mechfundstype, (_playercash - _repairPrice), true];
};

if (Mis_Mechcurrencytype isEqualTo "ITEMTYPE") then {
_playercash = {_x isEqualTo Mis_Mechfundstype} count items player;
for "_i" from 1 to _repairPrice do {player removeItem Mis_Mechfundstype;};
};

if (Mis_Mechcurrencytype isEqualTo "MAGAZINETYPE") then {
_playercash = {_x isEqualTo Mis_Mechfundstype} count magazines player;
for "_i" from 1 to _repairPrice do {player removeMagazine Mis_Mechfundstype;};
};

_displaySuccess = format ["%1 has been successfully repaired...", _Vehiclename];
ctrlSetText [1001, _displaySuccess];

_PurchaseB ctrlShow true;
_ExitB ctrlShow true;

_target setDamage 0;

player setVariable [QCLASS(processRepairs), nil];
(findDisplay 982382) displayRemoveEventHandler ["KeyDown", _RepairsInterrupt];

};
    };
