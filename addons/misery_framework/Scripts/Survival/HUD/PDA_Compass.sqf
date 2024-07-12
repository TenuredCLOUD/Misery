/*
HUD option 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

disableSerialization;

[{"Misery_PDA" in items player},
{
	[{
		params ["_args", "_handle"];
		if (!("Misery_PDA" in items player) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			((uiNamespace getVariable "PDACOMPASS")displayCtrl 55554)ctrlSetStructuredText parseText "";
			(findDisplay 46 createDisplay "PDACOMPASS")closeDisplay 1;
			[] execVM "Misery\Scripts\Survival\HUD\PDA_Compass.sqf";
		};

	_rscLayer = "PDACOMPASS" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["PDACOMPASS","PLAIN",1,false];


	if(isNull ((uiNamespace getVariable "PDACOMPASS")displayCtrl 55554)) then
	{
	diag_log "statusbar is null create";
	disableSerialization;
	_rscLayer = "PDACOMPASS" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["PDACOMPASS","PLAIN",1,false];

	};

_dir = round (getDir (vehicle player));
_Bearing = _dir;

//_grid = mapGridPosition  player; _xx = (format[_grid]) select  [0,3];

switch true do {
case(((_dir >= 355) && (_dir <=359)) || ((_dir >= 0) && (_dir <= 5))) : {_Bearing = "N";}; //Bearing North
case((_dir > 5) && (_dir < 85)) : {_Bearing = "NE";}; 		//Bearing North-East
case((_dir >= 85) && (_dir <= 95)) : {_Bearing = "E";}; 	//Bearing East
case((_dir > 95) && (_dir < 175)) : {_Bearing = "SE";}; 	//Bearing South-East
case((_dir >= 175) && (_dir <= 185)) : {_Bearing = "S";}; 	//Bearing South
case((_dir > 185) && (_dir < 265)) : {_Bearing = "SW";};	//Bearing South-West
case((_dir >= 265) && (_dir <= 275)) : {_Bearing = "W";}; 	//Bearing West
case((_dir > 275) && (_dir < 355)) : {_Bearing = "NW";};	//Bearing North-West
};

if ("Misery_PDA" in items player && MiseryPDACompass) then {

((uiNamespace getVariable "PDACOMPASS")displayCtrl 55554) ctrlSetStructuredText
parseText format
	["
<t shadow='%5' shadowColor='#000000' color='%4'>[PDA]: Compass: %2 %3<'/> </t>
",
		"%",					//1
		_dir,
		_Bearing,
		MiseryHUDcolorPDACompass,
		MiseryHUDshadow
		];
		}; //Show display if player possess's a MicroDagr
	}, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
