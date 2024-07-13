/*
Misery Module startup function (Hud systems)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _module=(entities "Misery_HUDDefines")select 0;
MiseryToolsHUD=_module getVariable "Misery_Toolsdisplay";
MiseryGMDisplayprop=_module getVariable "Misery_Gascartridgedisplay";

if (!hasInterface) exitWith {};

[{!isNull player}, {

    if (MiseryToolsHUD == "ENABLED") then {
    [] execVM "\z\misery\addons\framework\scripts\survival\HUD\GeigerBar.sqf";
    [] execVM "\z\misery\addons\framework\scripts\survival\HUD\PDA_Time.sqf";
    [] execVM "\z\misery\addons\framework\scripts\survival\HUD\PDA_Climate.sqf";
    [] execVM "\z\misery\addons\framework\scripts\survival\HUD\PDA_Compass.sqf";
    };

    if (MiseryGMDisplayprop == "ENABLED") then {
    [] execVM "\z\misery\addons\framework\scripts\survival\HUD\gasmaskcart.sqf";
    };

}, []] call CBA_fnc_waitUntilAndExecute;
