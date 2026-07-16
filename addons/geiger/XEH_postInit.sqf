#include "script_component.hpp"

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {

    // Safety fallback if active geiger is in players inventory (on load / reload)
    [{!isNull ACE_player && !isNull findDisplay 46}, {
        if ([[QCLASS(geiger_On)]] call EFUNC(common,hasItem)) then {
            [ACE_player, [QCLASS(geiger_On), QCLASS(geiger_Off)], false] call EFUNC(common,switchPowerState);
        };
    }, []] call CBA_fnc_waitUntilAndExecute;


    private _addBatterytoGeiger = [
        QGVAR(geiger_menu),
        localize LSTRING(BatteryAction),
        QPATHTOEF(icons,data\battery_charging_ca.paa),
        {
            call FUNC(batteries)
        },
        {
            [[QCLASS(lithiumBattery), QCLASS(geiger_NoBattery)]] call EFUNC(common,hasItem)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _addBatterytoGeiger] call ACEFUNC(interact_menu,addActionToObject);

}] call CBA_fnc_addEventHandler;
