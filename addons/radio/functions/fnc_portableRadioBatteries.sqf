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

player removeitem "Misery_PortableradioNobattery";
player removeitem "Misery_9vbat";

if (alive player) then {

    player additem "Misery_PortableradioOFF";
    };
  };
