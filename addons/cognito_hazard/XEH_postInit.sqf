#include "script_component.hpp"

if (isServer) then {
    call FUNC(inArea);
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    [QGVAR(cognitoHazardEvent), FUNC(process)] call CBA_fnc_addEventHandler;
    [QGVAR(cognitoHazardAudio), FUNC(audioEffect)] call CBA_fnc_addEventHandler;

    private _shpMenu = [
        QGVAR(shp_menu),
        localize ECSTRING(assets,SHP_DisplayName),
        QPATHTOEF(assets,data\icons\toolkit.paa),
        {},
        {
            [[QCLASS(shpKit)]] call EFUNC(common,hasItem)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _shpMenu] call ACEFUNC(interact_menu,addActionToObject);

    private _equipSHP = [
        QGVAR(equipSHP),
        localize LSTRING(EquipSHP),
        "",
        {
            call FUNC(detectorLoop);
            ACE_player setVariable [QGVAR(hasSHP), true];
        },
        {
            [[QCLASS(shpKit)]] call EFUNC(common,hasItem) && !(ACE_player getVariable [QGVAR(hasSHP), false]) && !(ACE_player getVariable [QCLASSACE(hasEarPlugsIn), false])
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment), QGVAR(shp_menu)], _equipSHP] call ACEFUNC(interact_menu,addActionToObject);

    private _unequipSHP = [
        QGVAR(unequipSHP),
        localize LSTRING(UnequipSHP),
        "",
        {
            ACE_player setVariable [QGVAR(hasSHP), false]
        },
        {
            ACE_player getVariable [QGVAR(hasSHP), false]
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment), QGVAR(shp_menu)], _unequipSHP] call ACEFUNC(interact_menu,addActionToObject);
}] call CBA_fnc_addEventHandler;
