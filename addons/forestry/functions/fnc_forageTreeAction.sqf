#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Wood foraging
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_forageTreeAction;
 *
*/

 [
    player,
    "Collect wood",
    QPATHTOEF(icons,data\branch_ca.paa),
    QPATHTOEF(icons,data\branch_ca.paa),
    "call Misery_fnc_NearTree",
    "call Misery_fnc_NearTree",
    {
    //Force holstering
    if (currentWeapon player isNotEqualTo "") then {
    player action["SWITCHWEAPON",player,player,-1];
    };

    //Search pockets, etc...
    player playAction "Gear";

    //soundsource:

    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
    _soundDummy attachTo [player, [0, 0, 0], "Pelvis"];
    player setVariable ["_TC_sound", true,true];
    [_soundDummy, ["GatheringFirewood", 50]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(player getVariable ["_TC_sound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
    },
    {
    if (call Misery_fnc_NearTree) then {
    titleText ["Gathering wood...", "PLAIN DOWN"];
    };
    },
    {

    private ["_rstick","_todelete","_woodtoground1"];

        _rstick = [1, 2] call BIS_fnc_randomInt;

        _todelete = [];

        _woodtoground1 = "GroundWeaponHolder" createVehicle [0,0,0];
        _woodtoground1 addItemCargoGlobal [QCLASS(woodensticks), _rstick];
        _woodtoground1 enableCollisionWith player;
        _woodtoground1 setPos (player modelToWorld [1,-.3,.1]);
        _todelete append [_woodtoground1];

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
    120,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
