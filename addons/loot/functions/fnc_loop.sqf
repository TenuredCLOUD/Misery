#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Loot Server Loop, Monitors Players positions relative to buildings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_loop;
 *
*/

if (!GVAR(enabled)) exitWith {};

private _players = call EFUNC(common,listPlayers);

{
    private _player = _x;

    [_player, 100] call EFUNC(common,nearBuilding) params ["", "", "_nearBuildings"];

    {
        private _building = _x;
        private _buildingType = typeOf _building;
        if (_buildingType in GVAR(buildingBlacklist) || _building in GVAR(building_used)) exitWith {continue};

        private _buildingPositions = _building buildingPos -1;

        {
            private _buildingName = toLower getText (configFile >> "CfgVehicles" >> _buildingType >> "displayName");
            private _isMilitary = false;
            private _isMedical = false;
            private _isStore = false;
            private _isGarage = false;

            switch true do {
                case (["barracks", "military", "guardhouse", "terminal", "bunker"] findIf {_x in _buildingName} isNotEqualTo -1): {
                    _isMilitary = true;
                };
                case (["medical", "hospital"] findIf {_x in _buildingName} isNotEqualTo -1): {
                    _isMedical = true;
                };
                case (["store", "grocery", "shop"] findIf {_x in _buildingName} isNotEqualTo -1): {
                    _isStore = true;
                };
                case (["workshop", "garage", "factory", "hangar", "shed", "cowshed"] findIf {_x in _buildingName} isNotEqualTo -1): {
                    _isGarage = true;
                };
            };

            // Adjust chance for military buildings
            private _chance = [GVAR(chance), GVAR(chance) * 2.5] select _isMilitary;

            if (_chance < random 100) exitWith {continue};
            [_x, _isMilitary, _isMedical, _isStore, _isGarage] call FUNC(generate);
            GVAR(building_used) pushBack _building;
        } forEach _buildingPositions;
    } forEach _nearBuildings;
} forEach _players;

// Loop loot check & generation every 10 seconds
[{
    [] call FUNC(loop);
}, [], 10] call CBA_fnc_waitAndExecute;
