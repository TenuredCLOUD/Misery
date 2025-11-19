#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI groups Generator
 * Generates highly reactive AI around players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_spawn;
 *
 * Public: No
*/

if ((count GVAR(registeredEntities)) >= GVAR(maxGroups)) exitWith {};

private _unitCase = switch (true) do {
    case (GVAR(faction) isEqualTo 0): {"BLUFOR"};
    case (GVAR(faction) isEqualTo 1): {"OPFOR"};
    case (GVAR(faction) isEqualTo 2): {"Civilian"};
    case (GVAR(faction) isEqualTo 3): {"Independant"};
};

switch (_unitCase) do {
    case "BLUFOR": {
        GVAR(factionType) = west;
        GVAR(aiClass) = "B_Survivor_F";
    };
    case "OPFOR": {
        GVAR(factionType) = east;
        GVAR(aiClass) = "O_G_Survivor_F";
    };
    case "Civilian": {
        GVAR(factionType) = civilian;
        GVAR(aiClass) = "C_man_1";
    };
    case "Independant": {
        GVAR(factionType) = independent;
        GVAR(aiClass) = "I_G_Survivor_F";
    };
};

private _unit = objNull;

private _group = createGroup GVAR(factionType);

private _numEntities = [1, GVAR(groupSize)] call BIS_fnc_randomInt;

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

private _outsidePos = [_marker, true] call CBA_fnc_randPosArea;

for "_i" from 1 to _numEntities do {

    if (_outsidePos isEqualTo [] || surfaceIsWater _outsidePos) exitWith {
        [QUOTE(COMPONENT_BEAUTIFIED), "AI Spawner: Invalid position or position in water, skipping"] call EFUNC(common,debugMessage);
        continue;
    };

    if ([GVAR(spawnChance)] call EFUNC(common,rollChance)) then {
        _unit = _group createUnit [GVAR(aiClass), _outsidePos, [], 0, "FORM"];
    };

    _unit addEventHandler ["Killed", {
        params ["_unit"];
        addToRemainsCollector [_unit];
    }];

    [_unit] call FUNC(randomGear);

    if !(isMultiplayer) then {
        [_unit] call FUNC(addRecruitOption);
    };

    if (!isNil "grad_persistence_blacklist") then {
        [_unit] call grad_persistence_fnc_blacklistObjects;
    };
};

[{
    deleteMarkerLocal _this;
}, _marker, 1] call CBA_fnc_waitAndExecute;

_group enableDynamicSimulation true;

GVAR(registeredEntities) pushBack _group;
