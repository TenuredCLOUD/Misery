#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks if hashmap key is new
 *
 * Arguments:
 * 0: Key Classname <CLASSNAME>
 *
 * Return Value:
 * 0: Key Exists <BOOL>
 *
 * Example:
 * ["Rabbit_F"] call misery_ballistics_fnc_isKeyDefault
*/

params ["_classname"];

(GVAR(ballisticsMap) getOrDefault [_classname, []]) isEqualTo []
