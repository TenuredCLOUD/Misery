/*
Misery Generator Power On
Starts up generator, controlling audio synchronization & fuel draining
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_PowerOnB","_PowerOffB","_RefuelB","_GeneratorType","_soundStart","_fuelLevel","_soundDummy"];

	_PowerOnB = findDisplay 573849 displayCtrl 1600;
    _PowerOffB = findDisplay 573849 displayCtrl 1601;
	_RefuelB = findDisplay 573849 displayCtrl 1602;

	_GeneratorType = typeOf MiseryTarget_Gen;

	switch (_GeneratorType) do {
    	case "Misery_100KVA_Gen": {
        	_soundStart = "100_KVA_Startup";
    	};
    	case "Misery_HeavilyUsedGen_Gas": {
        	_soundStart = "petorlgeneratorstart";
    	};
    	case "Misery_HeavilyUsedGen_Diesel": {
        	_soundStart = "dieselgeneratorstart";
    	};
	};

    _fuelLevel = MiseryTarget_Gen getVariable ["Misery_Gen_FuelLVL", 100];
    
	if (_fuelLevel <= 0) exitWith {
		ctrlSetText [1001, "This generator is out of fuel..."];
    };

    MiseryTarget_Gen setVariable ["Misery_Gen_IsRunning", true, true];

	ctrlSetText [1001, "Starting generator..."];

	_PowerOnB ctrlShow false;
    _PowerOffB ctrlShow false;
	_RefuelB ctrlShow false;

	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position MiseryTarget_Gen);
	MiseryTarget_Gen setVariable ["Misery_GenSound", true,true];
	[_soundDummy, [_soundStart, 500]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(MiseryTarget_Gen getVariable ["Misery_GenSound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;

	sleep 1.5;

	ctrlSetText [1001, nil];

    _PowerOffB ctrlShow true;

	[MiseryTarget_Gen] execVM "Misery\Scripts\Survival\Functions\Menus\Generator\Gen_Running.sqf";
	[MiseryTarget_Gen] execVM "Misery\Scripts\Survival\Functions\Menus\Generator\Gen_Fuel.sqf";
	[MiseryTarget_Gen] execVM "Misery\Scripts\Survival\Functions\Menus\Generator\PowerNearby.sqf";
	[MiseryTarget_Gen] execVM "Misery\Scripts\Survival\Functions\Menus\Generator\TrackPos.sqf";

