#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Returns if near a corpse "man based" and the Nearest corpse itself
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_money_fnc_nearestCorpseMoney;
 *
*/

    private _deadEntities = allDeadMen;
    private _nearCorpse = false;
    private _nearestCorpse = objNull;

    {
        if (_x isKindOf "CAManBase" && _x distance player < 2) then {
            if (!_nearCorpse || (_x distance player < _nearestCorpse distance player)) then {
                _nearCorpse = true;
                _nearestCorpse = _x;
            };
        };
    } forEach _deadEntities;

    [_nearCorpse, _nearestCorpse]

