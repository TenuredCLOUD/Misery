#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Power button
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_powerButton
 *
*/

[player] call FUNC(nearGenerator) params ["", "_generator", "_generatorType"];

[{!isNull findDisplay 573849}, {
    params ["_generator", "_generatorType"];

    _powerButton = findDisplay 573849 displayCtrl 1600;

    if ((ctrlText 1600) isEqualTo "Start") exitWith {
        if (insideBuilding player isEqualTo 1) exitWith {
            [QEGVAR(common,tileText), "You cannot start a generator while inside..."] call CBA_fnc_localEvent;
        };

        [_generator, _generatorType] call FUNC(processAction);
    };

    if ((ctrlText 1600) isEqualTo "Stop") exitWith {
        _generator setVariable [QGVAR(shuttingDown), true, true];
    };
}, [_generator, _generatorType]] call CBA_fnc_waitUntilAndExecute;


