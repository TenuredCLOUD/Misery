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

if !([[QCLASS(lithiumBattery)]] call EFUNC(common,hasItem)) then {

   titleText ["It's completely dead...", "PLAIN DOWN"];

} else {

titleText ["You add a battery to your RF detector...", "PLAIN DOWN"];

player removeItem QCLASS(rfHighRange_NoBattery);
player removeItem QCLASS(lithiumBattery);

if (alive player) then {

    player addItem QCLASS(rfHighRange_Off);
    };
  };
