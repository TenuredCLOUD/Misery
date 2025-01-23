#include "..\script_component.hpp"

/*
 * Author: TenuredCLOUD
 * Portable radio batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radio_fnc_portableRadioBatteries;
 *
*/

if !([[QCLASS(9vBattery)]] call EFUNC(common,hasItem)) then {

   titleText ["It's completely dead...", "PLAIN DOWN"];

} else {

titleText ["You add a battery to your portable radio...", "PLAIN DOWN"];

//player removeItem QCLASS(PortableradioNobattery";
player removeItem QCLASS(9vBattery);

if (alive player) then {

//    player addItem QCLASS(PortableradioOFF";
    };
  };
