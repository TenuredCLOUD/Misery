/* -----------------------------------
Misery Check if player is near fire
Designed specifically for Misery mod 
Source code Drongo, expanded upon by TenuredCLOUD
*/

private _nearFire=FALSE;

{if(inflamed _x)exitWith{_nearFire=TRUE}}forEach(nearestObjects[player,MiseryFires,2.5]);

_nearFire //return val (BOOL)