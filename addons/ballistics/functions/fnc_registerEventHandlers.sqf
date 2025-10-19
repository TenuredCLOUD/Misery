#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Adds eventhandlers to classname for unsafe ammunition
 *
 * Arguments:
 * 0: Animal / Unit Classname <CLASSNAME>
 *
 * Return Value:
 * None
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

        if (_unsafeProjectiles findIf {_x isEqualTo _projectile} isNotEqualTo -1) then {
            _unit call FUNC(destroy);
            if (isPlayer _instigator) then {
                [_unit] call EFUNC(common,getObjectData) params ["_displayName"];
                private _text = format [localize "STR_MISERY_ANIMALOBLITERATED", _displayName];
                [QEGVAR(common,titleText), _text, _instigator] call CBA_fnc_targetEvent;
            };
        };
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;
