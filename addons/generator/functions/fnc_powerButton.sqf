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

waitUntil {!isNull findDisplay 573849};

_Generator = player getVariable "Misery_Current_Generator";

_GeneratorType = typeOf _Generator;

_PowerButton = findDisplay 573849 displayCtrl 1600;

if ((ctrlText 1600) isEqualTo "Start") exitWith {
    [_Generator] execVM "\z\misery\addons\generator\functions\fnc_Gen_RunningUserAct.sqf";
};

if ((ctrlText 1600) isEqualTo "Stop") exitWith {
    _Generator setVariable ['Misery_Gen_IsRunning', false, true];
};
