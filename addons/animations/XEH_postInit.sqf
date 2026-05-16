#include "script_component.hpp"

GVAR(currentActionProp) = objNull;

GVAR(itemData) = createHashMapFromArray [
    ["Land_BottlePlastic_V2_F", [[0.02, -0.008, -0.01], [[0, 1, -3], [0, 1, 2]], 5, QGVAR(drinkBottle)]],
    ["Land_Canteen_F", [[0.03, -0.01, -0.01], [[0, 1, -3], [0, 0, 2]], 5, QGVAR(drinkCanteen)]],
    ["Land_Can_Rusty_F", [[0.005, 0.03, 0.01], [[0, 1, -3], [0, 1, 2]], 3.5, QGVAR(drinkSoda)]],
    ["Land_Can_V1_F", [[0.005, 0.03, 0.01], [[0, 1, -3], [0, 1, 2]], 3.5, QGVAR(drinkSoda)]],
    ["Land_Can_V2_F", [[0.005, 0.03, 0.01], [[0, 1, -3], [0, 1, 2]], 3.5, QGVAR(drinkSoda)]],
    ["Land_Can_V3_F", [[0.005, 0.03, 0.01], [[0, 1, -3], [0, 1, 2]], 3.5, QGVAR(drinkSoda)]],
    ["Land_BakedBeans_F", [[0.03, -0.0001, -0.01], [[0, 1, -3], [0, 0, 2]], 9, QGVAR(eatCanned)]],
    ["Land_TacticalBacon_F", [[0.03, -0.0001, -0.01], [[0, 1, -3], [0, 0, 2]], 9, QGVAR(eatCanned)]],
    ["Land_TinContainer_F", [[0.03, -0.0001, -0.01], [[1, 1, -3], [0, 1, 2]], 7, QGVAR(eatPackaged)]],
    ["Land_CerealsBox_F", [[0.1, 0, -0.02], [[0, 2, -3], [0, 0, 2]], 7, QGVAR(eatPackaged)]],
    ["Land_RiceBox_F", [[0.03, -0.0001, -0.01], [[0, 1, -3], [0, 0, 2]], 7, QGVAR(eatPackaged)]],
    ["Land_PowderedMilk_F", [[0.03, -0.0001, -0.01], [[0, 1, -3], [0, 0, 2]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_BeefStew_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_ChickenTikkaMasala_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_ChickenHerbDumplings_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_CreamChickenSoup_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_CreamTomatoSoup_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_LambCurry_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_MeatballsPasta_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["ACE_MRE_SteakVegetables_Item", [[0, 0, 0.6], [[0, 1, -3], [0, 0, 0]], 7, QGVAR(eatPackaged)]],
    ["Land_HeatPack_F", [[0.005, 0.03, 0.01], [[0, 1, -3], [0, 1, 2]], 2, QGVAR(thermalPack)]],
    ["Land_Antibiotic_F", [[0.005, 0.03, 0.01], [[0, 1, -3], [0, 1, 2]], 5, QGVAR(pillBottle)]],
    ["Land_VitaminBottle_F", [[0.005, 0.03, 0.01], [[0, 1, -3], [0, 1, 2]], 5, QGVAR(pillBottle)]]
];

if !(hasInterface) exitWith {};

["cameraView", {
    params ["_unit", "_newView"];
    if (_unit isNotEqualTo player) exitWith {};

    if (!isNull GVAR(currentActionProp) && {_newView isEqualTo "INTERNAL"}) then {
        deleteVehicle GVAR(currentActionProp);
    };
}] call CBA_fnc_addPlayerEventHandler;
