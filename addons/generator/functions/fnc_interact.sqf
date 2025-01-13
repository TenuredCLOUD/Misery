#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Interaction synchronization
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_interact
 *
*/

_Generator = _this select 0;

player setVariable ['Misery_Current_Generator', _Generator, true];

createDialog QCLASS(generator_ui);
