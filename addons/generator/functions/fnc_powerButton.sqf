#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Power button
 *
 * Arguments:
 * 0: Generator <OBJECT>
 * 1: Type <STRING>
 * 2: Power Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_powerButton
 *
*/

params ["_generator", "_generatorType", "_power"];

if (_power isEqualTo 1) exitWith {
    if (insideBuilding player isEqualTo 1) exitWith {
        [QEGVAR(common,tileText), localize LSTRING(Inside)] call CBA_fnc_localEvent;
    };

    [_generator, _generatorType] call FUNC(processAction);
};

if (_power isEqualTo 0) exitWith {
    _generator setVariable [QGVAR(shuttingDown), true, true];
};

