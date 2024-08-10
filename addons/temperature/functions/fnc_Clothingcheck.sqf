/*
Clothing insulation check
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _clothingWarmth = format [localize "STR_MISERY_ClothingWarmthVAL", ((player call Misery_fnc_ClothingWarmth) select 0)];

if ("Misery_ERU" in items player) then {
    private _formattedText = format ["<t font='PuristaMedium'>%1 %2</t>", _clothingWarmth, format [localize "STR_MISERY_ClothingInsulationVAL", ((player call Misery_fnc_ClothingWarmth) select 2)], "PLAIN DOWN", -1, true, true];
    [_formattedText] call Misery_fnc_FormatToTile;
} else {
    private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_ClothingInsulationVAL", ((player call Misery_fnc_ClothingWarmth) select 2)], "PLAIN DOWN", -1, true, true];
    [_formattedText] call Misery_fnc_FormatToTile;
};
