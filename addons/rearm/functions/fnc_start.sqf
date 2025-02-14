#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Rearming
 * Runs rearm process, prompts loading bar, etc...
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_rearm_fnc_start;
 *
 * Public: No
*/

private ["_playercash","_module","_dialog","_PurchaseB","_ExitB","_Vehiclename","_target","_resupplyPrice","_Found","_RepairsInterrupt","_playercash","_text","_displayedText","_delay","_progressIndicator","_displaySuccess"];

private _dialog = findDisplay 982383;
private _PurchaseB = _dialog displayCtrl 1600;
private _ExitB = _dialog displayCtrl 1601;
private _Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");
private _target = EGVAR(common,targetVehicle);
private _resupplyPrice = 0;
private _Found = false;

{
    if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
        _Array = _x;
        _Found = true;
        _resupplyPrice = _x select 4;
    };
} forEach EGVAR(common,vehicleData);

if !(_Found) exitWith {};

player setVariable [QCLASS(processRearm), true];

   private _RepairsInterrupt = (findDisplay 982383) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRearm),false];
                [parseText "<t font='PuristaMedium' size='1'>Resupply interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
        };
}];

if (MiseryinVehiclerepairarea) exitWith {

_playercash = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];

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
    if ((player getVariable QCLASS(processRearm)) isEqualTo false) exitWith {};
    if (_i % 5 isEqualTo 0) then {_progressIndicator = _progressIndicator + "-"};
    _displayedText = format ["%1%2%6%2%3%5%2[%4]", _text, endl, _i, _progressIndicator, "%", _Vehiclename];
    ctrlSetText [1001, _displayedText];
    sleep _delay;
};

if ((player getVariable QCLASS(processRearm)) isEqualTo true) then {

_target = cursorTarget;

player setVariable [QEGVAR(currency,funds), (_playercash - _resupplyPrice), true];

_displaySuccess = format ["%1 has been successfully resupplied...", _Vehiclename];
ctrlSetText [1001, _displaySuccess];

_PurchaseB ctrlShow true;
_ExitB ctrlShow true;

_target setVehicleAmmoDef 1;
_target setVehicleAmmo 1;

player setVariable [QCLASS(processRearm), nil];
(findDisplay 982383) displayRemoveEventHandler ["KeyDown", _RepairsInterrupt];

};
    };
