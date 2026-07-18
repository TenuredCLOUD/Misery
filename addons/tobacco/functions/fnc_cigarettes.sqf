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

[ACE_player] call ACEFUNC(weaponselect,putWeaponAway);

if !([[QCLASS(matchBox), QCLASS(lighter)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoFireSource)] call CBA_fnc_localEvent;
};

[{animationState ACE_player isEqualTo "amovpercmstpsnonwnondnon"}, {

    [QEGVAR(common,tileText), localize LSTRING(LightCigarette)] call CBA_fnc_localEvent;

    [QCLASS(cigarettePack)] call EFUNC(common,itemDecrement);

    if (EGVAR(psychosis,enabled)) then {
        [-0.1, "psychosis"] call EFUNC(common,addStatusModifier);
    };

    ACE_player playGesture QEGVAR(animations,cigarreteIn);

    if ([[QCLASS(matchBox)]] call EFUNC(common,hasItem)) exitWith {
        [QCLASS(matchBox)] call EFUNC(common,itemDecrement);
        playSound QCLASS(audio_sound_matchSmoking);
        [{
            ACE_player playGesture QEGVAR(animations,cigarreteLoop);
        }, [], 2] call CBA_fnc_waitAndExecute;
        [{
            ACE_player playGesture QEGVAR(animations,cigarreteOut);
        }, [], 15] call CBA_fnc_waitAndExecute;
    };

    if ([[QCLASS(lighter)]] call EFUNC(common,hasItem)) exitWith {
        [QCLASS(lighter)] call EFUNC(common,itemDecrement);
        playSound QCLASS(audio_sound_lighterSmoking);
        [{
            ACE_player playGesture QEGVAR(animations,cigarreteLoop);
        }, [], 2] call CBA_fnc_waitAndExecute;
        [{
            ACE_player playGesture QEGVAR(animations,cigarreteOut);
        }, [], 15] call CBA_fnc_waitAndExecute;
    };
}, [], 10] call CBA_fnc_waitUntilAndExecute;
