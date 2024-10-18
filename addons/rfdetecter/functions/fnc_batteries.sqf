#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * RF detector batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_rfdetector_fnc_rfBatteries;
 *
*/

if !("Misery_lithiumbattery" in items player) then {

   titleText ["It's completely dead...", "PLAIN DOWN"];

}else{

titleText ["You add a battery to your RF detector...", "PLAIN DOWN"];

player removeItem "Misery_RFHighNobattery";
player removeItem "Misery_lithiumbattery";

if (alive player) then {

    player addItem "Misery_RFHighrangeOFF";
    };
  };
