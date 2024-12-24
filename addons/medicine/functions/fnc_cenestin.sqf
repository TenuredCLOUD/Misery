#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cenestin pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_cenestin;
 *
*/



if (!hasInterface) exitWith {};

  if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) then {

titleText ["You take a cenestin pill...", "PLAIN DOWN"];

player removeItem "Misery_Cenestin";

sleep 60;

 if (EGVAR(common,ace)) then {
[player, "Misery_Cenestin", 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;

{
[player, _x, "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal;
} forEach ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];

}else{
private _playerhealth = damage player;
player setDamage [_playerhealth - 0.15, false];
 };

};
