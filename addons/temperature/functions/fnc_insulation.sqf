#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clothing insulation check
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_insulation;
 *
 * Public: No
*/

private _clothingWarmth = format [localize "STR_MISERY_ClothingWarmthVAL", ((player call Misery_fnc_ClothingWarmth) select 0)];

if ("Misery_ERU" in items player) then {
    private _formattedText = format ["<t font='PuristaMedium'>%1 %2 %3</t>", _clothingWarmth, localize "STR_MISERY_ClothingInsulationVAL", ((player call Misery_fnc_ClothingWarmth) select 2)];
    [_formattedText] call EFUNC(common,formatToTile);
} else {
    private _formattedText = format ["<t font='PuristaMedium'>%1 %2</t>", localize "STR_MISERY_ClothingInsulationVAL", ((player call Misery_fnc_ClothingWarmth) select 2)];
    [_formattedText] call EFUNC(common,formatToTile);
};
