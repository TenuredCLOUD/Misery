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

    [982379, [1010], false] call EFUNC(common,displayShowControls);

    lbClear _list;

    {
        private _outputItem = _x select 0;
        private _requiredXP = _x select 7;

        if (_playerXP >= _requiredXP) then {

            [_outputItem] call EFUNC(common,getItemData) params ["_displayName"];

            private _index = _list lbAdd _displayName;
            _list lbSetData [_index, _outputItem];
        };
    } forEach GVAR(cookingRecipes);
}, []] call CBA_fnc_waitUntilAndExecute;
