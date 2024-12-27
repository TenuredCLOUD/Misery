#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Infection system with CBA HIT EH
 * Processes Zombie infection transmission
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_zinfect_fnc_infect;
 *
*/

if (!hasInterface) exitWith {};

if !(Miseryzedinfect) exitWith {};

["CAManBase", "hit", {_this call Misery_fnc_ZedInfection}, true, [], true] call CBA_fnc_addClassEventHandler;

Misery_fnc_ZedInfection = {
params ["_unit", "_source", "_damage", "_instigator"];

if (!isPlayer _unit) exitWith {}; //If NOT player do nothing

if !(isNull objectParent player) exitWith {}; //If NOT player or Player is in vehicle do nothing

if ((isPlayer _unit) && (_instigator isKindOf "zombie")) then { //If IS player then proceed to infection

if((random 100) > Miseryzedinfectchance) exitWith {
player setVariable ["zednotif", format ["<t>Possible Infection... <img shadow='0' size='1.5' image='%1'/>", QPATHTOEF(icons,data\zedhand_ca.paa)]];
hintSilent parseText format ["<t>%1</t><br/>",
player getVariable ['zednotif', nil]
];
sleep 8;
hintSilent "";
};

//---------------------------------------------------Infected status
player setVariable ["zednotif", format ["<t>Possible Infection... <img shadow='0' size='1.5' image='%1'/>", QPATHTOEF(icons,data\zedhand_ca.paa)]];
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

    private _ailments = player getVariable QCLASS(ailments);

    player setVariable [QCLASS(infection), (random 10)]; //add random infection status up to value of 10
    _ailments pushBackUnique "PARASITES"; player setVariable [QCLASS(ailments), _ailments]; //Push parasites to player

            };
        };
    };
};
