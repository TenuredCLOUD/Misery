#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Position Tracking
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_trackPos
 *
*/

_Generator = _this select 0;

_lastPos = getPosATL _Generator;

while {true} do {
    _currentPos = getPosATL _Generator;

    //Check if generator is "Moving" (Base item framework of somekind? if so kill running gen)
    if (_currentPos distance _lastPos > 0.01) exitWith {
        _Generator setVariable [QCLASS(generatorRunning), false, true];
    };

    //Check if generator no longer exists
    if (isNull _Generator) exitWith {
        _Generator setVariable [QCLASS(generatorRunning), false, true];
    };
};
