#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handle item use from inventory
 *
 * Arguments:
 * 0: Dialog <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [dialog] call misery_inventory_fnc_handleItemUse;
 *
 * Public: No
*/

params ["_dialog"];

private _list = _dialog displayCtrl 1503;
private _selectedItem = _list lbData (lbCurSel _list);

if (_selectedItem isEqualTo "") exitWith {
    [QEGVAR(common,inventoryTile), ["No item selected...", 10]] call CBA_fnc_localEvent;
};

private _itemData = GVAR(itemData) select {(_x select 0) isEqualTo _selectedItem} select 0;
if (isNil "_itemData") exitWith {
    [QEGVAR(common,inventoryTile), ["...", 10]] call CBA_fnc_localEvent;
    [QUOTE(COMPONENT_BEAUTIFIED), format ["No item data found for %1...", _selectedItem]] call EFUNC(common,debugMessage);
};

_itemData params ["_itemName", "_category", "_delay", "_hungerValue", "_thirstValue", "_energyDeficitValue", "_exposureValue", "_radiationValue", "_infectionValue", "_parasitesValue", "_toxicityValue", "_psychosisValue", "_maskBlocksUse", "_requiresCanOpener", "_removeOnUse", "_sound", "_feedback", "_animation", "_code"];

call EFUNC(protection,totalProtection) params ["_gasMask", "_scba"];

if (_maskBlocksUse && {(_gasMask > 0 || _scba > 0)}) exitWith {
    [QEGVAR(common,inventoryTile), ["You cannot use this item with a mask equipped...", 10]] call CBA_fnc_localEvent;
};

if (_requiresCanOpener && {((items player + magazines player) findIf {_x in [MACRO_CANTOOLS]}) isEqualTo -1 && !(currentWeapon player in [MACRO_KNIVES])}) exitWith {
    [QEGVAR(common,inventoryTile), ["You need a can opener or tools to use this...", 10]] call CBA_fnc_localEvent;
};

if (gestureState player in [MACRO_ANIMATION_GESTURES]) exitWith {
    [QEGVAR(common,inventoryTile), ["You are already consuming something else...", 10]] call CBA_fnc_localEvent;
};

if (_removeOnUse) then {
    if ([_itemName, "CfgWeapons"] call EFUNC(common,configCheck)) then {
        [player, _itemName] call CBA_fnc_removeItem;
    } else {
        [_itemName] call EFUNC(common,itemDecrement);
    };
};

if (count _feedback >= 2) then {
    private _feedbackTime = _feedback select 1;
    [QEGVAR(common,inventoryTile), [format [_feedback select 0, _feedbackTime]]] call CBA_fnc_localEvent;
};

if (_sound isNotEqualTo "") then {
    playSound3D [_sound, player, false, getPosASL player, 4, 1, 10];
};

if (_animation isNotEqualTo "") then {
    player switchMove _animation;
};

[_dialog, lbCurSel (_dialog displayCtrl 2100)] call FUNC(populateItemsList);

[{
    params ["_itemName", "_hungerValue", "_thirstValue", "_energyDeficitValue", "_exposureValue", "_radiationValue", "_infectionValue", "_parasitesValue", "_toxicityValue", "_psychosisValue", "_removeOnUse", "_code", "_dialog"];

    if (_hungerValue isNotEqualTo 0) then {
        [_hungerValue, "hunger"] call EFUNC(common,addStatusModifier);
    };
    if (_thirstValue isNotEqualTo 0) then {
        [_thirstValue, "thirst"] call EFUNC(common,addStatusModifier);
    };
    if (_energyDeficitValue isNotEqualTo 0) then {
        [_energyDeficitValue, "energy"] call EFUNC(common,addStatusModifier);
    };
    if (_exposureValue isNotEqualTo 0) then {
        [_exposureValue, "exposure"] call EFUNC(common,addStatusModifier);
    };
    if (_radiationValue isNotEqualTo 0) then {
        [_radiationValue, "radiation"] call EFUNC(common,addStatusModifier);
    };
    if (_infectionValue isNotEqualTo 0) then {
        [_infectionValue, "infection"] call EFUNC(common,addStatusModifier);
    };
    if (_parasitesValue isNotEqualTo 0) then {
        [_parasitesValue, "parasites"] call EFUNC(common,addStatusModifier);
    };
    if (_toxicityValue isNotEqualTo 0) then {
        [_toxicityValue, "toxicity"] call EFUNC(common,addStatusModifier);
    };
    if (_psychosisValue isNotEqualTo 0) then {
        [_psychosisValue, "psychosis"] call EFUNC(common,addStatusModifier);
    };

    if (_code isNotEqualTo "") then {call compile _code};
}, [_itemName, _hungerValue, _thirstValue, _energyDeficitValue, _exposureValue, _radiationValue, _infectionValue, _parasitesValue, _toxicityValue, _psychosisValue, _removeOnUse, _code, _dialog], _delay] call CBA_fnc_waitAndExecute;
