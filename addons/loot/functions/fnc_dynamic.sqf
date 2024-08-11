/* 
* Misery Loot generation startup
* Designed specifically for Misery mod 
* Code concepts from Drongo edited by TenuredCLOUD (with permission) 
*/

#include "\z\misery\addons\main\script_macros.hpp"

private["_players","_buildings","_allBuildings","_add"];
if!(isServer)exitWith{};
_players=call EFUNC(common,ListPlayers);
_players=_players-(entities "HeadlessClient_F");
_buildings=[];
_allBuildings=[];
_add=TRUE;
if (MiseryDebug) then {systemChat "[Misery Loot Framework] Checking for Buildings..."};
{
_buildings=_x nearObjects["House", MiseryLootspawnDist];
	{
	_add=TRUE;
	if(TRUE)then{
		if(_x in MiseryAllBuildings)exitWith{_add=FALSE};
		if((Damage _x)>.7)exitWith{_add=FALSE};
		if((count([_x]call BIS_fnc_buildingPositions))==0)exitWith{_add=FALSE};
	};
	if(_add)then{_allBuildings pushBackUnique _x};
	}forEach _buildings;
}forEach _players;
{_x call FUNC(AddBuilding)}forEach _allBuildings;
sleep MiseryLoottimer;

[] execVM "\z\misery\addons\loot\functions\fnc_Dynamic.sqf"; 


