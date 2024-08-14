#include "..\script_component.hpp"
/*
Misery Music generation loop
Selects a random music file to play from the "Ambient Music array" data after the previous file is played...
Time between tracks is randomized, up to 2 minutes
Designed specifically for Misery mod
by TenuredCLOUD
*/

addMusicEventHandler ["MusicStop", {
params ["_musicClassname", "_eventHandlerId", "_currentPosition", "_toralLength"];
_time = time + random 60 + random 120;
[_time] spawn {
private ["_TimeA"];
_TimeA=_this select 0;
waitUntil {(time > _TimeA)};
[] call Misery_fnc_playMusic_Random;
};
    }];




