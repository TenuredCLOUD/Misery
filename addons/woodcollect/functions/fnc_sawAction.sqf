#include "..\script_component.hpp"
/*
Chainsaw usage
Designed specifically for Misery mod
by TenuredCLOUD
*/

 [
    player,
    "Saw wood",
    QPATHTOEF(icons,data\chainsaw_ca.paa),
    QPATHTOEF(icons,data\chainsaw_ca.paa),
    "call Misery_fnc_NearTreeSaw",
    "call Misery_fnc_NearTreeSaw",
    {
    //Starting variable:
    MiseryCanSawWood = true;

    //Force holstering
    if !((currentWeapon player)=="") then {
    player action["SWITCHWEAPON",player,player,-1];
    };

    //soundsource:
    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
    _soundDummy attachTo [player, [0, 0, 0], "Pelvis"];
    player setVariable ["_TC_sound", true,true];
    [_soundDummy, ["Chain2", 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(player getVariable ["_TC_sound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
    },
    {
    private _actionID = (_this select 2);
    private _random = [1, 200] call BIS_fnc_randomInt;
    private _prog = (_this select 4);
    private _progcalc = round (_prog / 24 * 100);

    if (call Misery_fnc_NearTreeSaw && MiseryCanSawWood == true) then {
    titleText [format["Sawing progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
    };

    if (_random == 100) exitwith {
    titleText ["Your saw ran out of fuel...", "PLAIN DOWN"];
    player removeitem "Misery_Chainsaw";
    player additem "Misery_Chainsawempty";
    MiseryCanSawWood = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    };
    },
    {

    private ["_rfirewood","_rlog","_rstick","_todelete","_woodtoground1","_woodtoground2","_woodtoground3"];

        _rfirewood = [1, 5] call BIS_fnc_randomInt;
        _rlog = [1, 3] call BIS_fnc_randomInt;
        _rstick = [1, 10] call BIS_fnc_randomInt;

        _todelete = [];

        _woodtoground1 = "GroundWeaponHolder" createVehicle [0,0,0];
        _woodtoground1 addItemCargoGlobal ["Misery_firewood", _rfirewood];
        _woodtoground1 enableCollisionWith player;
        _woodtoground1 setpos (player modelToWorld [1,-.3,.1]);
        _todelete append [_woodtoground1];

        _woodtoground2 = "GroundWeaponHolder" createVehicle [0,0,0];
        _woodtoground2 addItemCargoGlobal ["Misery_woodenlog", _rlog];
        _woodtoground2 enableCollisionWith player;
        _woodtoground2 setpos (player modelToWorld [2,-.3,.1]);
        _todelete append [_woodtoground2];

        _woodtoground3 = "GroundWeaponHolder" createVehicle [0,0,0];
        _woodtoground3 addItemCargoGlobal ["Misery_woodensticks", _rstick];
        _woodtoground3 enableCollisionWith player;
        _woodtoground3 setpos (player modelToWorld [.5,-.3,.1]);
        _todelete append [_woodtoground3];

    //Simulate tree felling:
    private _nearTrees = nearestTerrainObjects [player, ["TREE", "SMALL TREE"], 2.5, true, true];
     {_x setdamage 1} foreach _nearTrees;

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
    45,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
