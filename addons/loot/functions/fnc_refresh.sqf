#include "..\script_component.hpp"
/*
Misery Loot Framework refresh timer loop
Designed specifically for Misery mod
by TenuredCLOUD
*/

[{true},
{
    [{
        params ["_args", "_handle"];

    MiseryAllBuildings = [];

    if(MiseryDebug)then{systemChat "[Misery Loot Framework] Resetting all spawn locations..."};

    }, MiseryLootrefreshtimer, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
