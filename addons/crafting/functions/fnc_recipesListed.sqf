#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Framework List populater for Recipes, based on players crafting xp
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_crafting_fnc_recipesListed
 *
 * Public: No
*/

[{!isNull findDisplay 982376}, {
    private _list = findDisplay 982376 displayCtrl 1500;
    private _playerXP = player getVariable [QGVAR(xp), MACRO_PLAYER_DEFAULTS_LOW];

    private _progressBar = findDisplay 982376 displayCtrl 1010;
    _progressBar ctrlShow false; // Hide progresss bar on GUI load

    lbClear _list;

    {
        private _outputItem = _x select 0;
        private _requiredXP = _x select 7;

        if (_playerXP >= _requiredXP) then {
            private _displayName = getText (configFile >> "CfgWeapons" >> _outputItem >> "displayName");
            if (_displayName isEqualTo "") then {
                _displayName = getText (configFile >> "CfgMagazines" >> _outputItem >> "displayName");
            };
            if (_displayName isEqualTo "") then {
                _displayName = _outputItem; // Fallback to classname
            };

            private _index = _list lbAdd _displayName;
            _list lbSetData [_index, _outputItem];
        };
    } forEach GVAR(craftingRecipes);
}, []] call CBA_fnc_waitUntilAndExecute;
