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
 * [] call misery_ambient_ai_fnc_generation;
 *
 * Public: No
*/

if ((count GVAR(registeredEntities)) >= GVAR(maxUnits)) exitWith {};

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

private _group = createGroup GVAR(factionType);

private _numEntities = [1, GVAR(groupSize)] call BIS_fnc_randomInt;

private _players = call EFUNC(common,listPlayers);
private _selectedPlayer = selectRandom _players;

private _markerPos = getPosATL _selectedPlayer;
private _playerUID = getPlayerUID _selectedPlayer;

private _markerName = format ["%1_%2_%3", CBA_missionTime, _playerUID, random 100];
private _marker = createMarkerLocal [_markerName, _markerPos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [GVAR(markerSizeX), GVAR(markerSizeY)];
_marker setMarkerAlphaLocal 0;

for "_i" from 1 to _numEntities do {
    private _outsidePos = [_marker, true] call CBA_fnc_randPosArea;

        if (_outsidePos isEqualTo [] || surfaceIsWater _outsidePos) exitWith {
            [QUOTE(COMPONENT_BEAUTIFIED), "AI Spawner: Invalid position or position in water, skipping"] call EFUNC(common,debugMessage);
            continue;
        };

    private _randomweaploadout = [0, 5] call BIS_fnc_randomInt;
    private _randomvestloadout = [1, 2] call BIS_fnc_randomInt;
    private _randombackpackloadout = [1, 2] call BIS_fnc_randomInt;
    private _randomNVGloadout = [1, 2] call BIS_fnc_randomInt;
    private _randomFacewearloadout = [1, 2] call BIS_fnc_randomInt;
    private _randomHeadgearloadout = [1, 2] call BIS_fnc_randomInt;
    private _randomammocount = [1, GVAR(ammoCount)] call BIS_fnc_randomInt;

    if (GVAR(spawnChance) > (random 100)) then {
        private _unit = _group createUnit [GVAR(aiClass), _outsidePos, [], 0, "FORM"];
    };

    _unit addEventHandler ["Killed", {
    params ["_unit"];
    addToRemainsCollector [_unit];
    }];

    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    if (_randomweaploadout == 0) then {
        if (count GVAR(primaryWeapons) > 0) then {[_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon};
        if (count GVAR(secondaryWeapons) > 0) then {[_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon};
        if (count GVAR(launcherWeapons) > 0) then {[_unit, selectRandom GVAR(launcherWeapons), 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 1) then {
        if (count GVAR(primaryWeapons) > 0) then {[_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 2) then {
        if (count GVAR(secondaryWeapons) > 0) then {[_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 3) then {
        if (count GVAR(primaryWeapons) > 0) then {[_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon};
        if (count GVAR(secondaryWeapons) > 0) then {[_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 4) then {
        if (count GVAR(primaryWeapons) > 0) then {[_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon};
        if (count GVAR(launcherWeapons) > 0) then {[_unit, selectRandom GVAR(launcherWeapons), 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 5) then {
        if (count GVAR(secondaryWeapons) > 0) then {[_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon};
        if (count GVAR(launcherWeapons) > 0) then {[_unit, selectRandom GVAR(launcherWeapons), 0] call BIS_fnc_addWeapon};
    };

    if (count GVAR(uniform) > 0) then {_unit forceAddUniform selectRandom GVAR(uniform)};

    if (_randomvestloadout == 1) then {
        if (count GVAR(vest) > 0) then {_unit addVest selectRandom GVAR(vest)};
    };

    if (_randombackpackloadout == 1) then {
        if (count GVAR(backpack) > 0) then {_unit addBackpack selectRandom GVAR(backpack)};
    };

    if (_randomNVGloadout == 1) then {
        if (count GVAR(nvgs) > 0) then {_unit linkItem selectRandom GVAR(nvgs)};
    };

    if (_randomFacewearloadout == 1) then {
        if (count GVAR(facewear) > 0) then {_unit addGoggles selectRandom GVAR(facewear)};
    };

    if (_randomHeadgearloadout == 1) then {
        if (count GVAR(headgear) > 0) then {_unit addHeadgear selectRandom GVAR(headgear)};
    };

    if ((_unit ammo (primaryWeapon _unit)) isEqualTo 0) then {
        _magazinearrayP = getArray (configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
        if (_magazinearrayP isNotEqualTo []) then {
            _magP = _magazinearrayP select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magP;};
        };
    };

    if ((_unit ammo (handgunWeapon _unit)) isEqualTo 0) then {
        _magazinearrayH = getArray (configFile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
        if (_magazinearrayH isNotEqualTo []) then {
            _magH = _magazinearrayH select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magH;};
        };
    };

    if ((_unit ammo (secondaryWeapon _unit)) isEqualTo 0) then {
        _magazinearrayS = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
        if (_magazinearrayS isNotEqualTo []) then {
            _magS = _magazinearrayS select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magS;};
        };
    };

    reload _unit;

    _unit setSkill ["aimingAccuracy", GVAR(accuracy)];
    _unit setSkill ["aimingShake", GVAR(shake)];
    _unit setSkill ["aimingSpeed", GVAR(speed)];

    if !(EGVAR(common,checkMultiplayer)) then {
        if (side _unit isEqualTo side player) then {
            private _equipmentMass = loadAbs _unit / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
            private _recruitmentCost = 500 * round(_equipmentMass * 100);
            private _Unitidentity = name _unit;

            [
                _unit,
                format [localize "STR_MISERY_RECRUITUNIT", _Unitidentity, EGVAR(money,symbol), [_recruitmentCost] call Misery_fnc_formatNumber],
                "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
                "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
                "_this distance _target < 3",
                "_caller distance _target < 3",
                {},
                {},
                {
                    params ["_target", "_caller", "_actionId", "_arguments"];
                    private _recruitmentCost = _arguments select 0;
                    private _Unitidentity = _arguments select 1;
                    private _playerMoney = _caller getVariable QCLASS(currency);
                    if (_playerMoney >= _recruitmentCost) then {
                        _caller setVariable [QCLASS(currency), _playerMoney - _recruitmentCost];
                        [_target] joinSilent _caller;
                        [_target,_actionId] call BIS_fnc_holdActionRemove;
                        private _recruitSuccess = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_RECRUITUNIT_SUCCESS", _Unitidentity, EGVAR(money,symbol), [_recruitmentCost] call Misery_fnc_formatNumber]];
                        [QEGVAR(common,tileText), _recruitSuccess] call CBA_fnc_localEvent;
                    } else {
                        private _recruitFail = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_RECRUITUNIT_FAIL",_Unitidentity]];
                        [QEGVAR(common,tileText), _recruitFail] call CBA_fnc_localEvent;
                    };
                },
                {},
                [_recruitmentCost, _Unitidentity],
                0.1,
                nil,
                false,
                false
            ] call BIS_fnc_holdActionAdd;
        };
    };
};

[{
    deleteMarkerLocal _this;
}, _marker, 1] call CBA_fnc_waitAndExecute;

{
    if (count GVAR(items) > 0) then {
        for "_i" from 1 to 5 do {_x addItem (selectRandom GVAR(items));};
    };
} forEach (units _group);

_group enableDynamicSimulation true;

GVAR(registeredEntities) pushBack _group;

[_group] call FUNC(patrol);