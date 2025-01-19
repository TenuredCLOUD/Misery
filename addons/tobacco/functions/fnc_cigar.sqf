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

private _hasMatch = [[QCLASS(matches)]] call EFUNC(common,hasItem);
private _hasLighter = [[QCLASS(lighter)]] call EFUNC(common,hasItem);

if !(_hasMatch && _hasLighter) exitWith {
    titleText ["You need a lighter or matches to smoke...", "PLAIN DOWN"];
};

titleText ["You light up a cigar...", "PLAIN DOWN"];

player removeItem QCLASS(cigar);

if (EGVAR(psychosis,enabled)) then {
    [-0.1, "psychosis"] call EFUNC(common,addModifier);
};

if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(cigar), 10, 300, -5, -5, -5, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

if (_hasMatch) exitWith {
    [QCLASS(matches), ""] call EFUNC(common,itemDecrement);
    playSound3D [QPATHTOEF(audio,sounds\immersion\Matchsmoking.ogg), player, false, getPosASL player, 4, 1, 10];
};

if (_hasLighter) exitWith {
    [QCLASS(lighter), ""] call EFUNC(common,itemDecrement);
    playSound3D [QPATHTOEF(audio,sounds\immersion\Lightersmoking.ogg), player, false, getPosASL player, 4, 1, 10];
};
