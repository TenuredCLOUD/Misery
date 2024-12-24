#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * THBD injection (non-stim) (rad removal)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_thbdInjection;
 *
*/



if (!hasInterface) exitWith {};

if (EGVAR(common,ace)) then {
[player, "Misery_Thrombomodulin", 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

titleText ["You inject the Thrombomodulin...", "PLAIN DOWN"];

player removeItem "Misery_Thrombomodulin";

sleep 5;

//This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {

};
while {_compteur < 2500} do {
    _effectSpeed = 50 + random 25;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

