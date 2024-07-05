/* 
* Misery Loot stash generator
* Designed specifically for Misery mod 
* Code concepts from Drongo DMP edited by TenuredCLOUD
*/

private["_pos","_military","_vehicle","_crateTypes","_crateType","_deleteFlag","_player","_players","_count","_mCount","_chance","_index","_magazines","_arrays","_array","_magazineChance","_magazineCount","_item","_items"];
_pos=_this select 0;_military=_this select 1;
_vehicle=objNull;
if((count _this)>2)then{_vehicle=_this select 2};

_deleteFlag = TRUE;
_player=objNull;
_players=call Misery_fnc_ListPlayers;
_players=_players-(entities"HeadlessClient_F");
_groundStash=objNull;

//If GRAD persistence is active, push Holders to blacklister for saving so empty piles don't populate on reload of a scenario (This will execute only once)
if (!isNil "grad_persistence_blacklist") then {
    if ((grad_persistence_blacklist find (toLower "GroundWeaponHolder_Scripted") == -1) && (grad_persistence_blacklist find (toUpper "GroundWeaponHolder_Scripted") == -1)) then {
        ["GroundWeaponHolder_Scripted"] call grad_persistence_fnc_blacklistClasses;
        if (MiseryDebug) then {systemChat "[Misery Loot Framework] GRAD Persistence detected, Adding loot piles to blacklist for saving / reloading..."};
    };
};

//Loot pile generation:
_crateType = "GroundWeaponHolder_Scripted"; 
if(isNull _vehicle)then{
	if((count _pos)<2)exitWith{_pos=[]};
	_pos=[_pos select 0,_pos select 1,_pos select 2]; //x,y,z coords 
	_pos=[_pos,_crateType]call Misery_fnc_LootPos;
	_groundStash=createVehicle[_crateType,_pos,[],0,"can_Collide"]; 
	_groundStash setDir(random 360);
}else{_groundStash=_vehicle;_pos=getPos _groundStash};
if((count _pos)<2)exitWith{};

_array=[];
_count=0;
_mCount=0;
_chance=0;
_index=0;
_magazines=[];
_items=[];
_item="";

_arrays=[MiseryLootChanceFood,MiseryLootChanceMedical,MiseryLootChanceMisc,MiseryLootChanceWeapon,MiseryLootChanceAttachment,MiseryLootChanceUniform,MiseryLootChanceVest,MiseryLootChanceHeadgear,MiseryLootChancePack,MiseryLootChanceGoggle,MiseryLootChanceGrenade,MiseryLootChanceExplosive];
_magazineChance=MiseryLootChanceMagazine select 0;
_magazineCount=[MiseryLootChanceMagazine select 1,MiseryLootChanceMagazine select 2];

if(_military)then{
	_arrays=[MiseryLootChanceFoodM,MiseryLootChanceMedicalM,MiseryLootChanceMiscM,MiseryLootChanceWeaponM,MiseryLootChanceAttachmentM,MiseryLootChanceUniformM,MiseryLootChanceVestM,MiseryLootChanceHeadgearM,MiseryLootChancePackM,MiseryLootChanceGoggleM,MiseryLootChanceGrenadeM,MiseryLootChanceExplosiveM];
	_magazineChance=MiseryLootChanceMagazineM select 0;
	_magazineCount=[MiseryLootChanceMagazineM select 1,MiseryLootChanceMagazineM select 2];
};

//Loot pile populator (If not synced with Building check, no loot will spawn)
while {(count _players) > 0} do {
	if (MiseryDebug) then {systemChat format["[Misery Loot Framework] Populating lootpile at %1",getPosATL _groundStash];};
	if(_index>((count _arrays)-1))exitWith{};
	_array=[]+(_arrays select _index);
	_chance=_array select 0;
	_count=[_array select 1,_array select 2]call BIS_fnc_randomInt;
	_items=_array select 3;
	if((count _items)==0)then{_chance=0;_count=0};
	if((random 100)<_chance)then{
		while{_count>0}do{
			if((count _items)<1)exitWith{};
			_item=selectRandom _items;
			if(_index in[0,1,2,4,5,6,7,9])then{_groundStash addItemCargoGlobal[_item,1]};
			if(_index==8)then{_groundStash addBackpackCargoGlobal[_item,1]};
			if(_index>9)then{_groundStash addMagazineCargoGlobal[_item,1]};
			if(_index==3)then{
				_groundStash addWeaponCargoGlobal[_item,1];
				// Get some mags for the weapon
				if((random 100)<_magazineChance)then{
					if(isNil{getArray(configFile>>"cfgWeapons">>_item>>"magazines")})then{_magazines=[]}
					else{_magazines=getArray(configFile>>"cfgWeapons">>_item>>"magazines")};
					_mCount=_magazineCount call BIS_fnc_RandomInt;
					if!((count _magazines)>0)then{_mCount=0};
					while{_mCount>0}do{
						_groundStash addMagazineCargoGlobal[(selectRandom _magazines),1];
						_mCount=_mCount-1;
					};
				};
			};
			_count=_count-1;
		};
	};
	_index=_index+1;
	if(_index>11)exitWith{};
};

//Debug markers 
if (MiseryDebug) then {
_marker=createMarkerLocal[format["%1",_groundStash],(getPos _groundStash)];
_marker setMarkerTypeLocal"mil_dot";
_marker setMarkerColorLocal"ColorBlack";
_marker setMarkerTextLocal(format["%1",(getText(configFile>>"cfgVehicles">>(typeOf _groundStash)>>"displayName"))]);
};

//Loot Clean check (Slowed down due to immense frame loss since deletion check will run Per frame)
if (MiseryLootDeleteDist == -1) then {systemChat format["[Misery Loot Framework] Skipping cleanup due to %1 Distance check value...",MiseryLootDeleteDist];};

while {(count _players) > 0 && MiseryLootDeleteDist != -1} do { 
	if (MiseryDebug) then {systemChat format["[Misery Loot Framework] Checking Lootpile at %1 distance for deletion...",getPosATL _groundStash];};
    if(isNull _groundStash) exitWith {}; // in case it gets deleted by other means
    {
    _deleteFlag=TRUE;
    _player=_x;
    if ((_groundStash distance _player) < MiseryLootDeleteDist) exitWith {_deleteFlag=FALSE};
    } forEach _players;
	if (count((weaponCargo _groundStash)+(itemCargo _groundStash)+(magazineCargo _groundStash)+(backpackCargo _groundStash)+(weaponsItemsCargo _groundStash)) < 1) exitWith {
	if (MiseryDebug) then {systemChat format["[Misery Loot Framework] Loot pile generated with no items at %1 Deleting...",getPosATL _groundStash];};
	deleteVehicle _groundStash;
	}; //Delete empty piles (sometimes generated with low chances - this fixes that)
    if (_deleteFlag) exitWith {
	if (MiseryDebug) then {systemChat format["[Misery Loot Framework] Loot pile exceeds %2m distance. Deleting lootpile at %1...",getPosATL _groundStash,MiseryLootDeleteDist];};
			deleteVehicle _groundstash;
		}; // exit the loop with TRUE & delete certain Loot pile 
	sleep MiseryLoottimer;
};

if ((count _this) > 2) exitWith {};

if (count((weaponCargo _groundStash)+(itemCargo _groundStash)+(magazineCargo _groundStash)+(backpackCargo _groundStash)+(weaponsItemsCargo _groundStash)) < 1) then {
	deleteVehicle _groundStash;
	if (MiseryDebug) then {systemChat format["[Misery Loot Framework] Loot pile empty at %1 Deleting...",getPosATL _groundStash];};
	}; //Delete loot after collected (this deletion occurs ONLY after everything has been taken from the pile)

