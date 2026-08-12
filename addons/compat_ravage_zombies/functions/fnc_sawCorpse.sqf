#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Zombie sawing
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_ravage_zombies_fnc_sawCorpse;
 *
*/

params ["_corpse"];

private _audioSource = playSound selectRandom [MACRO_FIELDDRESS_SAWSOUNDS];

if (_corpse getVariable [QGVAR(processingSkin), false]) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(AlreadyProcessed)] call CBA_fnc_localEvent;
};

if (isNil {_corpse getVariable QGVAR(processingSaw)}) then {
    _corpse setVariable [QGVAR(processingSaw), true, true];
};

[ACE_player, "Gear"] call ACEFUNC(common,doAnimation);

[localize LSTRING(StartSawing),
15,
{_isNear},
{
    params ["_args"];
    _args params ["_corpse", "_audioSource"];

    [ACE_player, "", 1] call ACEFUNC(common,doAnimation);

    if !(isNull _audioSource) then {
        deleteVehicle _audioSource;
    };

    [_corpse] call EFUNC(ballistics,destroy);

    private _specimen = selectRandom [
        QCLASS(zombie_Head),
        QCLASS(zombie_Hand),
        QCLASS(zombie_Foot),
        QCLASS(zombie_Brain),
        QCLASS(zombie_Head),
        QCLASS(zombie_Hand),
        QCLASS(zombie_Foot),
        QCLASS(zombie_Brain),
        QCLASS(zombie_Head),
        QCLASS(zombie_Hand),
        QCLASS(zombie_Foot),
        QCLASS(zombie_Brain)
    ];

    [ACE_player, _specimen, true] call CBA_fnc_addItem;

    [QEGVAR(common,tileText), localize LSTRING(RottenSpecimen)] call CBA_fnc_localEvent;
},
{
    params ["_args"];
    _args params ["_corpse", "_audioSource"];

    [ACE_player, "", 1] call ACEFUNC(common,doAnimation);

    if !(isNull _audioSource) then {
        deleteVehicle _audioSource;
    };

    [QEGVAR(common,tileText), localize LSTRING(StopSawing)] call CBA_fnc_localEvent;

    // Reset processing
    _corpse setVariable [QGVAR(processingSaw), nil, true];
},
[_corpse, _audioSource],
true,
true,
true
] call CBA_fnc_progressBar;
