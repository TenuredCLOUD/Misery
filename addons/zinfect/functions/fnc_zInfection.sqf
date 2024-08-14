#include "..\script_component.hpp"
/*
    Misery Infection system with CBA HIT EH
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

if (!hasInterface) exitWith {};

if !(Miseryzedinfect) exitwith {};

["CAManBase", "hit", {_this spawn Misery_fnc_ZedInfection}, true, [], true] call CBA_fnc_addClassEventHandler;

Misery_fnc_ZedInfection = {
params ["_unit", "_source", "_damage", "_instigator"];

if (!isplayer _unit) exitwith {}; //If NOT player do nothing

if !(isNull objectParent player) exitwith {}; //If NOT player or Player is in vehicle do nothing

if ((isPlayer _unit) && (_instigator isKindOf "zombie")) then { //If IS player then proceed to infection

if((random 100) > Miseryzedinfectchance) exitWith {
player setVariable ["zednotif", format ["<t>Possible Infection... <img shadow='0' size='1.5' image='%1'/>", "Zinfect\icons\zedhand.paa"]];
hintSilent parseText format ["<t>%1</t><br/>",
player getVariable ['zednotif', nil]
];
sleep 8;
hintSilent "";
};

//---------------------------------------------------Infected status
player setVariable ["zednotif", format ["<t>Possible Infection... <img shadow='0' size='1.5' image='%1'/>", "Zinfect\icons\zedhand.paa"]];
hintSilent parseText format ["<t>%1</t><br/>",
player getVariable ['zednotif', nil]
];
sleep 8;
hintSilent "";

player setVariable ["Zinfectionlogged", true];

_time = time + 180;
[_time] spawn {
    private ["_TimeA"];
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};
    if (alive player) then {

    player setVariable ["Zinfectionlogged", nil];

    private _MDebuffs = player getVariable "MiseryDebuffs";

    player setVariable ["MiseryInfection", (random 10)]; //add random infection status up to value of 10
    _MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs]; //Push parasites to player

            };
        };
    };
};
