[
QGVAR(hudShow), 
"CHECKBOX", 
["WBK IMS HUD", "Enable IMS HUD"], 
["Misery","WBK IMS HUD settings"], 
false, 
2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
{
params ["_value"];
GVAR(hudShow) = _value;
if !(GVAR(hudShow)) then {WBK_ShowHud = false} else {WBK_ShowHud = true}; 
} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;