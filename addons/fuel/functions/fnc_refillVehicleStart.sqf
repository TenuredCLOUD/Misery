/*
Misery Advanced refueling - by : TenuredCLOUD with great help from Drongo for easy module defines 
Array input for refueling amount per Jerrycan
Designed specifically for Misery mod
 */

(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryRefuel_Vehicle_JCan_GUI";

private _Jerrycanused= _this; // item classname

[_Jerrycanused] execVM '\z\misery\addons\fuel\functions\fnc_Veh_icon.sqf';

