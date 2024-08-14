#include "..\script_component.hpp"
/*
Misery Demolishing
Designed specifically for Misery mod
by TenuredCLOUD
*/

[
    player,
    "Demolish object",
    QPATHTOEF(icons,data\sledgehammer_ca.paa),
    QPATHTOEF(icons,data\sledgehammer_ca.paa),
    "call Misery_fnc_HasSledghammer",
    "call Misery_fnc_NearNMB",
    {
    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
    player setVariable ["_TC_sound", true,true];
    [_soundDummy, ["SHammerWOOD", 150]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(player getVariable ["_TC_sound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
    {
    private _prog = (_this select 4);
    private _progcalc = round (_prog / 24 * 100);
    titleText [format["Demolishing Object... %1%2", _progcalc, "%"], "PLAIN DOWN"];
    },
    {

    deletevehicle cursortarget; //Structure deleted

    player additem "NMIB_WoodNails_Itm";
    player additem "NMIB_WoodPlanks_Itm";

    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    player setVariable ["_TC_sound", false,true];
    },
    {
    player setVariable ["_TC_sound", false,true];
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    },
    [],
    30,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
