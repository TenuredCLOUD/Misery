#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chainsaw fuel usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_chainsawFuel;
 *
*/

// if (!hasInterface) exitWith {};

// if !([[QCLASS(chainsaw_Empty)]] call EFUNC(common,hasItem)) exitWith {titleText ["You have no chainsaw that needs fuel...", "PLAIN DOWN"];};

//   titleText ["You start to refuel your chainsaw...", "PLAIN DOWN"];

//   player removeItem QCLASS(sawFuel);
//   player removeItem QCLASS(chainsaw_Empty);

//   private _random = [1, 10] call BIS_fnc_randomInt;

//   if (_random < 5) then {
//       titleText ["You refueled your chainsaw, and have fuel to spare", "PLAIN DOWN"];
//       player addItem QCLASS(sawFuel);
//       player addItem QCLASS(chainsaw);
//   };

//   if (_random > 5) then {
//       titleText ["You refueled your chainsaw, but used the last of your fuel can...", "PLAIN DOWN"];
//       player addItem QCLASS(chainsaw); // <<-- Add Refueled saw, no removal of Fuel can since it's already done
//   };


