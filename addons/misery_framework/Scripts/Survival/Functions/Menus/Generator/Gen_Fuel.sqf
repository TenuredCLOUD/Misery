/* -----------------------------------
Misery Generator Fuel drain loop
Controls fuel draining...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

_Generator = _this select 0;

while {_Generator getVariable "Misery_Gen_IsRunning" isEqualTo true && _Generator getVariable "Misery_Gen_FuelLVL" > 0} do {

	_GeneratorType = typeOf _Generator;

	private _FuelDelay = nil;

	switch (_GeneratorType) do {
    	case "Misery_100KVA_Gen": {
			_FuelDelay = 300;
    	};
    	case "Misery_HeavilyUsedGen_Gas": {
			_FuelDelay = 60;
    	};
    	case "Misery_HeavilyUsedGen_Diesel": {
			_FuelDelay = 120;
    	};
	};

	_fuelLevel = _Generator getVariable ["Misery_Gen_FuelLVL", 100];
	_Generator setVariable ["Misery_Gen_FuelLVL", _fuelLevel - 1, true];

	sleep _FuelDelay;
};

