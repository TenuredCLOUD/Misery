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
 * [] call misery_compat_ravage_zombies_fnc_infect;
 *
*/
params ["_unit", "_source", "_damage", "_instigator"];

// Must be a player, on foot being attacked by a zombie.
if !(isPlayer _unit || isNull objectParent player || _instigator isKindOf "zombie") exitWith {};

if (random 100 < GVAR(chance)) exitWith {
    ["ailment","Possible Infection...", QPATHTOEF(icons,data\zedhand_ca.paa), ""] call EFUNC(vitals,addBuffOrAilment);
    [{
        ["ailment", "Possible Infection..."] call EFUNC(vitals,removeBuffOrAilment);
    }, [], 180] call CBA_fnc_waitAndExecute;
};

["ailment","Possible Infection...", QPATHTOEF(icons,data\zedhand_ca.paa), ""] call EFUNC(vitals,addBuffOrAilment);

player setVariable [QCLASS(infectionLogged), true];

[{
    ["ailment", "Possible Infection..."] call EFUNC(vitals,removeBuffOrAilment);
    player setVariable [QCLASS(infectionLogged), nil];
    private _infection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];
    player setVariable [QEGVAR(survival,infection), _infection + ((random 10) / 100)];
}, [], 180] call CBA_fnc_waitAndExecute;
