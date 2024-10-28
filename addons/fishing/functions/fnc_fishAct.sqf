#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, SlayNoMore
 * puts fishing pole in player's hand as well as chance processing for cathcing fish
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_fishing_fnc_fishAct
 *
*/

[
    player,
    "Fish",
    QPATHTOEF(icons,data\fish_ca.paa),
    QPATHTOEF(icons,data\fish_ca.paa),
    "call Misery_fnc_Canfish",
    "call Misery_fnc_Fishinggear",
    {
    //Starting variable:
    MiseryCanFish = true;

    //Force holstering
    if !((currentWeapon player)=="") then {
    player action["SWITCHWEAPON",player,player,-1];
    };

    Misery_Isfishing = "GroundWeaponHolder_Scripted" createVehicle(getPos player);
    Misery_Isfishing addItemCargoGlobal ["Misery_fishingpole", 1];
    Misery_Isfishing setDir 0;
    Misery_Isfishing attachTo [player,[0,-0.15,-0.75],"rightHandMiddle1",true];
    Misery_Isfishing setVectorDirAndUp [[3,0,0.55],[9.05,0.65,-0.15]];
    },
    {
    private _actionID = (_this select 2);
    private _random = [1, 100] call BIS_fnc_randomInt;

    if (call FUNC(fishingGear) && MiseryCanFish) then {
    titleText ["Fishing...", "PLAIN DOWN"];
    };

    if (_random == 25) exitWith {
    titleText ["You caught a fish!", "PLAIN DOWN"];

    _todelete = [];

    _fishtoground = "GroundWeaponHolder" createVehicle [0,0,0];
    _fishtoground addItemCargoGlobal ["Misery_rawfish_1", 1];
    _fishtoground enableCollisionWith player;
    _fishtoground setPos (player modelToWorld [.3,-.3,0]);
    _todelete append [_fishtoground];
    MiseryCanFish = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    deleteVehicle Misery_Isfishing;
    };

    if (_random == 50) exitWith {
    titleText ["Something broke, or flew off the line, and you failed to catch anything...", "PLAIN DOWN"];
    _part = selectRandom ["Misery_fishingspool", "Misery_fishhook", "Misery_worms", "Misery_worms", "Misery_worms"];
    player removeItem _part;
    MiseryCanFish = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    deleteVehicle Misery_Isfishing;
    };

    if (_random == 75) exitWith {
    titleText ["You lost your bait...", "PLAIN DOWN"];
    _part = selectRandom ["Misery_worms", "Misery_worms"];
    player removeItem _part;
    MiseryCanFish = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    deleteVehicle Misery_Isfishing;
    };

    if (_random == 100) exitWith {
    titleText ["Your hook and bait are gone...", "PLAIN DOWN"];
    player removeItem "Misery_fishhook";
    player removeItem "Misery_worms";
    MiseryCanFish = false;
    [player,_actionID] call BIS_fnc_holdActionRemove;
    deleteVehicle Misery_Isfishing;
    };
    },
    {
    titleText ["You didn't catch anything...", "PLAIN DOWN"];
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    deleteVehicle Misery_Isfishing;
    },
    {
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    deleteVehicle Misery_Isfishing;
    },
    [],
    120,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
