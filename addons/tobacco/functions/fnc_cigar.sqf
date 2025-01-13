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

    if !(QCLASS(matches) in magazines player || QCLASS(lighter) in items player) exitWith {titleText ["You need a lighter or matches to smoke...", "PLAIN DOWN"];};

    if (QCLASS(matches) in magazines player) then {

    titleText ["You light up a cigar...", "PLAIN DOWN"];

    player removeItem QCLASS(cigar);
    [QCLASS(matches), ""] call EFUNC(common,itemDecrement);

    playSound3D [QPATHTOEF(audio,sounds\immersion\Matchsmoking.ogg), player, false, getPosASL player, 4, 1, 10];

  if (EGVAR(fear,enabled)) then {
    player setVariable [QCLASS(psycosis), (_MFear - 3)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

if (EGVAR(common,ace)) then {
    [player, QCLASS(cigar), 10, 300, -5, -5, -5] call ace_medical_status_fnc_addMedicationAdjustment;
};

[{
    player setVariable [QCLASS(radiation), -50 - random 50];
    if ((player getVariable [QCLASS(radiation), 0]) < 0) then {
        player setVariable [QCLASS(radiation), 0];
    }; 
}, [], 10] call CBA_fnc_waitAndExecute;

}else{

if (QCLASS(lighter) in magazines player) then {

    titleText ["You light up a cigar...", "PLAIN DOWN"];

    playSound3D [QPATHTOEF(audio,sounds\immersion\Lightersmoking.ogg), player, false, getPosASL player, 4, 1, 10];

    player removeItem QCLASS(cigar);
    [QCLASS(lighter), ""] call EFUNC(common,itemDecrement);

  if (EGVAR(fear,enabled)) then {
    player setVariable [QCLASS(psycosis), (_MFear - 3)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

if (EGVAR(common,ace)) then {
    [player, QCLASS(cigar), 10, 300, -5, -5, -5] call ace_medical_status_fnc_addMedicationAdjustment;
};

[{
    player setVariable [QCLASS(radiation), -50 - random 5];
    if ((player getVariable [QCLASS(radiation), 0]) < 0) then {
        player setVariable [QCLASS(radiation), 0];
    }; 
}, [], 10] call CBA_fnc_waitAndExecute;
  };
};

