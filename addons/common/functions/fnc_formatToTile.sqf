/*
Misery Text Parser to textTile 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

params ["_formattedText"];
[parseText _formattedText, true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

