#include "script_component.hpp"

[QGVAR(say3D), {(_this select 0) say3D [(_this select 1), (_this select 2)]}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    if (GVAR(ambientSoundScape)) then {
        [] call FUNC(ambientSoundScape);
    };

    if (GVAR(ambientMusicEnabled)) then {

        // Get all Music Tracks
        GVAR(musicTracksMain) = ('getNumber (_x >> QGVAR(isMusic)) > 0' configClasses (configFile >> "CfgMusic")) apply {configName _x};
        GVAR(musicTracks) = [];

        call FUNC(ambientMusic);
    };

    if (GVAR(enhancedInventorySounds)) then {
        // Inventory Sounds
        player addEventHandler ["InventoryClosed", {
            if (backpack player isNotEqualTo "") then {
                playSound QCLASS(audio_sound_inventoryClose);
            };
        }];

        player addEventHandler ["InventoryOpened", {
            if (backpack player isNotEqualTo "") then {
                playSound QCLASS(audio_sound_inventoryOpen);
            };
        }];

        player addEventHandler ["Take", {
            playSound QCLASS(audio_sound_pickup);
        }];

        player addEventHandler ["Put", {
            playSound QCLASS(audio_sound_drop02);
        }];
    };
};

