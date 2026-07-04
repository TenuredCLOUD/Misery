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

[player] call ACEFUNC(weaponselect,putWeaponAway);

if !([[QCLASS(matchBox), QCLASS(lighter)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoFireSource)] call CBA_fnc_localEvent;
};

[{animationState player isEqualTo "amovpercmstpsnonwnondnon"}, {

    [QEGVAR(common,tileText), localize LSTRING(LightCigar)] call CBA_fnc_localEvent;

    player removeItem QCLASS(cigar);

    if (EGVAR(psychosis,enabled)) then {
        [-0.2, "psychosis"] call EFUNC(common,addStatusModifier);
    };

    player playGesture QEGVAR(animations,cigarreteIn);

    if ([[QCLASS(matchBox)]] call EFUNC(common,hasItem)) exitWith {
        [QCLASS(matchBox)] call EFUNC(common,itemDecrement);
        playSound QCLASS(audio_sound_matchSmoking);
        [{
            player playGesture QEGVAR(animations,cigarreteLoop);
        }, [], 2] call CBA_fnc_waitAndExecute;
        [{
            player playGesture QEGVAR(animations,cigarreteOut);
        }, [], 15] call CBA_fnc_waitAndExecute;
    };

    if ([[QCLASS(lighter)]] call EFUNC(common,hasItem)) exitWith {
        [QCLASS(lighter)] call EFUNC(common,itemDecrement);
        playSound QCLASS(audio_sound_lighterSmoking);
        [{
            player playGesture QEGVAR(animations,cigarreteLoop);
        }, [], 2] call CBA_fnc_waitAndExecute;
        [{
            player playGesture QEGVAR(animations,cigarreteOut);
        }, [], 15] call CBA_fnc_waitAndExecute;
    };
}, [], 10] call CBA_fnc_waitUntilAndExecute;
