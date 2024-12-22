[
QGVAR(hudShow), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
"CHECKBOX", // setting type
["WBK IMS HUD", "Enable IMS HUD"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
["Misery","WBK IMS HUD settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
false, // data for this setting: [min, max, default, number of shown trailing decimals]
2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
{
params ["_value"];
GVAR(hudShow) = _value;
if !(GVAR(hudShow)) then {WBK_ShowHud = false} else {WBK_ShowHud = true}; 
} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;