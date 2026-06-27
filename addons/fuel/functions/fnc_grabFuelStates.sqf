#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Server side fuel station state grabber for ACE Refuel persistence
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_grabFuelStates;
 */

if (!isServer) exitWith {};

private _activePumps = missionNamespace getVariable [QGVAR(activeFuelPumps), []];

private _masterFuelMap = createHashMap;

{
    private _pump = _x;


    if (!isNull _pump && {alive _pump}) then {

        private _currentFuel = _pump getVariable [QGVAR(litreCargo), -1];
        private _aceFuel = _pump getVariable [QACEGVAR(refuel,currentFuelCargo), -1];

        if (_aceFuel isNotEqualTo -1 && ([_pump] call AE3FUNC(power,getPowerState) isNotEqualTo "Off")) then {
            _currentFuel = _aceFuel;
        };

        if (_currentFuel isEqualTo -1) then {
            private _capacity = [MACRO_FUELSTATION_CAPACITIES];
            private _index = _capacity findIf { (_x select 0) isEqualTo typeOf _pump };
            _currentFuel = [1000, (_capacity select _index) select 1] select (_index isNotEqualTo -1);
        };

        private _key = _pump call BIS_fnc_objectVar;
        _masterFuelMap set [_key, [typeOf _pump, _currentFuel, getPosASL _pump, [vectorDir _pump, vectorUp _pump]]];
    };
} forEach _activePumps;

missionNamespace setVariable [QGVAR(pumpStates), _masterFuelMap, true];
