#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pump turn on logic
 * Handles power logic & ACE refuel API hook
 *
 * Arguments:
 * 0: Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_turnOnPump
*/

params ["_source"];

[{
    params ["_source"];

    if (EGVAR(persistence,saveACEFuelStations)) then {

        private _currentFuel = _source getVariable [QGVAR(litreCargo), -1];

        if (_currentFuel isEqualTo -1) then {
            private _capacity = [MACRO_FUELSTATION_CAPACITIES];
            private _index = _capacity findIf { (_x select 0) isEqualTo typeOf _source };

            _currentFuel = [1000, (_capacity select _index) select 1] select (_index isNotEqualTo -1);

            _source setVariable [QGVAR(litreCargo), _currentFuel, true];
        };

        [_source, _currentFuel] call ACEFUNC(refuel,makeSource);
    } else {
        [_source, -10] call ACEFUNC(refuel,makeSource);
    };
}, [_source], 1] call CBA_fnc_waitAndExecute;

true
