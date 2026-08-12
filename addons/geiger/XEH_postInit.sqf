#include "script_component.hpp"

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {

    private _geigerMenu = [
        QGVAR(geiger_menu),
        localize ECSTRING(assets,GeigerCounter_DisplayName),
        QPATHTOEF(assets,data\icons\personalgeiger.paa),
        {},
        {
            [[QCLASS(geiger)]] call EFUNC(common,hasItem) || [[QCLASS(geiger_NoBattery)]] call EFUNC(common,hasItem)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _geigerMenu] call ACEFUNC(interact_menu,addActionToObject);

    private _showGeiger = [
        QGVAR(geiger_show),
        localize LSTRING(ShowGeiger),
        "",
        {
            call FUNC(show)
        },
        {
            [[QCLASS(geiger)]] call EFUNC(common,hasItem) && !(uiNamespace getVariable [QGVAR(ui_visible), false])
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment), QGVAR(geiger_menu)], _showGeiger] call ACEFUNC(interact_menu,addActionToObject);

    private _hideGeiger = [
        QGVAR(geiger_hide),
        localize LSTRING(HideGeiger),
        "",
        {
            call FUNC(hide)
        },
        {
            uiNamespace getVariable [QGVAR(ui_visible), false]
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment), QGVAR(geiger_menu)], _hideGeiger] call ACEFUNC(interact_menu,addActionToObject);

}] call CBA_fnc_addEventHandler;
