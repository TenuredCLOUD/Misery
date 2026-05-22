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

private _clothingWarmth = format [localize LSTRING(ClothingWarmthVal), ((player call FUNC(clothing)) select 0)];

if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
    [QEGVAR(common,tileText), [format [_clothingWarmth, localize LSTRING(ClothingInsulationVal), ((player call FUNC(clothing)) select 2), 5]]] call CBA_fnc_localEvent;
} else {
    [QEGVAR(common,tileText), [format [localize LSTRING(ClothingInsulationVal), ((player call FUNC(clothing)) select 2)], 5]] call CBA_fnc_localEvent;
};
