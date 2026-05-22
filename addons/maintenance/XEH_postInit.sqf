#include "script_component.hpp"

// Exit system if ACE repair is enabled
if (!isNil QACEGVAR(repair,enabled) && {ACEGVAR(repair,enabled)}) exitWith {};

if (isServer) then {
    call FUNC(initVehicles);
};

if (hasInterface && !GVAR(difficulty)) then {
    call FUNC(vehicleControl);

    // Add ACE interactions for ace wheels & tracks since even with ace repair disabled players can still interact with spare repair items on vehicles
    if (QCLASSACE(main) call EFUNC(common,isModLoaded)) then {
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
                        [QEGVAR(common,tileText), format [localize LSTRING(TrackScavengeSuccess), [QCLASS(trackRepairKit)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                        deleteVehicle _target;
                        [_player, QCLASS(emptyToolKit)] call CBA_fnc_removeItem;
                        [_player, QCLASS(trackRepairKit), 1, true] call CBA_fnc_addMagazine;
                    };

                    if ([[QCLASS(trackRepairKit)]] call EFUNC(common,hasItem)) then {

                        [QCLASS(trackRepairKit)] call EFUNC(common,itemIncrement) params ["_incremented"];

                        if !(_incremented) exitWith {
                            [QEGVAR(common,tileText), format [localize LSTRING(TrackScavengeNoSpace), [QCLASS(trackRepairKit)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                        };
                        if (_incremented) exitWith {
                            [QEGVAR(common,tileText), format [localize LSTRING(TrackScavengeSuccess), [QCLASS(trackRepairKit)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                            deleteVehicle _target;
                        };
                    };
                },
                {
                    if ([[QCLASS(trackRepairKit)]] call EFUNC(common,hasItem) || [[QCLASS(emptyToolKit)]] call EFUNC(common,hasItem)) then {
                        [QEGVAR(common,tileText), localize LSTRING(TrackScavengeFailed)] call CBA_fnc_localEvent;
                    } else {
                        [QEGVAR(common,tileText), format [localize LSTRING(TrackScavengeToolsRequired), localize LSTRING(ToolToolkit), localize LSTRING(ToolsTrackRepairKit)]] call CBA_fnc_localEvent;
                    };
                },
                localize LSTRING(TrackSalvageProgress),
                {[[QUOTE(ToolKit)]] call EFUNC(common,hasItem) && ([[QCLASS(trackRepairKit)]] call EFUNC(common,hasItem) || [[QCLASS(emptyToolKit)]] call EFUNC(common,hasItem))},
                []
                ] call ACEFUNC(common,progressBar);
            },
            {true},
            {},
            ["_target", "_player"],
            [0, 0, 0],
            3
        ] call ACEFUNC(interact_menu,createAction);

        [QCLASSACE(Track), 0, [QUOTE(ACE_MainActions)], _trackAction] call ACEFUNC(interact_menu,addActionToClass);

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
                        [QEGVAR(common,tileText), format [localize LSTRING(TireSalvageSuccess), [QCLASS(spareTire)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                        deleteVehicle _target;
                        [_player, QCLASS(spareTire), true] call CBA_fnc_addItem;
                    };
                },
                {
                    if ([[QUOTE(ToolKit)]] call EFUNC(common,hasItem)) then {
                        [QEGVAR(common,tileText), localize LSTRING(TireSalvageFailed)] call CBA_fnc_localEvent;
                    } else {
                        [QEGVAR(common,tileText), localize LSTRING(TireSalvageToolsRequired)] call CBA_fnc_localEvent;
                    };
                },
                localize LSTRING(TireSalvageProgress),
                {[[QUOTE(ToolKit)]] call EFUNC(common,hasItem)},
                []
                ] call ACEFUNC(common,progressBar);
            },
            {true},
            {},
            ["_target", "_player"],
            [0, 0, 0],
            3
        ] call ACEFUNC(interact_menu,createAction);

        [QCLASSACE(Wheel), 0, [QUOTE(ACE_MainActions)], _wheelAction] call ACEFUNC(interact_menu,addActionToClass);
    };
};
