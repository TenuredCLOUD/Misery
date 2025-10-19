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

    [QEGVAR(common,titleText), "It's completely dead..."] call CBA_fnc_localEvent;

} else {

    [QEGVAR(common,titleText), "You add a battery to your portable radio..."] call CBA_fnc_localEvent;

//player removeItem QCLASS(PortableradioNobattery";
player removeItem QCLASS(9vBattery);

if (alive player) then {

//    player addItem QCLASS(PortableradioOFF";
    };
  };
