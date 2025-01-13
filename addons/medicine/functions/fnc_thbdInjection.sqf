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
[player, QCLASS(thrombomodulin), 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

titleText ["You inject the Thrombomodulin...", "PLAIN DOWN"];

player removeItem QCLASS(thrombomodulin);

[{
    player setVariable [QCLASS(radiation), -2500 - random 500];
    if ((player getVariable [QCLASS(radiation), 0]) < 0) then {
        player setVariable [QCLASS(radiation), 0];
    }; 
}, [], 10] call CBA_fnc_waitAndExecute;

