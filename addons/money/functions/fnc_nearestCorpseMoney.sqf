#include "..\script_component.hpp"
/*
Returns if near a corpse "man based" and the Nearest corpse itself
Designed specifically for Misery mod
by TenuredCLOUD
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

