/* -----------------------------------
HUD option 
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

disableSerialization;

[{!(isNil {player getVariable "Miserycartridge"})},
{
	[{
		params ["_args", "_handle"];
		if ((!(goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs)) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			((uiNamespace getVariable"Gascartridge")displayCtrl 55554)ctrlSetStructuredText parseText"";
			(findDisplay 46 createDisplay"Gascartridge")closeDisplay 1;
			[] execVM "Misery\Scripts\Survival\HUD\gasmaskcart.sqf";
		};

	_rscLayer = "Gascartridge" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["Gascartridge","PLAIN",1,false];


	if(isNull ((uiNamespace getVariable "Gascartridge")displayCtrl 55554)) then
	{
	diag_log "statusbar is null create";
	disableSerialization;
	_rscLayer = "Gascartridge" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["Gascartridge","PLAIN",1,false];

	};

private _module=(entities"Misery_Survival")select 0;
Miserygasmasks=_module getvariable "Misery_Enhgasmasks";

private _maskimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "Misery\Scripts\Survival\Data\gasmask.paa"];
private _scbaimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "Misery\Scripts\Survival\Data\SCBA.paa"];
private _cartridgecalc = player getVariable ["Miserycartridge", 100]; 

if !(Miserygasmasks) exitwith {}; //if module isn't checked exit display 

if ((goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs)) then {

((uiNamespace getVariable "Gascartridge")displayCtrl 55554) ctrlSetStructuredText
parseText format
	["
<t shadow='%5' shadowColor='#000000' color='%4'>[Cartridge capacity]: %2 %3<'/>						</t>
",
		"%",					
		round(_cartridgecalc * 1),
		_maskimage,
		MiseryHUDcolorGasmask,
		MiseryHUDshadow
		];

}else{

if ((goggles player in antirad_goggles) && (vest player in antirad_vests || backpack player in antirad_packs) || (vest player in antirad_vests || backpack player in antirad_packs)) then {

((uiNamespace getVariable "Gascartridge")displayCtrl 55554) ctrlSetStructuredText
parseText format
	["
<t shadow='%4' shadowColor='#000000' color='%3'>[Supplied Air]: --- %2<'/>						</t>
",
		"%",					
		_scbaimage,
		MiseryHUDcolorGasmask,
		MiseryHUDshadow
		];
		};
		};
	}, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
