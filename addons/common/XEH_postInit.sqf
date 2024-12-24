#include "script_component.hpp"

if (!hasInterface) exitWith {};

[QGVAR(titleText), {
    params ["_text"];
    titleText [format ["<t font='PuristaMedium'>%1</t>", _text], "PLAIN DOWN", -1, true, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(tileText), {
    params ["_text"];
    [parseText _text, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
}] call CBA_fnc_addEventHandler;

[QGVAR(exitGui), {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
}] call CBA_fnc_addEventHandler;

