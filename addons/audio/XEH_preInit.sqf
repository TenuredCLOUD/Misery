#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// TODO.
/*
if (hasInterface) then {
    // Get all Music Tracks
    GVAR(musicTracks) = ('getNumber (_x >> QGVAR(isMusic) > 0' configClasses (configFile >> "CfgMusic")) apply {configName _x};

    if (GVAR(enhancedInventorySounds)) then {
        // Inventory Sounds
        player addEventHandler ["InventoryClosed", {
            // add common function for playing sounds to replace below (use alt variant of sound)
            //playSound3D ["\z\misery\addons\audio\sounds\inventory\inv_closenew.ogg", player, false, getPosASL player, 4, 1, 10];
        }];

        player addEventHandler ["InventoryOpened", {
            // add common function for playing sounds to replace below (use alt variant of sound)
            // playSound3D ["\z\misery\addons\audio\sounds\inventory\inv_opennew.ogg", player, false, getPosASL player, 4, 1, 10];
        }];

        player addEventHandler ["Take", {
            // add common function for playing sounds to replace below (use alt variant of sound)
            //playSound3D ["\z\misery\addons\audio\sounds\inventory\pickup.ogg", player, false, getPosASL player, 3, 1, 10];
        }];

        player addEventHandler ["Put", {
            // add common function for playing sounds to replace below (use alt variant of sound)
            //playSound3D ["\z\misery\addons\audio\sounds\inventory\drop5.ogg", player, false, getPosASL player, 3, 1, 10];
        }];
    };
};

if (isServer) then {
    if (GVAR(ambientSoundScape)) then {
        [] call FUNC(ambientSoundScape);
    };

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
