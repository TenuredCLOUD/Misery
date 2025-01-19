#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * THBD stim (rad removal)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_thbdInjectionStim;
 *
*/

if (!hasInterface) exitWith {};

  if (EGVAR(common,ace)) then {
  [player, QCLASS(thrombomodulin_Stimpack), 120, 600, 1, 0, 1, 1] call ace_medical_status_fnc_addMedicationAdjustment;
  };

titleText ["You use the Thrombomodulin Stimpack...", "PLAIN DOWN"];

    player removeItem QCLASS(thrombomodulin_Stimpack);

[{
    player setVariable [QEGVAR(survival,radiation), -5000 - random 250];
    if ((player getVariable [QEGVAR(survival,radiation), 0]) < 0) then {
        player setVariable [QEGVAR(survival,radiation), 0];
    };
}, [], 10] call CBA_fnc_waitAndExecute;


