/*
Misery PDA alert creation
Code concepts from Haleks rad zones (with permission)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

//Params:
private _module = _this select 0;

//Get module inputs:
private _input1 =_module getvariable "Misery_ERUradius"; //Number
private _input2 =_module getvariable "Misery_ERUalertype"; //STRING

private _pos = position _module;
private _radius = _input1;

private _trg = createTrigger ["EmptyDetector", _pos, false];
_trg setTriggerArea [_radius,_radius,0,False];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
if (_input2 == "RADIATION") then {
_trg setTriggerStatements ["(vehicle player) in thislist", "'\z\misery\addons\framework\scripts\Modules\PDA\alerts\Radiation.sqf' remoteExec ['execVM', thislist];", ""]; //COND. ACTIVE. DEACTIVE.
};
if (_input2 == "RADIATIONHIGH") then {
_trg setTriggerStatements ["(vehicle player) in thislist", "'\z\misery\addons\framework\scripts\Modules\PDA\alerts\RadiationHIGH.sqf' remoteExec ['execVM', thislist];", ""]; //COND. ACTIVE. DEACTIVE.
};
if (_input2 == "PSYFIELD") then {
_trg setTriggerStatements ["(vehicle player) in thislist", "'\z\misery\addons\framework\scripts\Modules\PDA\alerts\Psyfield.sqf' remoteExec ['execVM', thislist];", ""]; //COND. ACTIVE. DEACTIVE.
};
if (_input2 == "ANOMALY") then {
_trg setTriggerStatements ["(vehicle player) in thislist", "'\z\misery\addons\framework\scripts\Modules\PDA\alerts\Anomaly.sqf' remoteExec ['execVM', thislist];", ""]; //COND. ACTIVE. DEACTIVE.
};
if (_input2 == "MILITARY") then {
_trg setTriggerStatements ["(vehicle player) in thislist", "'\z\misery\addons\framework\scripts\Modules\PDA\alerts\Military.sqf' remoteExec ['execVM', thislist];", ""]; //COND. ACTIVE. DEACTIVE.
};
_trg setTriggerTimeout [0, 1, 5, true];

if (MiseryDebug) then {
	private _m = createMarkerLocal [format ["mrk%1",random 100000],_pos];
	_m setMarkerShapeLocal "ELLIPSE";
	_m setMarkerSizeLocal [_radius,_radius];
	_m setMarkerBrushLocal "DiagGrid";
	_m setMarkerAlphaLocal 0.5;
	_m setMarkerColorLocal "ColorRed";
	private _t = createMarkerLocal [format ["mrk%1",random 100000], _pos];
	_t setMarkerShapeLocal "ICON";
	_t setMarkerTypeLocal "hd_dot";
	_t setMarkerTextLocal "PDA alert";
};