#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Dumps all water containers in player's inventory onto the ground
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_dumpWater;
 *
*/

private _dumpData = [
    // Canteens
    [QCLASS(canteen_Purified), QCLASS(canteen_Empty)],
    [QCLASS(canteen_Clean), QCLASS(canteen_Empty)],
    [QCLASS(canteen_Dirty), QCLASS(canteen_Empty)],
    // Bottles
    [QCLASS(waterBottle_Purified), QCLASS(waterBottle_Empty)],
    [QCLASS(waterBottle_Clean), QCLASS(waterBottle_Empty)],
    [QCLASS(waterBottle_Dirty), QCLASS(waterBottle_Empty)],
    // Canisters
    [QCLASS(waterJerryCan_Purified), QCLASS(waterJerryCan_Empty)],
    [QCLASS(waterJerryCan_Clean), QCLASS(waterJerryCan_Empty)],
    [QCLASS(waterJerryCan_Dirty), QCLASS(waterJerryCan_Empty)]
];

{
    _x params ["_fullClass", "_emptyClass"];

    private _count = [_fullClass] call EFUNC(common,countItem);

    if (_count > 0) then {
        for "_i" from 1 to _count do {
            [ACE_player, _fullClass] call CBA_fnc_removeItem;
            [ACE_player, _emptyClass] call CBA_fnc_addItem;
        };
    };
} forEach _dumpData;

[QEGVAR(common,tileText), localize LSTRING(WaterContainersEmptied)] call CBA_fnc_localEvent;

// create simple water spill effect
private _waterSpillPos = getPosASL ACE_player;
_waterSpillPos set [2, getTerrainHeightASL _waterSpillPos];

private _waterSpill = createSimpleObject ["WaterSpill_01_Small_New_F", _waterSpillPos];
_waterSpill setVectorUp surfaceNormal _waterSpillPos;

if (isClass (missionConfigFile >> "CfgGradPersistence")) then {
    [_waterSpill] call GRADFUNC(persistence,blacklistObjects);
};

[{
    deleteVehicle _this;
}, _waterSpill, 15] call CBA_fnc_waitAndExecute;
