#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Extinguishes nearby fire
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_extinguish
 */

private _display = findDisplay 982388;
private _noteBox = _display displayCtrl 1001;
private _nearbyFire = objNull;
private _fireIndex = -1;

{
    if (player distance (_x select 0) < 2.5) exitWith {
        _nearbyFire = _x select 0;
        _fireIndex = _forEachIndex;
    };
} forEach GVAR(activeFires);

if (isNull _nearbyFire) then {
    _noteBox ctrlSetText localize LSTRING(ExtinguishNone);
} else {
    if (isServer) then {
        if (inflamed _nearbyFire) then {
            _nearbyFire inflame false;
            (GVAR(activeFires) select _fireIndex) set [2, 0];
            publicVariable QGVAR(activeFires);
            _noteBox ctrlSetText localize LSTRING(Extinguished);
        } else {
            _noteBox ctrlSetText localize LSTRING(AlreadyExtinguished);
        };
    } else {
        [QGVAR(extinguishFire), [_nearbyFire, _fireIndex, _display]] call CBA_fnc_serverEvent;
    };
};
