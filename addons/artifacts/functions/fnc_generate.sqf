#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Artifact Groundloot generator
 *
 * Arguments:
 * 0: Module object <OBJECT>
 * 1: number of artifact to spawn <NUMBER>
 * 2: radius of module <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [
 * _module,
 * (_module getVariable QCLASS(ArtifactSpawnnumber)),
 * (_module getVariable QCLASS(ArtifactSpawnradius))
 * ] call misery_artifacts_fnc_generate;
 *
 * Public: No
*/

if (isServer) then {
    private [
        "_module",
        "_numartifacts",
        "_radius",
        "_artifacts",
        "_player",
        "_players",
        "_groundStash",
        "_mpos",
        "_holderArray",
        "_pos",
        "_xpos",
        "_ypos",
        "_zpos",
        "_randomPos",
        "_position",
        "_item",
        "_deleteFlag",
        "_light"
    ];

    _module = _this select 0;
    _numartifacts = _this select 1;
    _radius = _this select 2;

    _artifacts = [QCLASS(artifact_01),QCLASS(artifact_02),QCLASS(artifact_03),QCLASS(artifact_04),QCLASS(artifact_05),QCLASS(artifact_06),QCLASS(artifact_07),QCLASS(artifact_08),QCLASS(artifact_09),QCLASS(artifact_10)];

    _player=objNull;
    _players=call EFUNC(common,ListPlayers);
    _players=_players-(entities "HeadlessClient_F");
    _groundStash=objNull;
    _mpos = getPos _module;

    _holderArray = [];

    //If GRAD persistence is active, push Holders to blacklister for saving so empty piles don't populate on reload of a scenario (This will execute only once)
    if (!isNil "grad_persistence_blacklist") then {
        if ((grad_persistence_blacklist find (toLower "GroundWeaponHolder_Scripted") == -1) && (grad_persistence_blacklist find (toUpper "GroundWeaponHolder_Scripted") == -1)) then {
            ["GroundWeaponHolder_Scripted"] call grad_persistence_fnc_blacklistClasses;
            if (EGVAR(common,debug)) then {systemChat "[Misery Artifact spawner] GRAD Persistence detected, Adding Artifact piles to blacklist for saving / reloading..."};
        };
    };

    for "_i" from 1 to _numartifacts do {
        _pos = getPos _module;
        _xpos = _pos select 0;
        _ypos = _pos select 1;
        _xpos = _xpos + random (_radius * 2) - _radius;
        _ypos = _ypos + random (_radius * 2) - _radius;
        _zpos = getTerrainHeightASL [_xpos, _ypos];
        _randomPos = [_xpos, _ypos, _zpos];

        _groundStash = createVehicle ["GroundWeaponHolder_Scripted", _randomPos, [], 0, "can_Collide"];
        _groundStash setDir (random 360);

        _position = getPosATL _groundStash;
        _position set [2, 0.1];
        _groundStash setPosATL _position;

        _item = _artifacts call bis_fnc_selectRandom;
        _groundStash addItemCargoGlobal [_item, 1];

        _holderArray pushBack _groundStash;
    };

    {
        // Check if artifact spawns under roof, or in building: (Enforce exterior spawns)
        _groundStash = _x;
        if (_x call EFUNC(artifacts,safe)) then {
             if (EGVAR(common,debug)) then {systemChat format ["[Misery Artifact spawner] Artifact at %1 spawned under a roof or inside of a building, deleting...", getPosATL _x]};
            deleteVehicle _x;
        } else {
            _light = "#lightpoint" createVehicle getPos _x;
            _light setLightBrightness 0.1;
            _light setLightColor [random 1, random 1, random 1];
            _light lightAttachObject [_x, [0,0,0]];
            _x setVariable ["Artifact_LightEmission", _light];

    //Add checks to each artifact holder: (garbage collection if empty)
    [_groundStash] spawn {
    params ["_groundStash"];
    while {true} do {
        sleep 5;
        if (count((weaponCargo _groundStash)+(itemCargo _groundStash)+(magazineCargo _groundStash)+(backpackCargo _groundStash)+(weaponsItemsCargo _groundStash)) < 1) exitWith {
            if (EGVAR(common,debug)) then {systemChat format["[Misery Artifact spawner] Loot pile at %1 no longer has an artifact, Deleting...",getPosATL _groundStash];};
            deleteVehicle _groundStash;
            };
        };
    };
};
    } forEach _holderArray;

    _deleteFlag = false;

    waitUntil {
        sleep Misery_ArtifactDeleteTimer;
        {
            _player=_x;
            if ((_player distance _mpos) < Misery_ArtifactDeleteCheckDistance) then {
                _deleteFlag = false;
            } else {
                _deleteFlag = true;
            };
        } forEach _players;
        _deleteFlag
    };

    if (_deleteFlag) exitWith {
        {deleteVehicle _x} forEach _holderArray;
        _module setVariable [QCLASS(Artifacts_Spawned), false, true];
    };
};
