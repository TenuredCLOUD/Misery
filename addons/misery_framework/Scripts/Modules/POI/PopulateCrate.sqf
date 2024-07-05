 /* -----------------------------------
POI Crate Loot Generator
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

_ammoBox = _this select 0;
_crateweaponArray = _this select 1;
_crateitemArray = _this select 4;
_crateuniformArray = _this select 5;
_cratevestArray = _this select 6;
_cratebackpackArray = _this select 7;
_maxallowedCrateitems = _this select 8;

if (!isNil "_crateweaponArray" && {count _crateweaponArray > 0}) then {
	for "_i" from 1 to _maxallowedCrateItems do {
		_selectedWeapon = selectRandom _crateweaponArray; 
		_ammoBox addWeaponCargoGlobal [_selectedWeapon, 1]; 

	_crateweaponMagArray = switch (_this select 2) do {
    case "BASIC": {_compatibleMags = getArray (configFile >> "CfgWeapons" >> _selectedWeapon >> "magazines");
		if (count _compatibleMags > 0) then {
			for "_j" from 1 to _maxallowedCrateItems do {
				_ammoBox addMagazineCargoGlobal [_compatibleMags select 0, 1];
			};
		};};
    case "ALL": {_compatibleMags = getArray (configFile >> "CfgWeapons" >> _selectedWeapon >> "magazines");
		if (count _compatibleMags > 0) then {
			for "_j" from 1 to _maxallowedCrateItems do {
				_ammoBox addMagazineCargoGlobal [selectRandom _compatibleMags, 1];
			};
		};};
    case "NOMAGS": {};
	};

	_crateweaponAttchArray = switch (_this select 3) do {
    case "BASIC": {_compatibleAttachments = (compatibleItems _selectedWeapon);
        if (count _compatibleAttachments > 0) then {
            for "_k" from 1 to _maxallowedCrateItems do {
                _ammoBox addItemCargoGlobal [_compatibleAttachments select 0, 1];
            };
        };};
    case "ALL": {_compatibleAttachments = (compatibleItems _selectedWeapon);
        if (count _compatibleAttachments > 0) then {
            for "_k" from 1 to _maxallowedCrateItems do {
                _ammoBox addItemCargoGlobal [selectRandom _compatibleAttachments, 1];
            };
        };};
    case "NOATTCH": {};
		};
	};
};

if (!isNil "_crateitemArray" && {count _crateitemArray > 0}) then {
	for "_i" from 1 to _maxallowedCrateItems do {
    _ammoBox addItemCargoGlobal [selectRandom _crateitemArray, 1];
	};
		}; 

if (!isNil "_crateuniformArray" && {count _crateuniformArray > 0}) then {
	for "_i" from 1 to _maxallowedCrateItems do {
    _ammoBox addItemCargoGlobal [selectRandom _crateuniformArray, 1];
	};
		}; 

if (!isNil "_cratevestArray" && {count _cratevestArray > 0}) then {
	for "_i" from 1 to _maxallowedCrateItems do {
    _ammoBox addItemCargoGlobal [selectRandom _cratevestArray, 1];
	};
		}; 

if (!isNil "_cratebackpackArray" && {count _cratebackpackArray > 0}) then {
	for "_i" from 1 to _maxallowedCrateItems do {
    _ammoBox addBackpackCargoGlobal [selectRandom _cratebackpackArray, 1];
	};
		};