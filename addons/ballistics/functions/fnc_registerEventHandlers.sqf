#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Adds eventhandlers to classname for unsafe ammunition
 *
 * Arguments:
 * 0: Animal / Unit Classname <CLASSNAME>
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * ["Rabbit_F"] call misery_ballistics_fnc_registerEventHandlers;
 *
*/

params ["_classname"];

[_classname, "init", {
    params ["_object"];

    _object addEventHandler ["HandleDamage", {
        params ["_unit", "", "", "", "_projectile", "", "_instigator"];

        private _type = typeOf _unit;
        private _unsafeProjectiles = GVAR(ballisticsMap) getOrDefault [_type, []];

        if (_unsafeProjectiles findIf {_x isEqualTo _projectile} != -1) then {
            _unit call FUNC(destroy);
            if (isPlayer _instigator) then {
                private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
                private _text = format [localize "STR_MISERY_ANIMALOBLITERATED", _displayName];
                [QEGVAR(common,titleText), _text, _instigator] call CBA_fnc_targetEvent;
            };
        };
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;
