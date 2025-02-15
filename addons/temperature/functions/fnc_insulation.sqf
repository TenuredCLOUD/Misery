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

private _clothingWarmth = format [localize "STR_MISERY_ClothingWarmthVAL", ((player call FUNC(clothing)) select 0)];

if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
    private _clothingInsulationEruStr = format ["<t font='PuristaMedium'>%1 %2 %3</t>", _clothingWarmth, localize "STR_MISERY_ClothingInsulationVAL", ((player call FUNC(clothing)) select 2)];
    [QEGVAR(common,tileText), _clothingInsulationEruStr] call CBA_fnc_localEvent;
} else {
    private _clothingInsulationLessInfoStr = format ["<t font='PuristaMedium'>%1 %2</t>", localize "STR_MISERY_ClothingInsulationVAL", ((player call FUNC(clothing)) select 2)];
    [QEGVAR(common,tileText), _clothingInsulationLessInfoStr] call CBA_fnc_localEvent;
};
