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

if !([[QCLASS(chainsaw_Empty), QCLASS(chainsaw)]] call EFUNC(common,hasItem)) exitWith {[QEGVAR(common,tileText), format [localize LSTRING(NoChainsaw)]] call CBA_fnc_localEvent};

[QCLASS(chainsaw)] call EFUNC(common,countMagazinesAmmo) params ["_currentFuel", "_maxFuel"];

if (_currentFuel isEqualTo _maxFuel) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(ChainsawFull)]] call CBA_fnc_localEvent;
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
        [QEGVAR(common,tileText), format [localize LSTRING(NoFuel)]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    [QCLASS(sawFuel)] call EFUNC(common,itemDecrement);

    [QCLASS(chainsaw)] call EFUNC(common,itemIncrement) params ["_incremented"];

    if !(_incremented) exitWith {
        [QEGVAR(common,tileText), format [localize LSTRING(FuelStatusFull)]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;


