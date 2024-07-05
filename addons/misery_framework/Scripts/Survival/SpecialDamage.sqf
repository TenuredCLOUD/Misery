 /* -----------------------------------
Damage modifier for player instant death
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private _target=_this select 0;
private _damage=_this select 1;

if(MiseryACE)exitWith{
	[_target,_damage,"body","unknown"]remoteExec["ace_medical_fnc_addDamageToUnit",_target];
	TRUE
};
private _damageFinal=(getDammage _target)+_damage;
_target setDammage _damageFinal;
TRUE