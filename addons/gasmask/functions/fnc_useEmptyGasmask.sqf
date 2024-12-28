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

  if !([[QCLASS(gasCartridge)]] call EFUNC(common,hasItem)) exitWith {titleText ["You need spare cartridges to use this mask...", "PLAIN DOWN"];};

   titleText ["You add some cartridges to the mask...", "PLAIN DOWN"];

   player removeItem QCLASS(gasMask_Empty);
   player removeItem QCLASS(gasCartridge);

   sleep 1;

   //If no "MiseryEmptyGasmask" variable exists add random gasmask to player
   if (isNil "MiseryEmptyGasmask") then {
   private _randomgmask = selectRandom ["Mask_M40","Mask_M40_OD"];
   player addItem _randomgmask;
   }else{
   player addItem MiseryEmptyGasmask; //Re-add stored Gasmask classname from stored variable
   MiseryEmptyGasmask = nil; //Make Empty gasmask string NIL value to prevent duping of pre-worn masks
   };

};
