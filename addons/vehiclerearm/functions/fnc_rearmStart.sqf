#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
    Misery Rearming
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

private ["_playercash","_module","_dialog","_PurchaseB","_ExitB","_Vehiclename","_target","_resupplyPrice","_Found","_RepairsInterrupt","_playercash","_text","_displayedText","_delay","_progressIndicator","_displaySuccess"];

_module=(entities "Misery_VehRearmSettings")select 0;
Mis_Rearmcurrencytype =_module getvariable "Misery_Rearmcurrency";
Mis_Rearmfundstype =_module getvariable "Misery_Rearmfundstype";

_dialog = findDisplay 982383;
_PurchaseB = _dialog displayCtrl 1600;
_ExitB = _dialog displayCtrl 1601;

_Vehiclename = getText (configFile >> "CfgVehicles" >> MiseryTarget_VehName >> "displayName");

_target = MiseryTarget_Veh;

_resupplyPrice = 0;
_Found = false;

{
    if ((_x select 0) == MiseryTarget_VehName) then {
        _Array=_x;
        _Found = true;
        _resupplyPrice = _x select 4;
    };
} forEach Misery_Veh_Type;

if !(_Found) exitWith {};

player setVariable ["Misery_Proc_Resupply", true];

    _RepairsInterrupt = (findDisplay 982383) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable ["Misery_Proc_Resupply",false];
                [parseText "<t font='PuristaMedium' size='1'>Resupply interrupted...</t>", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
        };
}];

if (MiseryinVehiclerepairarea) exitwith {

if (Mis_Rearmcurrencytype == "DIGITALTYPE") then {
_playercash = player getVariable [Mis_Rearmfundstype, 0];
};

if (Mis_Rearmcurrencytype == "ITEMTYPE") then {
_playercash = {_x == Mis_Rearmfundstype} count items player;
};

if (Mis_Rearmcurrencytype == "MAGAZINETYPE") then {
_playercash = {_x == Mis_Rearmfundstype} count magazines player;
};

if (_playercash < _resupplyPrice) exitWith {
ctrlSetText [1001, "You cannot afford this!"];
_PurchaseB ctrlShow true;
_ExitB ctrlShow true;
};

_text = "Resupplying...";
_displayedText = "";
_delay = 45 / 100;
_progressIndicator = "";

for "_i" from 0 to 99 do {
    if ((player getVariable "Misery_Proc_Resupply") isEqualTo false) exitWith {};
    if (_i % 5 == 0) then {_progressIndicator = _progressIndicator + "-"};
    _displayedText = format ["%1%2%6%2%3%5%2[%4]", _text, endl, _i, _progressIndicator, "%", _Vehiclename];
    ctrlSetText [1001, _displayedText];
    sleep _delay;
};

if ((player getVariable "Misery_Proc_Resupply") isEqualTo true) then {

_target = cursorTarget;

if (Mis_Rearmcurrencytype == "DIGITALTYPE") then {
_playercash = player getVariable [Mis_Rearmfundstype, 0];
player setVariable [Mis_Rearmfundstype, (_playercash - _resupplyPrice), true];
};

if (Mis_Rearmcurrencytype == "ITEMTYPE") then {
_playercash = {_x == Mis_Rearmfundstype} count items player;
for "_i" from 1 to _resupplyPrice do {player removeitem Mis_Rearmfundstype;};
};

if (Mis_Rearmcurrencytype == "MAGAZINETYPE") then {
_playercash = {_x == Mis_Rearmfundstype} count magazines player;
for "_i" from 1 to _resupplyPrice do {player removeMagazine Mis_Rearmfundstype;};
};

_displaySuccess = format ["%1 has been successfully resupplied...", _Vehiclename];
ctrlSetText [1001, _displaySuccess];

_PurchaseB ctrlShow true;
_ExitB ctrlShow true;

_target setVehicleAmmoDef 1;
_target setVehicleAmmo 1;

player setVariable ["Misery_Proc_Resupply", nil];
(findDisplay 982383) displayRemoveEventHandler ["KeyDown", _RepairsInterrupt];

};
    };
