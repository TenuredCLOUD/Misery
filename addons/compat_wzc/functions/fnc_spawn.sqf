#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient creature groups Generator
 * Generates creatures around players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_spawn;
 *
 * Public: No
*/

if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {};

private _numEntities = [1, GVAR(clusterSize)] call BIS_fnc_randomInt;

private _players = call EFUNC(common,listPlayers);
private _selectedPlayer = selectRandom _players;

// If no players in game exit spawner
if (_players isEqualTo []) exitWith {};

private _markerPos = getPosATL _selectedPlayer;
private _playerUID = getPlayerUID _selectedPlayer;

private _markerName = format ["%1_%2_%3", CBA_missionTime, _playerUID, random 100];
private _marker = createMarkerLocal [_markerName, _markerPos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [GVAR(markerSizeX), GVAR(markerSizeY)];
_marker setMarkerAlphaLocal 0;

for "_i" from 1 to _numEntities do {

    // recheck every spawn cycle
    if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {break};

    private _outsidePos = [_marker, true] call CBA_fnc_randPosArea;

    if (_outsidePos isEqualTo [] || surfaceIsWater _outsidePos) exitWith {
        [QUOTE(COMPONENT_BEAUTIFIED), "AI Spawner: Invalid position or position in water, skipping"] call EFUNC(common,debugMessage);
        continue;
    };

    private _type = [] call FUNC(findClass);

    private _group = createGroup resistance;

    private _unit = objNull;

    if ([GVAR(spawnChance)] call EFUNC(common,rollChance)) then {
        if (_type isEqualType "") then {
            private _class = if (_type isEqualTo "GOLIATH") then {
                selectRandom [MACRO_WZC_SPECIAL];
            } else {
                selectRandom [MACRO_WZC_SPECIAL_ZOMBIES];
            };
            _unit = _group createUnit [_class, _outsidePos, [], 0, "NONE"];
        } else {
            private _unit = _group createUnit ["WBK_C_ExportClass", _outsidePos, [], 0, "NONE"];
            [_unit, _type] call FUNC(randomGear);
            [_unit, _type] call WBK_LoadAIThroughEden;
            _unit setDamage 0.5; // apply blood effect to all regular zombie types
            _unit setSpeaker "NoVoice"; // ensure no callouts, even with single grouped units
        };
    };

    _unit addEventHandler ["Killed", {
        params ["_unit"];
        addToRemainsCollector [_unit];
    }];

    if (!isNil "grad_persistence_blacklist") then {
        [_unit] call grad_persistence_fnc_blacklistObjects;
    };

    _unit enableDynamicSimulation true;

    GVAR(registeredEntities) pushBack _group;
};

[{
    deleteMarkerLocal _this;
}, _marker, 1] call CBA_fnc_waitAndExecute;

