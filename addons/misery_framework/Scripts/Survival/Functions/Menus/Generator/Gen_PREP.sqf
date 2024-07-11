/* -----------------------------------
Misery Generator UI populator / PREP
Generator stats, usage UI processor
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {!isNull findDisplay 573849};

_Generator = player getVariable "Misery_Current_Generator";
_GeneratorType = typeOf _Generator; 

private _radius = nil;

switch (_GeneratorType) do {
    case "Misery_100KVA_Gen": {
        _radius = 500;
    };
    case "Misery_HeavilyUsedGen_Diesel": {
        _radius = 150;
    };
    case "Misery_HeavilyUsedGen_Gas": {
        _radius = 25;
    };
};

private _lights = nearestObjects [getPosATL _Generator, ["HOUSE","STATIC","BUILDING"], _radius, false];
private _lightsTerrain = nearestTerrainObjects [getPosATL _Generator, ["BUILDING","HOUSE"], _radius, false];
private _AllPoweredObjectsCounted = count (_lights + _lightsTerrain);

while {!isNull findDisplay 573849} do {

_fuelProgressBar = findDisplay 573849 displayCtrl 1003; 

_Generator = player getVariable "Misery_Current_Generator";

_GeneratorType = typeOf _Generator; 

_Generatorname = getText (configFile >> "CfgVehicles" >> _GeneratorType >> "displayName");

if (_Generatorname isEqualTo "") exitWith {};

private _fuelLevel = _Generator getVariable ["Misery_Gen_FuelLVL", 100];

_progressIndicator = "";

for "_i" from 0 to _fuelLevel do { 
    if (_i % 5 == 0) then {_progressIndicator = _progressIndicator + "-"}; 
};

_displayedText = format ["Fuel Level:%1%2%3%1[%4]", endl, _fuelLevel, "%", _progressIndicator]; 
ctrlSetText [1003, _displayedText];

private _powerState = if (_Generator getVariable ["Misery_Gen_IsRunning", false] isEqualTo false) then {"OFF"} else {"RUNNING"};

_displayedState = format ["Power State: %1", _powerState]; 
ctrlSetText [1001, _displayedState];

private _AllPoweredObjects = if (_Generator getVariable ["Misery_Gen_IsRunning", false] isEqualTo false) then {"NO POWER"} else {_AllPoweredObjectsCounted};

    _displayedPowered = format ["Powered Objects: %1", _AllPoweredObjects]; 

    ctrlSetText [1004, _displayedPowered];

sleep 1;
};