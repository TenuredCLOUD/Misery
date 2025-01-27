#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, SlayNoMore
 * puts fishing pole in player's hand as well as chance processing for catching fish
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_action
 *
*/

[
    player,
    "Fish",
    QPATHTOEF(icons,data\fish_ca.paa),
    QPATHTOEF(icons,data\fish_ca.paa),
    QUOTE(call FUNC(canFish)),
    QUOTE(call FUNC(hasGear)),
    {
    //Starting variable:
    GVAR(canFish) = true;

    //Force holstering
    if (currentWeapon player isNotEqualTo "") then {
    player action["SWITCHWEAPON",player,player,-1];
    };
    // TODO: Redo - Fishing pole logic
    // GVAR(actionLogic) = "GroundWeaponHolder_Scripted" createVehicle(getPos player);
    // GVAR(actionLogic) addItemCargoGlobal [QCLASS(fishingPole), 1];
    // GVAR(actionLogic) setDir 0;
    // GVAR(actionLogic) attachTo [player,[0,-0.15,-0.75],"rightHandMiddle1",true];
    // GVAR(actionLogic) setVectorDirAndUp [[3,0,0.55],[9.05,0.65,-0.15]];
    },
    {
    private _actionID = (_this select 2);
    private _random = [1, 100] call BIS_fnc_randomInt;

    if (call FUNC(hasGear) && GVAR(canFish)) then {
    titleText ["Fishing...", "PLAIN DOWN"];
    };

    if (_random isEqualTo 25) exitWith {
    titleText ["You caught a fish!", "PLAIN DOWN"];

    _todelete = [];

    _fishtoground = "GroundWeaponHolder" createVehicle [0,0,0];
    _fishtoground addItemCargoGlobal [QCLASS(rawFish), 1];
    _fishtoground enableCollisionWith player;
    _fishtoground setPos (player modelToWorld [.3,-.3,0]);
    _todelete append [_fishtoground];
    GVAR(canFish) = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    //deleteVehicle GVAR(actionLogic);
    };

    if (_random isEqualTo 50) exitWith {
    titleText ["Something broke, or flew off the line, and you failed to catch anything...", "PLAIN DOWN"];
    _part = selectRandom [QCLASS(fishingSpool), QCLASS(fishhook), QCLASS(worms), QCLASS(worms), QCLASS(worms)];
    player removeItem _part;
    GVAR(canFish) = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    //deleteVehicle GVAR(actionLogic);
    };

    if (_random isEqualTo 75) exitWith {
    titleText ["You lost your bait...", "PLAIN DOWN"];
    _part = selectRandom [QCLASS(worms), QCLASS(worms)];
    player removeItem _part;
    GVAR(canFish) = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    //deleteVehicle GVAR(actionLogic);
    };

    if (_random isEqualTo 100) exitWith {
    titleText ["Your hook and bait are gone...", "PLAIN DOWN"];
    player removeItem QCLASS(fishhook);
    player removeItem QCLASS(worms);
    GVAR(canFish) = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    //deleteVehicle GVAR(actionLogic);
    };
    },
    {
    titleText ["You didn't catch anything...", "PLAIN DOWN"];
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    //deleteVehicle GVAR(actionLogic);
    },
    {
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    //deleteVehicle GVAR(actionLogic);
    },
    [],
    120,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
