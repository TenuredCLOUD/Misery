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
    private _noItemSelectedStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "No item selected..."];
    [QEGVAR(common,inventoryTile), [_noItemSelectedStr, 10]] call CBA_fnc_localEvent;
};

private _itemData = GVAR(itemData) select {(_x select 0) isEqualTo _selectedItem} select 0;
if (isNil "_itemData") exitWith {
    private _noItemDataStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "..."];
    [QEGVAR(common,inventoryTile), [_noItemDataStr, 10]] call CBA_fnc_localEvent;
    [QUOTE(COMPONENT_BEAUTIFIED), format ["No item data found for %1...", _selectedItem]] call EFUNC(common,debugMessage);
};

_itemData params ["_itemName", "_category", "_delay", "_hungerValue", "_thirstValue", "_energyDeficitValue", "_exposureValue", "_radiationValue", "_infectionValue", "_parasitesValue", "_toxicityValue", "_psychosisValue", "_maskBlocksUse", "_requiresCanOpener", "_removeOnUse", "_sound", "_addStatus", "_removeStatus", "_feedback", "_animation", "_code"];

call EFUNC(protection,totalProtection) params ["_gasMask", "_scba"];

if (_maskBlocksUse && {(_gasMask > 0 || _scba > 0)}) exitWith {
    private _noMaskAllowedStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You cannot use this item with a mask equipped..."];
    [QEGVAR(common,inventoryTile), [_noMaskAllowedStr, 10]] call CBA_fnc_localEvent;
};

private _validCanTools = [CLASS(canOpener), "rvg_canOpener", "rvg_toolkit", "rvg_guttingKnife"];
if (_requiresCanOpener && {((items player + magazines player) findIf {_x in _validCanTools}) isEqualTo -1 && !(currentWeapon player in [MACRO_KNIVES])}) exitWith {
    private _noCanOpenerStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You need a can opener or tools to use this..."];
    [QEGVAR(common,inventoryTile), [_noCanOpenerStr, 10]] call CBA_fnc_localEvent;
};

if (_removeOnUse) then {[player, _itemName] call CBA_fnc_removeItem};

if (count _feedback >= 2) then {
    private _feedbackText = format ["<t font='PuristaMedium' size='0.7'>%1</t>", _feedback select 0];
    private _feedbackTime = _feedback select 1;
    [QEGVAR(common,inventoryTile), [_feedbackText, _feedbackTime]] call CBA_fnc_localEvent;
};

if (_sound isNotEqualTo "") then {
    playSound3D [_sound, player, false, getPosASL player, 4, 1, 10];
};

if (_animation isNotEqualTo "") then {
    player switchMove _animation;
};

[_dialog, lbCurSel (_dialog displayCtrl 2100)] call FUNC(populateItemsList);

if (_delay > 0) then {
    [
        {
            params ["_args"];
            _args params [
                "_itemName", "_hungerValue", "_thirstValue", "_energyDeficitValue", "_exposureValue", "_radiationValue",
                "_infectionValue", "_parasitesValue", "_toxicityValue", "_psychosisValue", "_addStatus", "_removeStatus",
                "_removeOnUse", "_code", "_dialog"
            ];

            call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit", "", "_exposure", "_radiation", "_infection", "_parasites", "_toxicity", "_psychosis", "_buffs", "_ailments"];

            if (_hungerValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,hunger), (_hunger + _hungerValue / 100)]};
            if (_thirstValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,thirst), (_thirst + _thirstValue / 100)]};
            if (_energyDeficitValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,energyDeficit), (_energyDeficit + _energyDeficitValue / 100)]};
            if (_exposureValue isNotEqualTo 0) then {player setVariable [QEGVAR(temperature,exposure), (_exposure + _exposureValue / 100)]};
            if (_radiationValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,radiation), (_radiation + _radiationValue / 100)]};
            if (_infectionValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,infection), (_infection + _infectionValue / 100)]};
            if (_parasitesValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,parasites), (_parasites + _parasitesValue / 100)]};
            if (_toxicityValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,toxicity), (_toxicity + _toxicityValue / 100)]};
            if (_psychosisValue isNotEqualTo 0) then {player setVariable [QEGVAR(psychosis,state), (_psychosis + _psychosisValue / 100)]};

            {[_x select 0, _x select 1, _x select 2, _x select 3] call EFUNC(vitals,addBuffOrAilment)} forEach _addStatus;
            {
                private _type = _x select 0;
                private _name = _x select 1;
                private _arrayName = ["ailments", "buffs"] select (_type isEqualTo "buff");
                private _array = player getVariable [_arrayName, []];
                private _index = _array findIf {(_x select 0) isEqualTo _name};
                if (_index isNotEqualTo -1) then {[_type, str _index] call EFUNC(vitals,removeBuffOrAilment)};
            } forEach _removeStatus;

            if (_code isNotEqualTo "") then {call compile _code};
        },
        [_itemName, _hungerValue, _thirstValue, _energyDeficitValue, _exposureValue, _radiationValue, _infectionValue, _parasitesValue, _toxicityValue, _psychosisValue, _addStatus, _removeStatus, _removeOnUse, _code, _dialog],
        _delay
    ] call CBA_fnc_waitAndExecute;
} else {
    call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit", "", "_exposure", "_radiation", "_infection", "_parasites", "_toxicity", "_psychosis", "_buffs", "_ailments"];

    if (_hungerValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,hunger), (_hunger + _hungerValue / 100)]};
    if (_thirstValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,thirst), (_thirst + _thirstValue / 100)]};
    if (_energyDeficitValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,energyDeficit), (_energyDeficit + _energyDeficitValue / 100)]};
    if (_exposureValue isNotEqualTo 0) then {player setVariable [QEGVAR(temperature,exposure), (_exposure + _exposureValue / 100)]};
    if (_radiationValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,radiation), (_radiation + _radiationValue / 100)]};
    if (_infectionValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,infection), (_infection + _infectionValue / 100)]};
    if (_parasitesValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,parasites), (_parasites + _parasitesValue / 100)]};
    if (_toxicityValue isNotEqualTo 0) then {player setVariable [QEGVAR(survival,toxicity), (_toxicity + _toxicityValue / 100)]};
    if (_psychosisValue isNotEqualTo 0) then {player setVariable [QEGVAR(psychosis,state), (_psychosis + _psychosisValue / 100)]};

    {[_x select 0, _x select 1, _x select 2, _x select 3] call EFUNC(vitals,addBuffOrAilment)} forEach _addStatus;
    {
        private _type = _x select 0;
        private _name = _x select 1;
        private _arrayName = ["ailments", "buffs"] select (_type isEqualTo "buff");
        private _array = player getVariable [_arrayName, []];
        private _index = _array findIf {(_x select 0) isEqualTo _name};
        if (_index isNotEqualTo -1) then {[_type, str _index] call EFUNC(vitals,removeBuffOrAilment)};
    } forEach _removeStatus;

    if (_code isNotEqualTo "") then {call compile _code};
};
