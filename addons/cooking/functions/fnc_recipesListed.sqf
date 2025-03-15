#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cooking Framework List Populator
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_cooking_fnc_recipesListed
 *
 * Public: No
*/

[{!isNull findDisplay 982379}, {
    private _list = findDisplay 982379 displayCtrl 1500;
    private _playerXP = player getVariable [QGVAR(xp), MACRO_PLAYER_DEFAULTS_LOW];

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
                _displayName = _outputItem;
            };

            private _index = _list lbAdd _displayName;
            _list lbSetData [_index, _outputItem];
        };
    } forEach EGVAR(common,cookingRecipes);
}, []] call CBA_fnc_waitUntilAndExecute;
