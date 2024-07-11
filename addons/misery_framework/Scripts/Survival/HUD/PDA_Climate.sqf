/*
HUD option 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

disableSerialization;

	[{!isNil "GF_Temperature_Sum_Air" && !isNil "GF_Temperature_Sum_Sea"},
{
	[{
		params ["_args", "_handle"];
		if (!("Misery_PDA" in items player) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			((uiNamespace getVariable"PDATEMP")displayCtrl 55554)ctrlSetStructuredText parseText"";
			(findDisplay 46 createDisplay"PDATEMP")closeDisplay 1;
			[] execVM "Misery\Scripts\Survival\HUD\PDA_Climate.sqf";
		};

	_rscLayer = "PDATEMP" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["PDATEMP","PLAIN",1,false];


	if(isNull ((uiNamespace getVariable "PDATEMP")displayCtrl 55554)) then
	{
	diag_log "statusbar is null create";
	disableSerialization;
	_rscLayer = "PDATEMP" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["PDATEMP","PLAIN",1,false];

	};

private _airtemperature = format ["<img shadow='0.1' size='1.8' image='%1'/>", "Misery\Scripts\Survival\data\tempair.paa"];

private _seatemperature = format ["<img shadow='0.1' size='1.8' image='%1'/>", "Misery\Scripts\Survival\data\tempsea.paa"];

private _aircalc = GF_Temperature_Sum_Air; 

private _seacalc = GF_Temperature_Sum_Sea; 

if ("Misery_PDA" in items player && MiseryPDAClimate) then {

((uiNamespace getVariable "PDATEMP")displayCtrl 55554) ctrlSetStructuredText
parseText format
	["
<t shadow='%7' shadowColor='#000000' color='%6'>[PDA]: Climate data: %4 %2°C %5 %3°C<'/>						</t>
",
		"%",					//1
		round(_aircalc * 1),
		round(_seacalc * 1),
		_airtemperature,
		_seatemperature,
		MiseryHUDcolorPDAClimate,
		MiseryHUDshadow
		];
		}; //Show display if player possess's a PDA
	}, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
