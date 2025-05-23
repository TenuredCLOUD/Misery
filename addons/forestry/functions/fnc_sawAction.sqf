#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chainsaw usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_sawAction;
 *
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
    if (currentWeapon player isNotEqualTo "") then {
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

    if (call Misery_fnc_NearTreeSaw && MiseryCanSawWood) then {
    titleText [format["Sawing progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
    };

    if (_random isEqualTo 100) exitWith {
    titleText ["Your saw ran out of fuel...", "PLAIN DOWN"];
    player removeItem QCLASS(chainsaw);
    player addItem QCLASS(chainsaw_Empty);
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
        _woodtoground1 addItemCargoGlobal [QCLASS(firewood), _rfirewood];
        _woodtoground1 enableCollisionWith player;
        _woodtoground1 setPos (player modelToWorld [1,-.3,.1]);
        _todelete append [_woodtoground1];

        _woodtoground2 = "GroundWeaponHolder" createVehicle [0,0,0];
        _woodtoground2 addItemCargoGlobal [QCLASS(woodenlog), _rlog];
        _woodtoground2 enableCollisionWith player;
        _woodtoground2 setPos (player modelToWorld [2,-.3,.1]);
        _todelete append [_woodtoground2];

        _woodtoground3 = "GroundWeaponHolder" createVehicle [0,0,0];
        _woodtoground3 addItemCargoGlobal [QCLASS(woodensticks), _rstick];
        _woodtoground3 enableCollisionWith player;
        _woodtoground3 setPos (player modelToWorld [.5,-.3,.1]);
        _todelete append [_woodtoground3];

    //Simulate tree felling:
    private _nearTrees = nearestTerrainObjects [player, ["TREE", "SMALL TREE"], 2.5, true, true];
     {_x setDamage 1} forEach _nearTrees;

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
