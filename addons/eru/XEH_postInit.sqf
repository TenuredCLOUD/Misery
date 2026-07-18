#include "script_component.hpp"

if !(isServer) exitWith {};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {

    // Safety fallback if active eru is in players inventory (on load / reload)
    [{!isNull _player && !isNull findDisplay 46}, {
        if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
            [ACE_player, [QCLASS(eru_On), QCLASS(eru_Off)], false] call EFUNC(common,switchPowerState);
        };
    }, []] call CBA_fnc_waitUntilAndExecute;

    private _eruBatteries = [
        QGVAR(eru_menu),
        localize LSTRING(ERUActionAddBattery),
        QPATHTOEF(icons,data\battery_charging_ca.paa),
        {
            call FUNC(batteries);
        },
        {
            [[QCLASS(lithiumBattery), QCLASS(eru_NoBattery)]] call EFUNC(common,hasItem)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _eruBatteries] call ACEFUNC(interact_menu,addActionToObject);

}] call CBA_fnc_addEventHandler;

