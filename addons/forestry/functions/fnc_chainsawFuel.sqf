#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chainsaw fuel usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_chainsawFuel;
 *
*/

if !([[QCLASS(chainsaw_Empty), QCLASS(chainsaw)]] call EFUNC(common,hasItem)) exitWith {[QEGVAR(common,tileText), format ["You don't have a chainsaw..."]] call CBA_fnc_localEvent};

[QCLASS(chainsaw)] call EFUNC(common,countMagazinesAmmo) params ["_currentFuel", "_maxFuel"];

if (_currentFuel isEqualTo _maxFuel) exitWith {
    [QEGVAR(common,tileText), format ["Your chainsaw is already full of fuel..."]] call CBA_fnc_localEvent;
};

[{
    params ["_args", "_handle"];

    private _hasEmptySaw = [[QCLASS(chainsaw_Empty)]] call EFUNC(common,hasItem);
    private _hasSaw = [[QCLASS(chainsaw)]] call EFUNC(common,hasItem);

    if (_hasEmptySaw && !_hasSaw) then {
        [player, QCLASS(chainsaw_Empty)] call CBA_fnc_removeItem;
        [QCLASS(sawFuel)] call EFUNC(common,itemDecrement);
        [player, QCLASS(chainsaw), 1] call CBA_fnc_addMagazine;
    };

    if !([[QCLASS(sawFuel)]] call EFUNC(common,hasItem)) exitWith {
        [QEGVAR(common,tileText), format ["You have no more fuel..."]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    [QCLASS(sawFuel)] call EFUNC(common,itemDecrement);

    [QCLASS(chainsaw)] call EFUNC(common,itemIncrement) params ["_incremented"];

    if !(_incremented) exitWith {
        [QEGVAR(common,tileText), format ["Chainsaw is full of fuel..."]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;


