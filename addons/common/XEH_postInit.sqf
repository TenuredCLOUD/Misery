#include "script_component.hpp"

if (!hasInterface) exitWith {};

[QGVAR(titleText), {
    params ["_text"];
    titleText [format ["<t font='PuristaMedium'>%1</t>", _text], "PLAIN DOWN", -1, true, true];
}] call CBA_fnc_addEventHandler;
