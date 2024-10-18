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

if !("Misery_9vbat" in items player) then {

   titleText ["It's completely dead...", "PLAIN DOWN"];

}else{

titleText ["You add a battery to your portable radio...", "PLAIN DOWN"];

player removeItem "Misery_PortableradioNobattery";
player removeItem "Misery_9vbat";

if (alive player) then {

    player addItem "Misery_PortableradioOFF";
    };
  };
