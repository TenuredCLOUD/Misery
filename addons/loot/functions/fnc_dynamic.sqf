#include "..\script_component.hpp"
/*
* Misery Loot generation startup
* Designed specifically for Misery mod
* Code concepts from Drongo edited by TenuredCLOUD (with permission)
*/

private["_players","_buildings","_allBuildings","_add"];
if!(isServer)exitWith{};
_players=call EFUNC(common,ListPlayers);
_players=_players-(entities "HeadlessClient_F");
_buildings=[];
_allBuildings=[];
_add=true;
if (MiseryDebug) then {systemChat "[Misery Loot Framework] Checking for Buildings..."};
{
_buildings=_x nearObjects["House", MiseryLootspawnDist];
    {
    _add=true;
    if(true)then{
        if(_x in MiseryAllBuildings)exitWith{_add=false};
        if((Damage _x)>.7)exitWith{_add=false};
        if((count([_x]call BIS_fnc_buildingPositions))==0)exitWith{_add=false};
    };
    if(_add)then{_allBuildings pushBackUnique _x};
    }forEach _buildings;
}forEach _players;
{_x call FUNC(AddBuilding)}forEach _allBuildings;
sleep MiseryLoottimer;

[] execVM "\z\misery\addons\loot\functions\fnc_Dynamic.sqf";


