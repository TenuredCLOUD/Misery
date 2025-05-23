#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Medical treatment
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medzone_fnc_start;
 *
 * Public: No
*/

private ["_playercash","_dialog","_PurchaseB","_ExitB","_MedInterrupt"];

_dialog = findDisplay 982381;
_PurchaseB = _dialog displayCtrl 1600;
_ExitB = _dialog displayCtrl 1601;

if (MiseryinMedzonearea) exitWith {

if (Mis_Medcurrencytype isEqualTo "DIGITALTYPE") then {
_playercash = player getVariable [Mis_Medfundstype, 0];
};

if (Mis_Medcurrencytype isEqualTo "ITEMTYPE") then {
_playercash = {_x isEqualTo Mis_Medfundstype} count items player;
};

if (Mis_Medcurrencytype isEqualTo "MAGAZINETYPE") then {
_playercash = {_x isEqualTo Mis_Medfundstype} count magazines player;
};

if (_playercash < Mis_Medpriceheal) exitWith {
ctrlSetText [1001, "You cannot afford this!"];
_PurchaseB ctrlShow true;
_ExitB ctrlShow true;
};

player setVariable [QCLASS(processTreatment), true];

    _MedInterrupt = (findDisplay 982381) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processTreatment),false];
                [parseText "<t font='PuristaMedium' size='1'>Treatment interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
        };
}];

private _text = "Recieving Treatment...";
private _displayedText = "";
private _delay = 45 / 100;
private _progressIndicator = "";

for "_i" from 0 to 99 do {
    if ((player getVariable QCLASS(processTreatment)) isEqualTo false) exitWith {};
    if (_i % 5 isEqualTo 0) then {_progressIndicator = _progressIndicator + "-"};
    _displayedText = format ["%1%2%3%5%2[%4]", _text, endl, _i, _progressIndicator, "%"];
    ctrlSetText [1001, _displayedText];
    sleep _delay;
};

if ((player getVariable QCLASS(processTreatment)) isEqualTo true) then {

if (Mis_Medcurrencytype isEqualTo "DIGITALTYPE") then {
_playercash = player getVariable [Mis_Medfundstype, 0];
player setVariable [Mis_Medfundstype, (_playercash - Mis_Medpriceheal), true];
};

if (Mis_Medcurrencytype isEqualTo "ITEMTYPE") then {
_playercash = {_x isEqualTo Mis_Medfundstype} count items player;
for "_i" from 1 to Mis_Medpriceheal do {player removeItem Mis_Medfundstype;};
};

if (Mis_Medcurrencytype isEqualTo "MAGAZINETYPE") then {
_playercash = {_x isEqualTo Mis_Medfundstype} count magazines player;
for "_i" from 1 to Mis_Medpriceheal do {player removeMagazine Mis_Medfundstype;};
};

if (EGVAR(common,ace)) then {
[player] call ace_medical_treatment_fnc_fullHealLocal;
} else {
player setDamage 0;
};

ctrlSetText [1001, "You have been successfully treated..."];

player setVariable [QCLASS(processTreatment), nil]; //terminate flag
(findDisplay 982381) displayRemoveEventHandler ["KeyDown", _MedInterrupt]; //Remove Display EH

_PurchaseB ctrlShow true;
_ExitB ctrlShow true;

//Refresh treatment prices:
[] call EFUNC(treatment,treatListed);
    };
};
