/*
Misery Generator Interaction synchronization
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\main\script_macros.hpp"

_Generator = _this select 0;

player setVariable ['Misery_Current_Generator', _Generator, true];

createDialog "MiseryGenerator_GUI";
