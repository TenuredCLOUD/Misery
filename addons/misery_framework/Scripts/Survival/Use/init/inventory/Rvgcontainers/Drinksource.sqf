/* -----------------------------------
Misery Ravage use container near watersource
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if (call Misery_fnc_NearWell) exitwith {
execVM 'Misery\Scripts\Survival\Use\init\survival\WaterCollection\actions\DrinkfromWS.sqf';
};

if !(call Misery_fnc_NearWell) exitwith {
titleText ["No water source nearby...", "PLAIN DOWN"];
};
