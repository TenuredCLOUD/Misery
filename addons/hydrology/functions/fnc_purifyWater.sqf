#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Water purification tablet usage
 * Decrements water tablets based on water sources in inventory
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_purifyWater;
 *
 * Public: No
*/

if (!([[QCLASS(pureTablets)]] call EFUNC(common,hasItem))) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoPurificationTablets)] call CBA_fnc_localEvent;
};

private _containerData = [
    [QCLASS(waterJerryCan_Dirty), QCLASS(waterJerryCan_Purified), 10],
    [QCLASS(waterJerryCan_Clean), QCLASS(waterJerryCan_Purified), 10],
    [QCLASS(canteen_Dirty), QCLASS(canteen_Purified), 2],
    [QCLASS(canteen_Clean), QCLASS(canteen_Purified), 2],
    [QCLASS(waterBottle_Dirty), QCLASS(waterBottle_Purified), 1],
    [QCLASS(waterBottle_Clean), QCLASS(waterBottle_Purified), 1]
];

private _targetContainer = [];

{
    _x params ["_inputClass", "_purifiedClass", "_reqTablets"];
    if ([[_inputClass]] call EFUNC(common,hasItem)) exitWith {
        _targetContainer = _x;
    };
} forEach _containerData;

if (_targetContainer isEqualTo []) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoContainersNeedPurification)] call CBA_fnc_localEvent;
};

_targetContainer params ["_inputClass", "_purifiedClass", "_reqTablets"];

[QCLASS(pureTablets)] call EFUNC(common,countMagazinesAmmo) params ["_count", "_capacity"];

if (_count < _reqTablets) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NotEnoughTablets), _reqTablets, [(_targetContainer select 0)] call EFUNC(common,getItemData) select 0, _count]] call CBA_fnc_localEvent;
};

[_inputClass] call EFUNC(common,countMagazinesAmmo) params ["_lastVolume"];

[player, _inputClass] call CBA_fnc_removeItem;

[player, _purifiedClass, _lastVolume, true] call CBA_fnc_addMagazine;

if (_reqTablets >= 10) then {
    [player, QCLASS(pureTablets)] call CBA_fnc_removeItem;
    [QEGVAR(common,tileText), format [localize LSTRING(UsedAllTablets), [(_targetContainer select 0)] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
} else {
    for "_i" from 1 to _reqTablets do {
        [QCLASS(pureTablets)] call EFUNC(common,itemDecrement);
    };
    [QEGVAR(common,tileText), format [localize LSTRING(TabletsUsedCount), [(_targetContainer select 0)] call EFUNC(common,getItemData) select 0, _reqTablets]] call CBA_fnc_localEvent;
};
