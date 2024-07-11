/*
Misery Custom Ravage init
Custom Rvg functions 
Permission to alter, use, etc.. Was explicitely requested from Haleks before use 
RVG alternate init to work with survival framework: (Radiation system, as well as some item usage / merge only :Compat for Misery & Ravage:)
If survival framework module placed, this will not run, as Misery systems will exit
Designed specifically for Misery mod 
by TenuredCLOUD 
*/
 
//Haleks target exec defines:
_targets = 0;
if (isDedicated) then {
	_targets = -2;
};

private _module=(entities"Misery_Survival")select 0;
Miseryrvgrandomrad=_module getvariable "Misery_RVGRndrad";
Miseryradwater=_module getVariable "Misery_RVGRadwater";
Miseryradrain=_module getVariable "Misery_RVGRadrain";
//MiseryNORVG=_module getvariable "Misery_SurvivalFramework";

///init
//if (MiseryNORVG=="ENABLED") then {
[[], "Misery\Scripts\Survival\AlternateRvgstart\RvgCompatStart.sqf"] remoteExec ["execVM", _targets, true];
//};

if (Miseryrvgrandomrad) then {
	_radMap = call compile preprocessfilelinenumbers "\ravage\code\survival\radMap.sqf";
	[_radMap, "\ravage\code\survival\rad_init.sqf"] remoteExec ["execVM", _targets, true];
};
if (Miseryradwater) then {
	[[], "\ravage\code\survival\radwater_init.sqf"] remoteExec ["execVM", _targets, true];
};
if (Miseryradrain) then {
	[[], "\ravage\code\survival\radrain_init.sqf"] remoteExec ["execVM", _targets, true];
};

//-------------------------------------------------------------------