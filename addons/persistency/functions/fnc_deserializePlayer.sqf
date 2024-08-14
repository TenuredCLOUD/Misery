#include "..\script_component.hpp"
/*
Misery persistence
Designed specifically for Misery mod
by TenuredCLOUD
*/

private ["_loadout","_stats","_status","_ACEdamage","_saveName","_namespace","_serialized","_var","_MiseryDebuffs","_MiseryCraftingKnowledge"];

_saveName = MiserysurvivalSaveName;

_serialized = profileNamespace getVariable _saveName;

_namespace = [_serialized] call CBA_fnc_deserializeNamespace;

_loadout = _namespace getVariable "loadout";

_stats = _namespace getVariable "stats";

if (MiseryACE) then {
    _ACEdamage = _namespace getVariable "ACE_damage";
    if (!isNil "_ACEdamage") then {
        [player, _ACEdamage] call ace_medical_fnc_deserializeState;
    };
};

player setUnitLoadout _loadout;
player setDir(_stats select 1);
if!((count(_stats select 2))==0)then{
_pos=_stats select 2;
player setPosATL[_pos select 0,_pos select 1,_pos select 2];
};

_MiseryDebuffs = [];
_MiseryCraftingKnowledge = [];
_MiseryCookingKnowledge = [];
_MiseryWContainerKnowledge = [];

{
    _var = _namespace getVariable [_x select 0, nil];
    if (!isNil "_var") then {
        player setVariable [_x select 0, _var];
    };
} forEach [
    ["MiseryHunger", MIS_HUNGER],
    ["MiseryThirst", MIS_THIRST],
    ["MiserySleepiness", MIS_SLEEP],
    ["MiseryPoison", MIS_POISON],
    ["MiseryInfection", MIS_INFECTION],
    ["MiseryExposure", MIS_EXPOSURE],
    ["Miserycartridge", 100],
    ["MiseryRadiation", 0],
    ["MiseryFear", MIS_FEAR],
    ["Zinfectionlogged", nil],
    ["Turbidwaterlogged", nil],
    ["Rawmeatlogged", nil],
    ["MiseryDebuffs", _MiseryDebuffs],
    ["Misery_Crafting_DataSet", _MiseryCraftingKnowledge],
    ["Misery_Cooking_DataSet", _MiseryCookingKnowledge],
    ["Misery_WaterCollect_DataSet", _MiseryWContainerKnowledge],
    ["MiseryCurrency", 0],
    ["MiseryCurrency_Banked", 0]
];

if !(MiseryMP) then {
    _unitDetails = _namespace getVariable ["unitDetails", []];
    _playerLoadout = getUnitLoadout player;

    {
        if (count _x < 4) then {continue;};

        _unitType = _x select 0;
        _unitLoadout = _x select 1;
        _unitStats = _x select 2;
        _unitACEdamage = _x select 3;

        if (isNil "_unitType" || isNil "_unitLoadout" || isNil "_unitStats") then {continue;};

        if (_unitType == typeOf player && _unitLoadout isEqualTo _playerLoadout) then {
            continue;
        };

        _newUnit = group player createUnit [_unitType, position player, [], 0, "NONE"];

        _newUnit setUnitLoadout _unitLoadout;

        _newUnit setDamage (_unitStats select 0);
        _newUnit setDir (_unitStats select 1);
        _newUnit setPos (_unitStats select 2);
        switch (_unitstats select 3) do {
        case "STAND": {_newUnit playAction "PlayerStand";};
        case "CROUCH": {_newUnit playAction "PlayerCrouch";};
        case "PRONE": {_newUnit playAction "PlayerProne";};
        };

        if (MiseryACE && !isNil "_unitACEdamage") then {
            [_newUnit, _unitACEdamage] call ace_medical_fnc_deserializeState;
        };
    } forEach _unitDetails;
};

if!((_stats select 3)==worldName)then{
    systemChat "Different worldName";
};

if!(MiseryMP)then{setDate(_stats select 4)};
systemChat format["Misery character loaded: %1",_saveName];

if !(MiserysurvivalLoadScript=="") then {[player] execVM MiserysurvivalLoadScript};

switch (_stats select 5) do {
    case "STAND": {player playAction "PlayerStand";};
    case "CROUCH": {player playAction "PlayerCrouch";};
    case "PRONE": {player playAction "PlayerProne";};
};

_namespace call CBA_fnc_deleteNamespace;
