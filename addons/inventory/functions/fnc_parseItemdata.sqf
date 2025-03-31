#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Item data parser for CfgMisery_ItemData from description.ext
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_parseItemData;
 */

GVAR(itemData) = [];

{
    private _itemName = configName _x;
    private _category = getText (_x >> "category");

    // Check if property exists
    private _delay = if (isNil {(_x >> "delay")}) then {0} else {getNumber (_x >> "delay")};
    private _hunger = if (isNil {(_x >> "hunger")}) then {0} else {getNumber (_x >> "hunger")};
    private _thirst = if (isNil {(_x >> "thirst")}) then {0} else {getNumber (_x >> "thirst")};
    private _energyDeficit = if (isNil {(_x >> "energyDeficit")}) then {0} else {getNumber (_x >> "energyDeficit")};
    private _exposure = if (isNil {(_x >> "exposure")}) then {0} else {getNumber (_x >> "exposure")};
    private _radiation = if (isNil {(_x >> "radiation")}) then {0} else {getNumber (_x >> "radiation")};
    private _infection = if (isNil {(_x >> "infection")}) then {0} else {getNumber (_x >> "infection")};
    private _parasites = if (isNil {(_x >> "parasites")}) then {0} else {getNumber (_x >> "parasites")};
    private _toxicity = if (isNil {(_x >> "toxicity")}) then {0} else {getNumber (_x >> "toxicity")};
    private _psychosis = if (isNil {(_x >> "psychosis")}) then {0} else {getNumber (_x >> "psychosis")};
    private _maskBlocksUse = if (isNil {(_x >> "maskBlocksUse")}) then {false} else {getNumber (_x >> "maskBlocksUse") isEqualTo 1};
    private _requiresCanOpener = if (isNil {(_x >> "requiresCanOpener")}) then {false} else {getNumber (_x >> "requiresCanOpener") isEqualTo 1};
    private _removeOnUse = if (isNil {(_x >> "removeOnUse")}) then {false} else {getNumber (_x >> "removeOnUse") isEqualTo 1};
    private _sound = if (isNil {(_x >> "sound")}) then {""} else {getText (_x >> "sound")};
    private _animation = if (isNil {(_x >> "animation")}) then {""} else {getText (_x >> "animation")};
    private _addStatus = if (isNil {(_x >> "addStatus")}) then {[]} else {getArray (_x >> "addStatus")};
    private _removeStatus = if (isNil {(_x >> "removeStatus")}) then {[]} else {getArray (_x >> "removeStatus")};
    private _code = if (isNil {(_x >> "code")}) then {""} else {getText (_x >> "code")};

    private _feedback = [];
    if (!isNil {(_x >> "feedback")}) then {
        private _feedbackRaw = getArray (_x >> "feedback");
        if (count _feedbackRaw > 0) then {
            _feedback = if (count _feedbackRaw isEqualTo 1) then {[_feedbackRaw select 0, 10]} else {_feedbackRaw};
        };
    };

    GVAR(itemData) pushBack [
        _category,          // 0
        _itemName,          // 1
        _hunger,            // 2
        _thirst,            // 3
        _addStatus,         // 4
        _removeStatus,      // 5
        _animation,         // 6
        _removeOnUse,       // 7
        _sound,             // 8
        _maskBlocksUse,     // 9
        _requiresCanOpener, // 10
        _delay,             // 11
        _radiation,         // 12
        _exposure,          // 13
        _code,              // 14
        _feedback           // 15
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_ItemData"));

publicVariable QGVAR(itemData);
