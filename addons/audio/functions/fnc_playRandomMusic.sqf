#include "..\script_component.hpp"
/*
    Misery Random music selection
    Selects a random music file to play from the "Ambient Music array" data
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

private _randomMusic = selectRandom GVAR(ambientMusicExtras);
playMusic _randomMusic;
