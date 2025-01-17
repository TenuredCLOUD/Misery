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

private _hasMatch = [[QCLASS(matches)]] call EFUNC(common,hasItem);
private _hasLighter = [[QCLASS(lighter)]] call EFUNC(common,hasItem);

if !(_hasMatch && _hasLighter) exitWith {
    titleText ["You need a lighter or matches to smoke...", "PLAIN DOWN"];
};

titleText ["You light up a cigarette...", "PLAIN DOWN"];

[QCLASS(cigarettePack), ""] call EFUNC(common,itemDecrement);

if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(cigarettePack), 10, 300, -1, -1, -1] call ace_medical_status_fnc_addMedicationAdjustment;
};

if (EGVAR(psychosis,enabled)) then {
    [-0.1] call EFUNC(psychosis,addModifier);
};

if (_hasMatch) exitWith {
    [QCLASS(matches), ""] call EFUNC(common,itemDecrement);
    playSound3D [QPATHTOEF(audio,sounds\immersion\Matchsmoking.ogg), player, false, getPosASL player, 4, 1, 10];
};

if (_hasLighter) exitWith {
    [QCLASS(lighter), ""] call EFUNC(common,itemDecrement);
    playSound3D [QPATHTOEF(audio,sounds\immersion\Lightersmoking.ogg), player, false, getPosASL player, 4, 1, 10];
};
