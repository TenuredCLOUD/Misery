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
 * [] call misery_gasmask_fnc_useEmptyGasmask
 *
*/

if (alive player) then {

  if !("Misery_gascartridge" in items player) exitWith {titleText ["You need spare cartridges to use this mask...", "PLAIN DOWN"];};

   titleText ["You add some cartridges to the mask...", "PLAIN DOWN"];

   player removeitem "Misery_gasmaskempty";
   player removeitem "Misery_gascartridge";

   sleep 1;

   //If no "MiseryEmptyGasmask" variable exists add random gasmask to player
   if (isNil "MiseryEmptyGasmask") then {
   private _randomgmask = selectrandom ["Mask_M40","Mask_M40_OD"];
   player additem _randomgmask;   
   }else{
   player additem MiseryEmptyGasmask; //Re-add stored Gasmask classname from stored variable 
   MiseryEmptyGasmask = nil; //Make Empty gasmask string NIL value to prevent duping of pre-worn masks  
   };

};
