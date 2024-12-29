#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Fuel drain loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_fuel
 *
*/

_Generator = _this select 0;

while {_Generator getVariable [QCLASS(generatorRunning), false] isEqualTo true && _Generator getVariable [QCLASS(generatorFuelLevel), 100] > 0} do {

    _GeneratorType = typeOf _Generator;

    private _FuelDelay = nil;

    switch (_GeneratorType) do {
        case QCLASS(100KVA_Generator): {
            _FuelDelay = 300;
        };
        case QCLASS(heavilyUsedGas_Generator): {
            _FuelDelay = 60;
        };
        case QCLASS(heavilyUsedDiesel_Generator): {
            _FuelDelay = 120;
        };
    };

    _fuelLevel = _Generator getVariable [QCLASS(generatorFuelLevel), 100];
    _Generator setVariable [QCLASS(generatorFuelLevel), _fuelLevel - 1, true];

    sleep _FuelDelay;
};

