#include "..\script_component.hpp"
/*
Misery persistence
Designed specifically for Misery mod
by TenuredCLOUD
*/

private ["_loadout","_stats","_radiation","_MHunger","_MThirst","_MSleep","_MPoison","_MInfection","_MExposure","_MCartridge","_ailments","_MFear","_ACEdamage","_saveName","_namespace","_MiseryDebuffs","_MiseryCraftingKnowledge","_serialized"];

if !(local player) exitWith{};
if !(alive player) exitWith{};
if ((toUpper(lifeState player)) in ["DEAD","DEAD-RESPAWN","DEAD-SWITCHING"]) exitWith {};

if (MiserysurvivalHardCoreSaveMode == 1 && !([player] call EFUNC(common,NearFire))) exitWith {systemChat format["%1, Hardcore saving mode is active: you must be near a fire to save your character...",profileName]};

_loadout = getUnitLoadout player;
_stats = [damage player, getDir player, getPosATL player, worldName, date, stance player];

_saveName = MiserysurvivalSaveName;

_namespace = [] call CBA_fnc_createNamespace;

_namespace setVariable ["loadout", _loadout];

_namespace setVariable ["stats", _stats];

_ACEdamage = []; //Default

if (EGVAR(common,ace)) then {
    _ACEdamage = [player] call ace_medical_fnc_serializeState;
    _namespace setVariable ["ACE_damage", _ACEdamage];
};

_MiseryDebuffs = [];
_MiseryCraftingKnowledge = [];
_MiseryCookingKnowledge = [];
_MiseryWContainerKnowledge = [];

{
    _var = player getVariable [_x select 0, nil];
    if (!isNil "_var") then {
        _namespace setVariable [_x select 0, _var];
    };
} forEach [
    [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER],
    [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST],
    [QEGVAR(survival,energyDeficit), MACRO_PLAYER_FATIGUE],
    [QEGVAR(survival,toxicity), MACRO_PLAYER_TOXICITY],
    [QEGVAR(survival,infection), MACRO_PLAYER_INFECTION],
    [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE],
    [QCLASS(gasmaskCartridgeLevel), 100],
    [QEGVAR(survival,radiation), 0],
    [QCLASS(psycosis), MACRO_PLAYER_FEAR],
    [QCLASS(infectionLogged), nil],
    [QCLASS(turbidWaterLogged), nil],
    [QCLASS(rawMeatLogged), nil],
    [QCLASS(ailments), _MiseryDebuffs],
    [QCLASS(craftingKnowledge), _MiseryCraftingKnowledge],
    [QCLASS(cookingKnowledge), _MiseryCookingKnowledge],
    [QCLASS(hydrologyKnowledge), _MiseryWContainerKnowledge],
    [QCLASS(currency), 0],
    [QCLASS(bankedCurrency), 0]
];

if !(EGVAR(common,checkMultiplayer)) then {
    _units = units player;
    _unitDetails = [];
    {
        _unitType = typeOf _x;
        _unitloadout = getUnitLoadout _x;
        _unitstats = [damage _x, getDir _x, getPosATL _x, stance _x];
        _unitACEdamage = [];
        if (EGVAR(common,ace)) then {
            _unitACEdamage = [_x] call ace_medical_fnc_serializeState;
        };
        _unitDetails pushBack [_unitType, _unitloadout, _unitstats, _unitACEdamage];
    } forEach _units;
    _namespace setVariable ["unitDetails", _unitDetails];
};

_serialized = [_namespace] call CBA_fnc_serializeNamespace;

profileNamespace setVariable [_saveName, _serialized];

if (MiserysurvivalSaveScript != "") then {
    [player] call MiserysurvivalSaveScript
};

_namespace call CBA_fnc_deleteNamespace;
