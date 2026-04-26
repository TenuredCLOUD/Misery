#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Split wooden logs
 * Enables players to reform wood logs to firewood (Chainsaw or Axe compatible)
 *
 * Arguments:
 * 0: Has axe <BOOL>
 * 1: Has saw <BOOL>
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_splitWoodAction;
 *
*/

params ["_hasAxe", "_hasSaw"];

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

private _toolUsed = switch (true) do {
    case (_hasAxe && !_hasSaw): {[QCLASS(audio_sound_chopWood), 0, localize LSTRING(ChoppingLog), 10]};
    case (_hasSaw && !_hasAxe): {[QCLASS(audio_sound_chainsawSplit), 1, localize LSTRING(SawingLog), 15]};
    case (_hasAxe && _hasSaw): {[QCLASS(audio_sound_chainsawSplit), 1, localize LSTRING(SawingLog), 15]};
};

_soundDummy say3D [_toolUsed select 0, 500];

if (_toolUsed select 1 isEqualTo 1) then {
    player setVariable [QGVAR(cuttingWood), true];

    call FUNC(chainsawFuelDecrement);
};

[_toolUsed select 2,
_toolUsed select 3,
{true},
{
    params ["_args"];
    _args params ["_toolUsed"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [player, QCLASS(woodenlog)] call CBA_fnc_removeItem;

    [position player, [[QCLASS(firewood), selectRandom [1, 2]]]] call EFUNC(common,spawnLoot);

    if (_toolUsed select 1 isEqualTo 1) then {
        player setVariable [QGVAR(cuttingWood), nil];
    };
},
{
    params ["_args"];
    _args params ["_toolUsed"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    if (_toolUsed select 1 isEqualTo 1) then {
        player setVariable [QGVAR(cuttingWood), nil];
        [QEGVAR(common,tileText), localize LSTRING(StopSawingLog)] call CBA_fnc_localEvent;
    } else {
        [QEGVAR(common,tileText), localize LSTRING(StopSplittingLog)] call CBA_fnc_localEvent;
    };
},
[_toolUsed]
] call CBA_fnc_progressBar;
