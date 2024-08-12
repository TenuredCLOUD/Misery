#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Parses text into textTile
 *
 * Arguments:
 * 0: Formatted Text <TEXT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_common_formatToTile
*/

params ["_formattedText"];

[parseText _formattedText, true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
