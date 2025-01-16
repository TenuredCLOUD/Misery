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

private _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_PSYCHOSIS];

if !(QCLASS(matches) in magazines player || QCLASS(lighter) in magazines player) exitWith {titleText ["You need a lighter or matches to smoke...", "PLAIN DOWN"]};

  if (QCLASS(matches) in magazines player) then {

    titleText ["You light up a cigarette...", "PLAIN DOWN"];

    [QCLASS(cigarettePack), ""] call EFUNC(common,itemDecrement);
    [QCLASS(matches), ""] call EFUNC(common,itemDecrement);

    playSound3D [QPATHTOEF(audio,sounds\immersion\Matchsmoking.ogg), player, false, getPosASL player, 4, 1, 10];

  if (EGVAR(fear,enabled)) then {
    player setVariable [QCLASS(psycosis), (_MFear - 1.5)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

  if (EGVAR(common,ace)) then {
  [player, QCLASS(cigarettePack), 10, 300, -1, -1, -1] call ace_medical_status_fnc_addMedicationAdjustment;
  };

[{
    player setVariable [QCLASS(radiation), -25 - random 25];
    if ((player getVariable [QCLASS(radiation), 0]) < 0) then {
        player setVariable [QCLASS(radiation), 0];
    };
}, [], 10] call CBA_fnc_waitAndExecute;

}else{

if (QCLASS(lighter) in magazines player) then {

  titleText ["You light up a cigarette...", "PLAIN DOWN"];

  [QCLASS(cigarettePack), ""] call EFUNC(common,itemDecrement);
  [QCLASS(lighter), ""] call EFUNC(common,itemDecrement);

  playSound3D [QPATHTOEF(audio,sounds\immersion\Lightersmoking.ogg), player, false, getPosASL player, 4, 1, 10];

  if (EGVAR(fear,enabled)) then {
    player setVariable [QCLASS(psycosis), (_MFear - 1.5)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

  if (EGVAR(common,ace)) then {
  [player, QCLASS(cigarettePack), 10, 300, -1, -1, -1] call ace_medical_status_fnc_addMedicationAdjustment;
  };

[{
    player setVariable [QCLASS(radiation), -25 - random 25];
    if ((player getVariable [QCLASS(radiation), 0]) < 0) then {
        player setVariable [QCLASS(radiation), 0];
    };
}, [], 10] call CBA_fnc_waitAndExecute;

  };
};
