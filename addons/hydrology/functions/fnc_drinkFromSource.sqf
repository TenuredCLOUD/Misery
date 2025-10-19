#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Hydrology Drink from Source Processor
 * Drink from source action with delayed sickness
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_drinkFromSource;
 *
 * Public: No
*/

private _dialog = findDisplay 982380;

[982380, [1600, 1601, 1602], false] call EFUNC(common,displayShowControls);

if ("ace_field_rations" call EFUNC(common,isModLoaded)) then {
    player switchMove "ace_field_rations_drinkFromSourceLow";
} else {
    player playAction "Gear";
};

playSound3D [QPATHTOEF(audio,sounds\items\drink.ogg), player, false, getPosASL player, 4, 1, 10];

[0.01, "thirst"] call EFUNC(common,addStatusModifier);

[0.015, "radiation"] call EFUNC(common,addStatusModifier);

if ([EGVAR(survival,turbidWaterChance)] call EFUNC(common,rollChance)) then {
    [0.01, "parasites"] call EFUNC(common,addStatusModifier);
};

[982380, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
