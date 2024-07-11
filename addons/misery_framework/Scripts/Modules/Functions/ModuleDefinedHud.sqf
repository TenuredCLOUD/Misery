/*
Misery Module startup function (Hud systems)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _module=(entities"Misery_HUDDefines")select 0;
MiseryToolsHUD=_module getVariable"Misery_Toolsdisplay";
MiseryGMDisplayprop=_module getVariable"Misery_Gascartridgedisplay";

if (!hasInterface) exitWith {};

[{!isNull player}, {

    if (MiseryToolsHUD == "ENABLED") then {
    [] execVM "Misery\Scripts\Survival\HUD\GeigerBar.sqf";
    [] execVM "Misery\Scripts\Survival\HUD\PDA_Time.sqf";
    [] execVM "Misery\Scripts\Survival\HUD\PDA_Climate.sqf";
    [] execVM "Misery\Scripts\Survival\HUD\PDA_Compass.sqf";
    };

    if (MiseryGMDisplayprop == "ENABLED") then {
    [] execVM "Misery\Scripts\Survival\HUD\gasmaskcart.sqf";
    };

}, []] call CBA_fnc_waitUntilAndExecute;
