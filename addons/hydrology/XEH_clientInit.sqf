#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (isClass (missionConfigFile >> "CfgMisery_HydrologyData")) then {
    [] call ACEFUNC(common,player) params ["_player"];

    private _dumpAction = [
        QGVAR(dumpWaterAction),
        localize LSTRING(DumpWaterContainers),
        QPATHTOEF(icons,data\droplet_off_ca.paa),
        {},
        {call FUNC(canDumpWater)}
    ] call ACEFUNC(interact_menu,createAction);

    private _dumpActionConfirm = [
        QGVAR(dumpWaterActionConfirm),
        localize LSTRING(Confirm),
        "",
        {call FUNC(dumpWater)},
        {true}
    ] call ACEFUNC(interact_menu,createAction);

    [_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _dumpAction] call ACEFUNC(interact_menu,addActionToObject);
    [_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment), QGVAR(dumpWaterAction)], _dumpActionConfirm] call ACEFUNC(interact_menu,addActionToObject);

    GVAR(lastInteractedSource) = objNull;
    GVAR(activeLogic) = objNull;

    ["CBA_loadingScreenDone", {

        [QCLASSACE(interactMenuOpened), {
            params ["_type"];
            if (_type isNotEqualTo 0) exitWith {};

            [] call FUNC(condition) params ["_found"];

            if !(_found) exitWith {};

            [] call FUNC(interaction);
        }] call CBA_fnc_addEventHandler;

        [QCLASSACE(interactMenuClosed), {
            if (!isNull GVAR(activeLogic)) then {
                [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(hydrology_menu)]] call ACEFUNC(interact_menu,removeActionFromObject);
                [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(checkSource_menu)]] call ACEFUNC(interact_menu,removeActionFromObject);
                deleteVehicle GVAR(activeLogic);
                GVAR(activeLogic) = objNull;
            };
        }] call CBA_fnc_addEventHandler;
    }] call CBA_fnc_addEventHandler;
};
