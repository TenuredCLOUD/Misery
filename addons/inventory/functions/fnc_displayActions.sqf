/*
Misery Mod Menu GUI updater
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

hintSilent "";
ctrlShow[982377,TRUE];
private _list=(findDisplay 982377)displayCtrl 1500;

lbClear _list;
private _allActions=[];
private _index=0;
private _item="";

if(MiseryActionsMode=="") then{

	_allActions=_allActions+MiseryActions;

	{
	_allActions pushBack _x
	} forEach (call Misery_fnc_Actions);

	
	if((count MiseryActionsCustom) > 0) then {_allActions=_allActions + MiseryActionsCustom};
};

//Foraging:
if(MiseryActionsMode==localize "STR_MISERY_FORAGE")then{
	_allActions=[
		[localize "STR_MISERY_FORAGE_DIGFORWORMS",localize "STR_MISERY_FORAGE_DIGFORWORMS"], 
		[localize "STR_MISERY_FORAGE_SEARCHFORTINDER",localize "STR_MISERY_FORAGE_SEARCHFORTINDER"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Fishing:
if(MiseryActionsMode==localize "STR_MISERY_STARTFISHING")then{
	_allActions=[
		[localize "STR_MISERY_STARTFISHINGACT", localize "STR_MISERY_STARTFISHINGACT"], 
		[localize "STR_MISERY_STARTFISHINGREQUIRMENTS", localize "STR_MISERY_STARTFISHINGREQUIRMENTS"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Cooking / Fire usage:
if (MiseryActionsMode==localize "STR_MISERY_USEFIRE" && !(MiseryACE)) then {
	_allActions=[
		[localize "STR_MISERY_USEFIRE_COOK",localize "STR_MISERY_USEFIRE_COOK"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};
if (MiseryActionsMode==localize "STR_MISERY_USEFIRE" && (MiseryACE)) then {
	_allActions=[
		[localize "STR_MISERY_USEFIRE_COOK",localize "STR_MISERY_USEFIRE_COOK"],
		["Cauterize wounds","Cauterize wounds"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Anvil usage:
if(MiseryActionsMode== localize "STR_MISERY_USEANVIL")then{
	if (MiseryUsingiBuild) then {
	_allActions=[
		["Craft pickaxe","Craft pickaxe"], 
		["Repair pickaxe","Repair pickaxe"],
		["Craft scrap metal","Craft scrap metal"],
		["Craft castiron pot","Craft castiron pot"],
		["Craft Nails","Craft Nails"],
		["Anvil Blueprints","Anvil Blueprints"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
	};
	if !(MiseryUsingiBuild) then {
	_allActions=[
		["Craft pickaxe","Craft pickaxe"], 
		["Repair pickaxe","Repair pickaxe"],
		["Craft castiron pot","Craft castiron pot"],
		["Craft Nails","Craft Nails"],
		["Anvil Blueprints","Anvil Blueprints"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];	
	};
};

//Forge usage:
if(MiseryActionsMode== localize "STR_MISERY_USEFORGE")then{
	_allActions=[
		["Smelt iron","Smelt iron"], 
		["Smelt iron pieces","Smelt iron pieces"],
		["Smelt gold","Smelt gold"],
		["Smelt gold pieces","Smelt gold pieces"],
		["Forge Blueprints","Forge Blueprints"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Manual player data:
if(MiseryActionsMode==localize "STR_MISERY_PLAYERDATA")then{
	_allActions=[
		[localize "STR_MISERY_SAVECHARACTER",localize "STR_MISERY_SAVECHARACTER"],
		[localize "STR_MISERY_DELETECHARACTER",localize "STR_MISERY_DELETECHARACTER"],  
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Jerrycans:
if(MiseryActionsMode==localize "STR_MISERY_USEJERRYCANCLEAN") then {
	_allActions=[
		["Drink from Jerrycan (clean)","Drink from Jerrycan (clean)"],
		["Pour into canteen","Pour into canteen"],  
		["Pour into water bottle","Pour into water bottle"],
		["Dump out water (clean)","Dump out water (clean)"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};
if(MiseryActionsMode==localize "STR_MISERY_USEJERRYCANDIRTY") then {
	_allActions=[
		["Drink from Jerrycan (dirty)","Drink from Jerrycan (dirty)"],
		["Pour into canteen","Pour into canteen"],  
		["Pour into water bottle","Pour into water bottle"],
		["Dump out water (dirty)","Dump out water (dirty)"],
		["Purify water","Purify water"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Fuel collection
if(MiseryActionsMode==localize "STR_MISERY_USEFUELPUMP") then {
	_allActions=[
		["Refill Fuel Jerrycan","Refill Fuel Jerrycan"],
		["Refill vehicle","Refill vehicle"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Fuel collection
if(MiseryActionsMode==localize "STR_MISERY_USEJETFUELPUMP") then {
	_allActions=[
		["Refill JetFuel Jerrycan","Refill JetFuel Jerrycan"],
		["Refill aircraft","Refill aircraft"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

//Jerrycans Fuel
if(MiseryActionsMode==localize "STR_MISERY_SWAPFUELTYPEJET") then {
	_allActions=[
		["Swap to Petrol","Swap to Petrol"],
		["Swap to Diesel","Swap to Diesel"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};
if(MiseryActionsMode==localize "STR_MISERY_SWAPFUELTYPEDIESEL") then {
	_allActions=[
		["Swap to Petrol","Swap to Petrol"],
		["Swap to Jetfuel","Swap to Jetfuel"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};
if(MiseryActionsMode==localize "STR_MISERY_SWAPFUELTYPEPETROL") then {
	_allActions=[
		["Swap to Diesel","Swap to Diesel"],
		["Swap to Jetfuel","Swap to Jetfuel"],
		[localize "STR_MISERY_CANCEL",localize "STR_MISERY_CANCEL"]
	];
};

{
if((typeName _x)=="ARRAY")then{
	if((typeName(_x select 0))=="STRING")then{_list lbAdd format["%1",_x select 0]}else{_list lbAdd format["%1",str(_x select 0)]};
	if((typeName(_x select 1))=="STRING")then{_list lbSetData[_index,(_x select 1)]}else{_list lbSetData[_index,str(_x select 1)]};
}else{
	if((typeName _x)=="STRING")then{_list lbAdd format["%1",_x]}else{_list lbAdd format["%1",str _x]};
	if((typeName _x)=="STRING")then{_list lbSetData[_index,_x]}else{_list lbSetData[_index,str _x]};
};
_index=_index+1;
}forEach _allActions;
