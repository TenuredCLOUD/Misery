#include "script_component.hpp"

// Exit system if ACE repair is enabled
if (!isNil QACEGVAR(repair,enabled) && {ACEGVAR(repair,enabled)}) exitWith {};

if (isServer) then {
    call FUNC(initVehicles);

    GVAR(handleEngine) = {
        params ["_args", "_handle"];
        _args params ["_vehicle"];

        if (isNull _vehicle || {!alive _vehicle} || {!isEngineOn _vehicle}) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            _vehicle setVariable [QGVAR(enginePFHHandle), -1];
        };

        private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
        private _batteryType = _vehicle getVariable [QGVAR(batteryType), 0];
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
        private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
        private _currentOilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
        private _currentCoolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];
        private _currentEngineDamage = _vehicle getHitPointDamage "hitEngine";

        if (_installedBatteries < _requiredBatteries || _batteryLevel <= 0) exitWith {
            _vehicle engineOn false;
        };

        if (_currentOilLevel < 0.75 || _currentCoolantLevel < 0.75) then {
            _vehicle setHitPointDamage ["hitEngine", (_currentEngineDamage + 0.001) min 1];
        };

        if (_currentEngineDamage > 0.25) then {
            _vehicle setVariable [QGVAR(oilLevel), (_currentOilLevel - 0.001) max 0];
            _vehicle setVariable [QGVAR(coolantLevel), (_currentCoolantLevel - 0.001) max 0];
        };

        if (_installedBatteries > 0) then {
            if (_currentEngineDamage < 0.5) then {
                _vehicle setVariable [QGVAR(batteryLevel), (_batteryLevel + 0.005) min 1];
            } else {
                _vehicle setVariable [QGVAR(batteryLevel), (_batteryLevel - 0.001) max 0];
            };
        } else {
            _vehicle setVariable [QGVAR(batteryLevel), 0];
        };

        if (_installedBatteries > 0 && {_installedBatteries < _requiredBatteries}) then {
            if ([80] call EFUNC(common,rollChance)) then {
                _vehicle engineOn false;
            };
        };
    };

    // Add ACE interactions for ace wheels & tracks since even with ace repair disabled players can still interact with spare repair items on vehicles
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

    // Separate vehicle init to handle Maintenance action & engine PFH
    ["AllVehicles", "Init", {
        params ["_vehicle"];

        if (unitIsUAV _vehicle) exitWith {};

        private _maintenanceAction = [
            QGVAR(maintenance_menu),
            localize LSTRING(Action),
            QPATHTOEF(markers,data\wrench_ca.paa),
            {
                params ["_target", "_player"];

                createDialog QCLASS(maintenance_ui);
                [_target] call FUNC(listed);
                [_target] call FUNC(updateIcon);
                _player setVariable [QGVAR(currentVehicle), _target];
            },
            {
                params ["_target", "_player"];

                !(_target getVariable [QGVAR(ignore), false]);
            }
        ] call ACEFUNC(interact_menu,createAction);

        [_vehicle, 0, [QUOTE(ACE_MainActions)], _maintenanceAction] call ACEFUNC(interact_menu,addActionToObject);

        // If easier maintenance is enabled skip engine handle
        if (GVAR(difficulty)) exitWith {};

        _vehicle addEventHandler ["Engine", {
            params ["_vehicle", "_engineState"];

            private _isIgnored = _vehicle getVariable [QGVAR(ignore), false];

            if (_isIgnored) exitWith {
                _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
            };

            private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
            private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
            private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

            if (_engineState) then {
                if (_installedBatteries < _requiredBatteries || _batteryLevel <= 0) exitWith {
                    _vehicle engineOn false;
                };

                private _pfhHandle = _vehicle getVariable [QGVAR(enginePFHHandle), -1];
                if (_pfhHandle isEqualTo -1) then {
                    private _newHandle = [GVAR(handleEngine), 0.02, [_vehicle]] call CBA_fnc_addPerFrameHandler;
                    _vehicle setVariable [QGVAR(enginePFHHandle), _newHandle];
                };
            } else {
                private _pfhHandle = _vehicle getVariable [QGVAR(enginePFHHandle), -1];
                if (_pfhHandle isNotEqualTo -1) then {
                    [_pfhHandle] call CBA_fnc_removePerFrameHandler;
                    _vehicle setVariable [QGVAR(enginePFHHandle), -1];
                };
            };
        }];

    }, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
};

