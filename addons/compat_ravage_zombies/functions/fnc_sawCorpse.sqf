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

[player, ["zombie"], 2] call EFUNC(common,nearCorpse) params ["_isNear", "_corpse"];

private _audioSource = playSound selectRandom [MACRO_FIELDDRESS_SAWSOUNDS];

if (_corpse getVariable [QGVAR(processingSkin), false]) exitWith {
    [QEGVAR(common,tileText), "This corpse is being processed already..."] call CBA_fnc_localEvent;
};

if (isNil {_corpse getVariable QGVAR(processingSkin)}) then {
    _corpse setVariable [QGVAR(processingSkin), true, true];
};

player playAction "Gear";

["You start to saw the corpse...",
15,
{_isNear},
{
    params ["_args"];
    _args params ["_corpse", "_audioSource"];

    player playAction "";

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

    [player, _specimen, true] call CBA_fnc_addItem;

    [QEGVAR(common,tileText), "You collect your specimen, but the rest of the corpse is too rotten for any more specimens..."] call CBA_fnc_localEvent;
},
{
    params ["_args"];
    _args params ["_corpse", "_audioSource"];

    player playAction "";

    if !(isNull _audioSource) then {
        deleteVehicle _audioSource;
    };

    [QEGVAR(common,tileText), "You stop sawing the corpse..."] call CBA_fnc_localEvent;

    // Reset processing
    _corpse setVariable [QGVAR(processingSaw), nil, true];
},
[_corpse, _audioSource],
true,
true,
true
] call CBA_fnc_progressBar;
