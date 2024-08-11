/*
Misery Cenestin pill usage
Designed specifically for Misery mod
by TenuredCLOUD
*/

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

  if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) then {

titleText ["You take a cenestin pill...", "PLAIN DOWN"];

player removeitem "Misery_Cenestin";

sleep 60;

 if (MiseryACE) then {
[player, "Misery_Cenestin", 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;

{
[player, _x, "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal;
} forEach ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];

}else{
private _playerhealth = damage player;
player setdamage [_playerhealth - 0.15, false];
 };

};
