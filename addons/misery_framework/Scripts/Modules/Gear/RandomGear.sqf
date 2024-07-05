/* -----------------------------------
Misery Random Gear function (adds random gear to units)
Code concepts from Haleks equipment function 
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */
//Params:
private _module = _this select 0;
private _units= _this select 1;

//Random integer return:
private _random = [1, 10] call BIS_fnc_randomInt;

//Get module inputs:
private _input1 =(_module getvariable "Misery_equip_weapons") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input2 =(_module getvariable "Misery_equip_headGears") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input3 =(_module getvariable "Misery_equip_backpacks") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input4 =(_module getvariable "Misery_equip_vests") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input5 =(_module getvariable "Misery_equip_goggles") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input6 =(_module getvariable "Misery_equip_uniforms") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input7 =(_module getvariable "Misery_equip_WeaponItems") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input8 =(_module getvariable "Misery_equip_uniqueItems") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input9 =(_module getvariable "Misery_equip_Items") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input10 =(_module getvariable "Misery_equip_launchers") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input11 =(_module getvariable "Misery_equip_gasmasks") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input12 =(_module getvariable "Misery_equip_nvgs") call Misery_fnc_ParseArray2; //STRING to ARRAY
private _input13 =_module getvariable "Misery_equip_Wammo"; //Number
private _input14 =_module getvariable "Misery_equip_Lammo"; //Number
private _input15 =_module getvariable "Misery_equip_itemamount"; //Number
private _input16 =_module getvariable "Misery_equip_ACE"; //Number
private _input17 =_module getvariable "Misery_equip_Rare"; //Number
private _input18 =_module getvariable "Misery_equip_randomam"; //BOOL

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

private _randomACE = [
"ACE_fieldDressing",
"ACE_packingBandage",
"ACE_elasticBandage",
"ACE_tourniquet",
"ACE_splint",
"ACE_morphine",
"ACE_adenosine",
"ACE_epinephrine",
"ACE_plasmaIV",
"ACE_plasmaIV_500",
"ACE_plasmaIV_250",
"ACE_bloodIV",
"ACE_bloodIV_500",
"ACE_bloodIV_250",
"ACE_salineIV",
"ACE_salineIV_500",
"ACE_salineIV_250",
"ACE_quikclot",
"ACE_personalAidKit",
"ACE_surgicalKit"
]; 

{
private _syncedunit = _x; //units
private _magazinearrayP=[]; //ARRAY
private _magazinearrayH=[]; //ARRAY
private _magazinearrayS=[]; //ARRAY
private _magP=""; //STRING
private _magH=""; //STRING
private _magS=""; //STRING 

//Remove all preset items:
removeAllWeapons _syncedunit;
removeAllItems _syncedunit;
removeAllAssignedItems _syncedunit;
removeUniform _syncedunit;
removeVest _syncedunit;
removeBackpack _syncedunit;
removeHeadgear _syncedunit;
removeGoggles _syncedunit;

//Add random Primary / handgun weapon:
if ((count _input1) > 0) then {
_weaponP = [_syncedunit, selectRandom _input1, 0] call BIS_fnc_addWeapon; //Add ammo later
};

//Add random launcher:
if ((count _input10) > 0) then {
_weaponL = [_syncedunit, selectRandom _input10, 0] call BIS_fnc_addWeapon; //Add ammo later
};

//Weapon attachment:
if ((count _input7) > 0) then {
_syncedunit addPrimaryWeaponItem (selectRandom _input7);
};

//Add random headgear:
if ((count _input2) > 0) then {
_syncedunit addHeadgear (selectRandom _input2);
};

//Add random backpack + remove items:
if ((count _input3) > 0) then {
_syncedunit addBackpack (selectRandom _input3);
clearAllItemsFromBackpack _syncedunit;
};

//Add random vest:
if ((count _input4) > 0) then {
_syncedunit addVest (selectRandom _input4);
};

//Add random goggles or gasmask:
if (_random > 5) then {
	if ((count _input11) > 0) then {
	_syncedunit addGoggles (selectRandom _input11);
	};
} else {
	if ((count _input5) > 0) then {
	_syncedunit addGoggles (selectRandom _input5);
	};
};

//Add random uniform:
if ((count _input6) > 0) then {
_syncedunit forceAddUniform (selectRandom _input6);
};

//Add random NVGs:
if ((count _input12) > 0) then {
_syncedunit linkItem (selectRandom _input12);
};

//Add random 'rare' item:
for "_i" from 1 to _input17 do {_syncedunit addItem (selectRandom _input8);};

//Add random amount ACE / items:
if (_input18) then {
for "_i" from 1 to random _input15 do {_syncedunit addItem (selectRandom _input9);};
if (MiseryACE) then {
for "_i" from 1 to random _input16 do {_syncedunit addItem (selectRandom _randomACE);};
};
};

//Add amount ACE / items (No random):
if !(_input18) then {
for "_i" from 1 to _input15 do {_syncedunit addItem (selectRandom _input9);};
if (MiseryACE) then {
for "_i" from 1 to _input16 do {_syncedunit addItem (selectRandom _randomACE);};
};
};

// Add ammo to spawned weapons:
sleep 0.5;

if ((_syncedunit ammo (primaryWeapon _syncedunit)) isEqualTo 0) then {
	_magazinearrayP = getArray (configFile >> "CfgWeapons" >> primaryWeapon _syncedunit >> "magazines");
	if !(_magazinearrayP isEqualTo []) then {
		_magP = _magazinearrayP select 0;
		for "_i" from 1 to _input13 do {_syncedunit addMagazine _magP;};
	};
};

if ((_syncedunit ammo (handgunWeapon _syncedunit)) isEqualTo 0) then {
	_magazinearrayH = getArray (configFile >> "CfgWeapons" >> handgunWeapon _syncedunit >> "magazines");
	if !(_magazinearrayH isEqualTo []) then {
		_magH = _magazinearrayH select 0;
		for "_i" from 1 to _input13 do {_syncedunit addMagazine _magH;};
	};
};

if ((_syncedunit ammo (SecondaryWeapon _syncedunit)) isEqualTo 0) then {
	_magazinearrayS = getArray (configFile >> "CfgWeapons" >> SecondaryWeapon _syncedunit >> "magazines");
	if !(_magazinearrayS isEqualTo []) then {
		_magS = _magazinearrayS select 0;
		for "_i" from 1 to _input14 do {_syncedunit addMagazine _magS;};
	};
};

//Force reload 
reload _syncedunit;

} forEach _units;
