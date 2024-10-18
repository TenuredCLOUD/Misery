#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Gas mask cartridge replacement
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_useCartridges
 *
*/

if (goggles player in antirad_goggles) then {

   player removeitem "Misery_gascartridge";

   titleText ["You replace the cartridges on your gasmask...", "PLAIN DOWN"];

   sleep 1;

   player setVariable ["Miserycartridge", 100];

};
