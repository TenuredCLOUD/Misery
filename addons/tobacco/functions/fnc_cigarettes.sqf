#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cigarette usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_tobacco_fnc_cigarettes;
 *
*/

if (!hasInterface) exitWith {};

private _random = [1, 10] call BIS_fnc_randomInt;
private _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR];

    if !("rvg_matches" in magazines player || "Misery_lighter" in items player) exitWith {titleText ["You need a lighter or match to smoke...", "PLAIN DOWN"];};

    if ("rvg_matches" in magazines player) then {

      titleText ["You light up a cigarette...", "PLAIN DOWN"];

    player removeItem "Misery_cigarettepack"; //remove on start;

    playSound3D [QPATHTOEF(audio,sounds\immersion\Matchsmoking.ogg), player, false, getPosASL player, 4, 1, 10];

    //Remove some fear due to cig smoking:
  if (MiseryFearenabled) then {
    player setVariable [QCLASS(psycosis), (_MFear - 1.5)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

 sleep 1;

  if (EGVAR(common,ace)) then {
  [player, "Misery_cigarettepack", 10, 300, -1, -1, -1] call ace_medical_status_fnc_addMedicationAdjustment;
  };

////---------------------------------------------------
  if (_random > 5) exitWith {

    player addItem "Misery_cigarettepack";

    //This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 250} do {
    _effectSpeed = 1 + random 2;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

};

//---------------------------------------------------no more cigs
if (_random == 5) exitWith {

titleText ["You smoked the last cigarette...", "PLAIN DOWN"];

//This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 250} do {
    _effectSpeed = 1 + random 2;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

};

////---------------------------------------------------

if (_random < 5) exitWith {

player addItem "Misery_cigarettepack";

//This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 250} do {
    _effectSpeed = 1 + random 2;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

};

}else{

if ("Misery_lighter" in items player) then {

  titleText ["You light up a cigarette...", "PLAIN DOWN"];

  player removeItem "Misery_cigarettepack"; //remove on start;

  playSound3D [QPATHTOEF(audio,sounds\immersion\Lightersmoking.ogg), player, false, getPosASL player, 4, 1, 10];

  //Remove some fear due to cig smoking:
  if (MiseryFearenabled) then {
    player setVariable [QCLASS(psycosis), (_MFear - 1.5)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

  sleep 1;

  if (EGVAR(common,ace)) then {
  [player, "Misery_cigarettepack", 10, 300, -1, -1, -1] call ace_medical_status_fnc_addMedicationAdjustment;
  };

////---------------------------------------------------
  if (_random > 5) exitWith {

    player addItem "Misery_cigarettepack";

    //This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 250} do {
    _effectSpeed = 1 + random 2;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

};

//---------------------------------------------------no more cigs
if (_random == 5) exitWith {

titleText ["You smoked the last cigarette...", "PLAIN DOWN"];

//This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 250} do {
    _effectSpeed = 1 + random 2;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

};

////---------------------------------------------------

if (_random < 5) exitWith {

player addItem "Misery_cigarettepack";

//This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 250} do {
    _effectSpeed = 1 + random 2;
    player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
    _compteur = _compteur + _effectSpeed;
    sleep 1;
};
player setVariable ["_antirad", nil];

        };
    };
}; //End of code
