#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cigar usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_tobacco_fnc_cigar;
 *
*/

if (!hasInterface) exitWith {};

private _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR];

    if !("rvg_matches" in magazines player || QCLASS(lighter) in items player) exitWith {titleText ["You need a lighter or matches to smoke...", "PLAIN DOWN"];};


    if (alive player) then {

    if ("rvg_matches" in magazines player) then {

    titleText ["You light up a cigar...", "PLAIN DOWN"];

     player removeItem QCLASS(cigar);

      playSound3D [QPATHTOEF(audio,sounds\immersion\Matchsmoking.ogg), player, false, getPosASL player, 4, 1, 10];

    //Remove some fear due to cig smoking:
  if (MiseryFearenabled) then {
    player setVariable [QCLASS(psycosis), (_MFear - 3)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

    sleep 1;

if (EGVAR(common,ace)) then {
    [player, QCLASS(cigar), 10, 300, -5, -5, -5] call ace_medical_status_fnc_addMedicationAdjustment;
};

 //This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {

};
while {_compteur < 500} do {
    _effectSpeed = 1 + random 5;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

}else {

if (QCLASS(lighter) in magazines player) then {

    titleText ["You light up a cigar...", "PLAIN DOWN"];

      playSound3D [QPATHTOEF(audio,sounds\immersion\Lightersmoking.ogg), player, false, getPosASL player, 4, 1, 10];

    player removeItem QCLASS(cigar);

    //Remove some fear due to cig smoking:
  if (MiseryFearenabled) then {
    player setVariable [QCLASS(psycosis), (_MFear - 3)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

    sleep 1;

if (EGVAR(common,ace)) then {
    [player, QCLASS(cigar), 10, 300, -5, -5, -5] call ace_medical_status_fnc_addMedicationAdjustment;
};

   //This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 500} do {
    _effectSpeed = 1 + random 5;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

};
};
    }; //End of code
