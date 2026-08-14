#include "script_component.hpp"

[QGVAR(artifactSpawnEvent), FUNC(spawn)] call CBA_fnc_addEventHandler;

[QGVAR(deleteExcavationNode), {
    params ["_node"];
    if (isNull _node) exitWith {};

    private _proxy = _node getVariable [QGVAR(detectorProxy), objNull];
    if (!isNull _proxy) then {
        deleteVehicle _proxy;
    };

    deleteVehicle _node;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    [QGVAR(setupExcavationNode), {
        params ["_node"];
        if (isNull _node) exitWith {};

        private _digAction = [
            QGVAR(excavateSample),
            localize LSTRING(ExcavateSoil),
            QPATHTOEF(icons,data\shovel_ca.paa),
            {
                params ["_target", "_player"];

                [_player, "AinvPknlMstpSnonWnonDnon_medic4"] call ACEFUNC(common,doAnimation);

                [
                    10,
                    [_target, _player],
                    {
                        params ["_args"];
                        _args params ["_node", "_player"];

                        [_player, QCLASS(fallout_glass), true] call CBA_fnc_addItem;

                        [_player] call FUNC(protectedDig);

                        [_player, "", 1] call ACEFUNC(common,doAnimation);

                        [localize LSTRING(ExcavatedSoil), 1, [1, 1, 1, 1]] call CBA_fnc_notify;

                        private _jipID = _node getVariable [QGVAR(nodeJipID), ""];

                        if (_jipID isNotEqualTo "") then {
                            _jipID call CBA_fnc_removeGlobalEventJIP;
                        };

                        [QGVAR(deleteExcavationNode), [_node]] call CBA_fnc_serverEvent;
                    },
                    {
                        [localize LSTRING(ExcavationStopped), 1, [1, 1, 1, 1]] call CBA_fnc_notify;
                        [ACE_player, "", 1] call ACEFUNC(common,doAnimation);
                    },
                    localize LSTRING(ExcavatingSoil)
                ] call ACEFUNC(common,progressBar);
            },
            {
                params ["", "_player"];

                [[QCLASSACE(EntrenchingTool)]] call EFUNC(common,hasItem);
            },
            {},
            [],
            [0, 0, 0],
            1
        ] call ACEFUNC(interact_menu,createAction);

        [_node, 0, [], _digAction] call ACEFUNC(interact_menu,addActionToObject);
    }] call CBA_fnc_addEventHandler;
};

GVAR(processedMarkers) = [];

if (isServer) then {
    call FUNC(inArea);
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    [] call FUNC(exposure);

    private _leadContainer = [
        QGVAR(leadContainers_menu),
        localize LSTRING(StoreSample),
        QPATHTOEF(icons,data\package_open_ca.paa),
        {
            call FUNC(storeSample);
        },
        {
            [[QCLASS(leadContainer_Open), QCLASS(leadContainer_Closed)]] call EFUNC(common,hasItem) && [[QCLASS(fallout_glass)]] call EFUNC(common,hasItem)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _leadContainer] call ACEFUNC(interact_menu,addActionToObject);
}] call CBA_fnc_addEventHandler;
