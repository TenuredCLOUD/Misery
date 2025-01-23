#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Drongo
 * Knockout simulation for player
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, (1+(random 3))] call misery_common_fnc_stun;
 *
*/

private _target=_this select 0;
private _time=_this select 1;
titleText[" ","BLACK OUT",1];
_target setUnconscious true;
if (_time<1) then {_time=1};
sleep _time;
titleText[" ","BLACK IN",1];
_target setUnconscious false;
