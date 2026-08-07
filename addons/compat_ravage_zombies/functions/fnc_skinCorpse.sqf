#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Zombie skinning
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_ravage_zombies_fnc_skinCorpse;
 *
*/

params ["_corpse"];

private _audioSource = playSound selectRandom [MACRO_FIELDDRESS_SKINSOUNDS];

if (_corpse getVariable [QGVAR(processingSkin), false]) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(AlreadyProcessed)] call CBA_fnc_localEvent;
};

if (isNil {_corpse getVariable QGVAR(processingSkin)}) then {
    _corpse setVariable [QGVAR(processingSkin), true, true];
};

[ACE_player, "Gear"] call ACEFUNC(common,doAnimation);

[localize LSTRING(StartSkinning),
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
        QCLASS(zombie_Skin),
        QCLASS(zombie_Eye)
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

    [QEGVAR(common,tileText), localize LSTRING(StopSkinning)] call CBA_fnc_localEvent;

    // Reset processing
    _corpse setVariable [QGVAR(processingSkin), nil, true];
},
[_corpse, _audioSource],
true,
true,
true
] call CBA_fnc_progressBar;
