/*
HUD option 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

disableSerialization;

[{"Misery_ERU" in items player},
{
	[{
		params ["_args", "_handle"];
		if (!("Misery_ERU" in items player) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			((uiNamespace getVariable "PDATIME")displayCtrl 55554)ctrlSetStructuredText parseText "";
			(findDisplay 46 createDisplay "PDATIME")closeDisplay 1;
			[] execVM "\z\misery\addons\framework\scripts\survival\HUD\PDA_Time.sqf";
		};

	_rscLayer = "PDATIME" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["PDATIME","PLAIN",1,false];


	if(isNull ((uiNamespace getVariable "PDATIME")displayCtrl 55554)) then
	{
	diag_log "statusbar is null create";
	disableSerialization;
	_rscLayer = "PDATIME" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["PDATIME","PLAIN",1,false];

};

_Time= format ["%1", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];

_curdate = format ["%4%5/%2%3/%1",
	date select 0,
	["", "0"] select (date select 1 < 10),
	date select 1,
	["", "0"] select (date select 2 < 10),
	date select 2
];

if ("Misery_ERU" in items player && MiseryPDAClock) then {

((uiNamespace getVariable "PDATIME")displayCtrl 55554) ctrlSetStructuredText
parseText format
	["
<t shadow='%5' shadowColor='#000000' color='%4'>[PDA] Time: %2 Date: %3 <img size='1.8' image='\z\misery\addons\framework\scripts\survival\data\clock.paa'/>						</t>
",
		"%",					//1
		_Time,
		_curdate,
		MiseryHUDcolorPDAClock,
		MiseryHUDshadow
		];
		}; //Show display if player possess's a PDA
	}, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

