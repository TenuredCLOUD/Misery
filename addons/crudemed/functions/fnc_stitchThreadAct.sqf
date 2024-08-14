#include "..\script_component.hpp"
/*
Misery Stitch with Needle & Thread (ACE medical compat ONLY)
Designed specifically for Misery mod
by TenuredCLOUD
*/

[
    player,
    "Stitch wounds",
    QPATHTOEF(icons,data\needlethread_ca.paa),
    QPATHTOEF(icons,data\needlethread_ca.paa),
    "'Misery_Needlethread' in items player",
    "[player] call ace_medical_blood_fnc_isBleeding",
    {
    //Force holstering
    if !((currentWeapon player)=="") then {
    player action["SWITCHWEAPON",player,player,-1];
    };

    //ambient action:
    player playAction "Gear";
    },
    {
    titletext ["Stitching wounds...", "PLAIN DOWN"];
    [player, 0.041] call ace_medical_fnc_adjustPainLevel; //after 24 cycles pain will be at max level (0.984)
    },
    {

    if ([player] call ace_medical_blood_fnc_isBleeding) then {

    {
    [player, _x, "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal;
    } forEach ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
    };

    //Remove needle & thread
    player removeitem "Misery_Needlethread";

    if((random 100) > 50) exitWith {
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    };

    //Check if ailments are active (before infection)
    if (MiseryAilments == "ENABLED") then {

    private _timeafter = time + 120;
    [_timeafter] spawn {

    private ["_TimeA"];
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};

    player setVariable ["stitchnotif", format ["<t>Your Stitched wounds feel itchy and are hot to the touch... <img shadow='0' size='1.5' image='%1'/>", "Data\infection.paa"]];
    hintSilent parseText format ["<t>%1</t><br/>",
    player getVariable ['stitchnotif', nil]
    ];
    };

    private _time = time + 120;
    [_time] spawn {
    private ["_TimeA"];
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};
    if (alive player) then {
    player setVariable ["MiseryInfection", (random 15)]; //random infection amount
    };
        };

    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    }else{
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    };
    },
    {
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    },
    [],
    15,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
