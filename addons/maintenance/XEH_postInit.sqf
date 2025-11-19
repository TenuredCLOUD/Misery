#include "script_component.hpp"

// Exit system if ACE repair is enabled
if (!isNil "ace_repair_enabled" && {ace_repair_enabled}) exitWith {};

if (isServer) then {
    call FUNC(initVehicles);

    [
        "maintenance_menu",
        "Vehicle Maintenance",
        {([player] call EFUNC(common,nearVehicle)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(maintenance_ui);
        },
        "",
        "",
        ""
    ] call EFUNC(actions,addAction);
};

if (hasInterface) then {
    call FUNC(vehicleControl);

    // Add ACE interactions for ace wheels & tracks since even with ace repair disabled players can still interact with spare repair items on vehicles
    if ("ace_main" call EFUNC(common,isModLoaded)) then {
        private _trackAction = [
            QGVAR(aceSalvageTrack),
            QUOTE(Salvage Track parts),
            QUOTE(a3\ui_f_oldman\data\igui\cfg\holdactions\repair_ca.paa),
            {
                params ["_target", "_player"];
                [
                5,
                [_target, _player],
                {
                    params ["_args"];
                    _args params ["_target", "_player"];

                    if ([[QCLASS(emptyToolKit)]] call EFUNC(common,hasItem)) then {
                        [QEGVAR(common,tileText), format ["Scavenged parts for %1 from track...", [QCLASS(trackRepairKit)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                        deleteVehicle _target;
                        [_player, QCLASS(emptyToolKit)] call CBA_fnc_removeItem;
                        [_player, QCLASS(trackRepairKit), 1, true] call CBA_fnc_addMagazine;
                    };

                    if ([[QCLASS(trackRepairKit)]] call EFUNC(common,hasItem)) then {

                        [QCLASS(trackRepairKit)] call EFUNC(common,itemIncrement) params ["_incremented"];

                        if !(_incremented) exitWith {
                            [QEGVAR(common,tileText), format ["%1 doesn't have enough room left for scavenging track parts...", [QCLASS(trackRepairKit)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                        };
                        if (_incremented) exitWith {
                            [QEGVAR(common,tileText), format ["Scavenged parts for %1 from track...", [QCLASS(trackRepairKit)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                            deleteVehicle _target;
                        };
                    };
                },
                {
                    if ([[QCLASS(trackRepairKit)]] call EFUNC(common,hasItem) || [[QCLASS(emptyToolKit)]] call EFUNC(common,hasItem)) then {
                        [QEGVAR(common,tileText), "Failed to scavenge parts from track..."] call CBA_fnc_localEvent;
                    } else {
                        [QEGVAR(common,tileText), format ["You need Tools for scavenging tank track parts: %1 %2", "(x1 Toolkit)", "(x1 Empty Toolkit or x1 Track repair kit)"]] call CBA_fnc_localEvent;
                    };
                },
                QUOTE(Salvaging track parts...),
                {[[QUOTE(ToolKit)]] call EFUNC(common,hasItem) && ([[QCLASS(trackRepairKit)]] call EFUNC(common,hasItem) || [[QCLASS(emptyToolKit)]] call EFUNC(common,hasItem))},
                []
                ] call ace_common_fnc_progressBar;
            },
            {true},
            {},
            ["_target", "_player"],
            [0, 0, 0],
            3
        ] call ace_interact_menu_fnc_createAction;

        ["ACE_Track", 0, ["ACE_MainActions"], _trackAction] call ace_interact_menu_fnc_addActionToClass;

        private _wheelAction = [
            QGVAR(aceSalvageTire),
            QUOTE(Salvage Tire),
            QUOTE(a3\ui_f_oldman\data\igui\cfg\holdactions\repair_ca.paa),
            {
                params ["_target", "_player"];
                [
                5,
                [_target, _player],
                {
                    params ["_args"];
                    _args params ["_target", "_player"];

                    if ([[QUOTE(ToolKit)]] call EFUNC(common,hasItem)) then {
                        [QEGVAR(common,tileText), format ["Salvaged %1...", [QCLASS(spareTire)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                        deleteVehicle _target;
                        [_player, QCLASS(spareTire), true] call CBA_fnc_addItem;
                    };
                },
                {
                    if ([[QUOTE(ToolKit)]] call EFUNC(common,hasItem)) then {
                        [QEGVAR(common,tileText), "Failed to salvage spare tire..."] call CBA_fnc_localEvent;
                    } else {
                        [QEGVAR(common,tileText), "You need a toolkit to salvage tires..."] call CBA_fnc_localEvent;
                    };
                },
                QUOTE(Salvaging tire...),
                {[[QUOTE(ToolKit)]] call EFUNC(common,hasItem)},
                []
                ] call ace_common_fnc_progressBar;
            },
            {true},
            {},
            ["_target", "_player"],
            [0, 0, 0],
            3
        ] call ace_interact_menu_fnc_createAction;

        ["ACE_Wheel", 0, ["ACE_MainActions"], _wheelAction] call ace_interact_menu_fnc_addActionToClass;
    };
};
