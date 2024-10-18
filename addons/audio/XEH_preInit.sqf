#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

if (hasInterface) then {
    // Get all Music Tracks
    GVAR(musicTracksMain) = ('getNumber (_x >> QGVAR(isMusic)) > 0' configClasses (configFile >> "CfgMusic")) apply {configName _x};
    GVAR(musicTracks) = [];

    // Forge Master List
    GVAR(forgeAudioList) = [];

    if (GVAR(enhancedInventorySounds)) then {
        // Inventory Sounds
        player addEventHandler ["InventoryClosed", {
            playSound3D [QPATHTOF(sounds\inventory\inventoryCloseAlt.ogg), player, false, getPosASL player, 4, 1, 10];
        }];

        player addEventHandler ["InventoryOpened", {
            playSound3D [QPATHTOF(sounds\inventory\inventoryCloseAlt.ogg), player, false, getPosASL player, 4, 1, 10];
        }];

        player addEventHandler ["Take", {
            playSound3D [QPATHTOF(sounds\inventory\pickup.ogg), player, false, getPosASL player, 3, 1, 10];
        }];

        player addEventHandler ["Put", {
            playSound3D [QPATHTOF(sounds\inventory\drop02.ogg), player, false, getPosASL player, 3, 1, 10];
        }];
    };
};

// TODO.
/*
if (isServer) then {
    if (count GVAR(ambientMusicExtras) > 0) then {
        [] call FUNC(playRandomMusic);
        [] call FUNC(ambientMusic);
    };

    if (GVAR(forgeAmbience)) then {
        call FUNC(forgeAudio);
    };
};
*/

ADDON = true;
