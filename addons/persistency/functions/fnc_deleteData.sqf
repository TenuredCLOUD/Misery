#include "..\script_component.hpp"
/*
Misery Character deletion
Designed specifically for Misery mod
by TenuredCLOUD
*/

private ["_saveName"];

_saveName = MiserysurvivalSaveName;

profileNamespace setVariable [_saveName, nil];

// Save the profileNamespace to ensure the data is deleted
saveProfileNamespace;
