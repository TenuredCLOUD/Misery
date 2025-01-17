#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cauterization near fire sources (ACE medical compat ONLY)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_crudemed_fnc_cauterizeAct
 *
*/

[
    player,
    "Cauterize wounds",
    QPATHTOEF(icons,data\cauterize_ca.paa),
    QPATHTOEF(icons,data\cauterize_ca.paa),
    "call Misery_fnc_NearFire",
    "[player] call ace_medical_blood_fnc_isBleeding",
    {
    //Force holstering
    if (currentWeapon player != "") then {
    player action["SWITCHWEAPON",player,player,-1];
    };

    //ambient action:
    player playAction "Gear";

    //soundsource:
    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
    player setVariable ["_TC_sound", true, true];
    [_soundDummy, ["Cauterizing", 50]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(player getVariable ["_TC_sound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
    },
    {
    titleText ["Cauterizing wounds...", "PLAIN DOWN"];
    [player, 0.041] call ace_medical_fnc_adjustPainLevel; //after 24 cycles pain will be at max level (0.984)
    },
    {

    if ([player] call ace_medical_blood_fnc_isBleeding) then {

    {
    [player, _x, "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal;
    } forEach ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
    };

    if((random 100) > 50) exitWith {
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    player setVariable ["_TC_sound", false,true];
    };

    //Check if ailments are active (before infection)
    if (EGVAR(survival,ailments) == "ENABLED") then {

    private _timeafter = time + 120;
    [_timeafter] spawn {

    private ["_TimeA"];
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};

    player setVariable ["cauterizenotif", format ["<t>Your Cauterized wounds feel itchy and are hot to the touch... <img shadow='0' size='1.5' image='%1'/>", QPATHTOEF(icons,data\infection_ca.paa)]];
    hintSilent parseText format ["<t>%1</t><br/>",
    player getVariable ['cauterizenotif', nil]
    ];
    };

    private _time = time + 120;
    [_time] spawn {
    private ["_TimeA"];
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};
    if (alive player) then {
    player setVariable [QEGVAR(survival,infection), (random 15)]; //random infection amount
    };
        };

    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    player setVariable ["_TC_sound", false,true];
    }else{
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    player setVariable ["_TC_sound", false,true];
    };
    },
    {
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    player setVariable ["_TC_sound", false,true];
    },
    [],
    10,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
