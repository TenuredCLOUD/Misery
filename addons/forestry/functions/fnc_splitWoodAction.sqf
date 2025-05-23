#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Split wooden logs
 * Enables players to reform wood logs to firewood (Chainsaw or Axe compatible)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_splitWoodAction;
 *
*/

[
    player,
    "Split wood log",
    QPATHTOEF(icons,data\firewood_ca.paa),
    QPATHTOEF(icons,data\firewood_ca.paa),
    "'Misery_woodenlog' in items player",
    "'Misery_Chainsaw' in items player || 'Misery_Woodaxe' in items player || (MiseryWBKIMS && {currentWeapon player in ['WBK_axe','WBK_brush_axe','WBK_craftedAxe','FireAxe','Axe']})",
    {
    //Starting variables:
    MiseryCanSplitWoodChain = true;
    MiseryCanSplitWoodAxe = true;

    //Force holstering if WBKIMS disabled:
    if (!MiseryWBKIMS) then {
    if (currentWeapon player isNotEqualTo "") then {
    player action["SWITCHWEAPON",player,player,-1];
        };
    };

    //soundsource:
    if (QCLASS(chainsaw) in items player) then {
    MiseryCanSplitWoodChain = true;
    MiseryCanSplitWoodAxe = false;
    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
    _soundDummy attachTo [player, [0, 0, 0], "Pelvis"];
    player setVariable ["_TC_sound", true,true];
    [_soundDummy, ["Chainsplit", 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(player getVariable ["_TC_sound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
    } else {
    if (QCLASS(woodaxe) in items player || (MiseryWBKIMS && {currentWeapon player in ['WBK_axe','WBK_brush_axe','WBK_craftedAxe','FireAxe','Axe']})) then {
    MiseryCanSplitWoodAxe = true;
    MiseryCanSplitWoodChain = false;
    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
    player setVariable ["_TC_sound", true,true];
    [_soundDummy, ["WoodChop01", 150]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(player getVariable ["_TC_sound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
    };
        };
    },
    {
    private _actionID = (_this select 2);
    private _random = [1, 200] call BIS_fnc_randomInt;
    private _prog = (_this select 4);
    private _progcalc = round (_prog / 24 * 100);

    if (QCLASS(woodenlog) in items player && MiseryCanSplitWoodChain) then {
    titleText [format["Sawing wood log progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
    } else {
    if (QCLASS(woodenlog) in items player && MiseryCanSplitWoodAxe) then {
    titleText [format["Splitting wood log progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
    };
        };

    if (MiseryCanSplitWoodChain && _random isEqualTo 100) exitWith {
    titleText ["Your saw ran out of fuel...", "PLAIN DOWN"];
    player removeItem QCLASS(chainsaw);
    player addItem QCLASS(chainsaw_Empty);
    MiseryCanSplitWoodChain = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    };
    },
    {

    private ["_rfirewood","_todelete","_woodtoground1"];

    player removeItem QCLASS(woodenlog); //remove split wooden log

        _rfirewood = [1, 2] call BIS_fnc_randomInt;

        _todelete = [];

        _woodtoground1 = "GroundWeaponHolder" createVehicle [0,0,0];
        _woodtoground1 addItemCargoGlobal [QCLASS(firewood), _rfirewood];
        _woodtoground1 enableCollisionWith player;
        _woodtoground1 setPos (player modelToWorld [.3,-.3,.1]);
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
    15,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
