#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator icon updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_icon
 *
*/

[player] call FUNC(nearGenerator) params ["", "", "_generatorType"];

disableSerialization;

[{!isNull findDisplay 573849}, {
    params ["_generatorType"];

    private _dialog = findDisplay 573849;
    private _iconName = _dialog displayCtrl 1000;

    [_generatorType] call EFUNC(common,getObjectData) params ["_objectDisplayName"];
    _iconName ctrlSetText _objectDisplayName;

}, _generatorType] call CBA_fnc_waitUntilAndExecute;
