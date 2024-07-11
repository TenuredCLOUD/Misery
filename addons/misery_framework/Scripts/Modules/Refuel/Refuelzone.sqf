/*
Misery Refuel zone creation
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

//Params:
private _module = _this select 0;

//Get module inputs:
private _input1 =_module getvariable "Misery_RefuelZoneradius"; //Number

private _pos = position _module;
private _radius = _input1;

private _trg = createTrigger ["EmptyDetector", _pos, false];
_trg setTriggerArea [_radius,_radius,0,False];
_trg setTriggerActivation ["ANY", "PRESENT", true];
_trg setTriggerStatements ["(vehicle player) in thislist", "MiseryinRefuelzonearea = true", "MiseryinRefuelzonearea = false"]; //COND. ACTIVE. DEACTIVE.
_trg setTriggerTimeout [0, 5, 10, true];

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
	_t setMarkerTextLocal "Refuel zone";
};