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

[ACE_player] call ACEFUNC(weaponselect,putWeaponAway);

if !([[QCLASS(matchBox), QCLASS(lighter)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoFireSource)] call CBA_fnc_localEvent;
};

[{animationState ACE_player isEqualTo "amovpercmstpsnonwnondnon"}, {

    [QEGVAR(common,tileText), localize LSTRING(LightCigar)] call CBA_fnc_localEvent;

    [QCLASS(cigar)] call EFUNC(common,itemDecrement);

    if (EGVAR(psychosis,enabled)) then {
        [-0.2, "psychosis"] call EFUNC(common,addStatusModifier);
    };

    [ACE_player, QEGVAR(animations,cigarreteIn)] call ACEFUNC(common,doGesture);

    if ([[QCLASS(matchBox)]] call EFUNC(common,hasItem)) exitWith {
        [QCLASS(matchBox)] call EFUNC(common,itemDecrement);
        playSound QCLASS(audio_sound_matchSmoking);
        [{
            [ACE_player, QEGVAR(animations,cigarreteLoop)] call ACEFUNC(common,doGesture);
        }, [], 2] call CBA_fnc_waitAndExecute;
        [{
            [ACE_player, QEGVAR(animations,cigarreteOut)] call ACEFUNC(common,doGesture);
        }, [], 15] call CBA_fnc_waitAndExecute;
    };

    if ([[QCLASS(lighter)]] call EFUNC(common,hasItem)) exitWith {
        [QCLASS(lighter)] call EFUNC(common,itemDecrement);
        playSound QCLASS(audio_sound_lighterSmoking);
        [{
            [ACE_player, QEGVAR(animations,cigarreteLoop)] call ACEFUNC(common,doGesture);
        }, [], 2] call CBA_fnc_waitAndExecute;
        [{
            [ACE_player, QEGVAR(animations,cigarreteOut)] call ACEFUNC(common,doGesture);
        }, [], 15] call CBA_fnc_waitAndExecute;
    };
}, [], 10] call CBA_fnc_waitUntilAndExecute;
