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

private _clothingWarmth = format [localize LSTRING(ClothingWarmthVal), [(((ACE_player call FUNC(clothing)) select 0) / 5), 1, 2, true] call CBA_fnc_formatNumber];

if ([[QCLASSACE(Kestrel4500)]] call EFUNC(common,hasItem)) then {
    [QEGVAR(common,tileText), _clothingWarmth] call CBA_fnc_localEvent;
} else {
    [QEGVAR(common,tileText), [format [localize LSTRING(ClothingInsulationVal), ((ACE_player call FUNC(clothing)) select 2)], 5]] call CBA_fnc_localEvent;
};
