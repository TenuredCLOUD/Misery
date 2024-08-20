#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Drongo
 * Damage modifier for player 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player,100] call misery_common_fnc_specialDamage;
 *
*/

private _target=_this select 0;
private _damage=_this select 1;

if(MiseryACE)exitWith{
    [_target,_damage,"body","unknown"]remoteExec["ace_medical_fnc_addDamageToUnit",_target];
    true
};
private _damageFinal=(Damage _target)+_damage;
_target setDamage _damageFinal;
true
