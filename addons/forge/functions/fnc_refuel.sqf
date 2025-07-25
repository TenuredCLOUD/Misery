#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forge add fuel action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forge_fnc_refuel
 *
*/

[player] call FUNC(stats) params ["_forge", "_fuelLevel"];

[{!isNull findDisplay 982388}, {
    params ["_forge", "_fuelLevel"];

    if (_fuelLevel >= 1) exitWith {
        ctrlSetText [1001, "This forge has plenty of coal..."];
    };

    if !([[QCLASS(coalOre)]] call EFUNC(common,hasItem)) exitWith {
        ctrlSetText [1001, "You need coal ore to refuel this forge..."];
    };

    [player, QCLASS(coalOre)] call CBA_fnc_removeItem;
    ctrlSetText [1001, "Coal ore x1 added..."];

    _forge setVariable [QGVAR(fuel), _fuelLevel + 0.05, true];

}, [_forge, _fuelLevel]] call CBA_fnc_waitUntilAndExecute;
