 /* -----------------------------------
Misery Generator icon updater
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

disableSerialization;

waitUntil {!isNull findDisplay 573849};

private _dialog = findDisplay 573849;
private _IconCtrl = _dialog displayCtrl 1200;
private _IconName = _dialog displayCtrl 1002;

_Generator = player getVariable "Misery_Current_Generator";
_GeneratorType = typeOf _Generator;

private _Vehiclename = getText (configFile >> "CfgVehicles" >> _GeneratorType >> "displayName");

if (!isNil "_Vehiclename") then {
    _cfg = configFile >> "CfgVehicles" >> _GeneratorType;
    if (isClass _cfg) exitWith {
		_IconName ctrlSetText _Vehiclename;
    };
};
