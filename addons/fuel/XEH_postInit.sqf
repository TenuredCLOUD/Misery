#include "script_component.hpp"

if (isServer) then {
    call FUNC(initFuelPumps);
    call FUNC(processTerrainPumps);
};

call FUNC(initRefuelRestrictions);

private _allFuelStations = [MACRO_FUELSTATIONS_LAND] + [MACRO_FUELSTATIONS_AIR];

private _refillPumpAction = [
    QGVAR(refuel_fuelCan_pump_menu),
    localize LSTRING(RefillFuelCanAtPump),
    "z\ace\addons\refuel\ui\icon_refuel_interact.paa",
    {
        params ["_target", "_player"];

        private _allCans = [MACRO_FUEL_CANS] + [MACRO_FUEL_CANS_EMPTY];
        private _matchedIndex = _allCans findIf { [[_x]] call EFUNC(common,hasItem) };

        [_player, _matchedIndex] call FUNC(processFuelCan);
    },
    {
        params ["_target", "_player"];

        private _isHoldingNozzle = _player getVariable [QACEGVAR(refuel,nozzle), objNull];

        if (isNull _isHoldingNozzle) exitWith { false };

        private _allCans = [MACRO_FUEL_CANS] + [MACRO_FUEL_CANS_EMPTY];
        private _matchedIndex = _allCans findIf { [[_x]] call EFUNC(common,hasItem) };

        _matchedIndex isNotEqualTo -1
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

[player, 1, [QUOTE(ACE_SelfActions)], _refillPumpAction] call ACEFUNC(interact_menu,addActionToObject);
