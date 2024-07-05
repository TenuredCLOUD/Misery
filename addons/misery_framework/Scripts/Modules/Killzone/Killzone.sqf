/* -----------------------------------
Misery Killzone creation
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

//Params:
private _module = _this select 0;

//Get module inputs:
private _input1 =_module getvariable "Misery_killzoneradius"; //Number
private _input2 =_module getvariable "Misery_killzonefactiontype"; //STRING
private _input3 =_module getvariable "Misery_killzoneactiontype"; //STRING

private _pos = position _module;
private _radius = _input1;

private _trg = createTrigger ["EmptyDetector", _pos, false];
_trg setTriggerArea [_radius,_radius,0,False];
if (_input2 == "SIDEANYONE") then {
_trg setTriggerActivation ["ANY", "PRESENT", true];
};
if (_input2 == "SIDEWEST") then {
_trg setTriggerActivation ["WEST", "PRESENT", true];
};
if (_input2 == "SIDEEAST") then {
_trg setTriggerActivation ["EAST", "PRESENT", true];
};
if (_input2 == "SIDECIVILIAN") then {
_trg setTriggerActivation ["CIV", "PRESENT", true];
};
if (_input2 == "SIDEIND") then {
_trg setTriggerActivation ["GUER", "PRESENT", true];
};

if (_input3 == "KILLALL") then {
_trg setTriggerStatements ["this", "{_x setdammage 1;} forEach (thisList);", ""]; //COND. ACTIVE. DEACTIVE.
};

if (_input3 == "DELETEALL") then {
_trg setTriggerStatements ["this", "{deleteVehicle _x} forEach (thisList);", ""]; //COND. ACTIVE. DEACTIVE.
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
	_t setMarkerTextLocal "Kill zone";
};