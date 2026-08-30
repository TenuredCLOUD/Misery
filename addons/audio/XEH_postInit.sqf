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
        ACE_player addEventHandler ["InventoryClosed", {
            ["inventory", false] call ACEFUNC(common,blurScreen);
            if (backpack ACE_player isNotEqualTo "") then {
                [ACE_player, objNull] call ACEFUNC(backpacks,backpackOpened);
            } else {
                playSound selectRandom [
                    QACEGVAR(wardrobe,fabric_06),
                    QACEGVAR(wardrobe,fabric_07),
                    QACEGVAR(wardrobe,fabric_16),
                    QACEGVAR(wardrobe,fabric_20),
                    QACEGVAR(wardrobe,fabric_25)
                ];
            };
        }];

        ACE_player addEventHandler ["InventoryOpened", {
            ["inventory", true] call ACEFUNC(common,blurScreen);
            if (backpack ACE_player isNotEqualTo "") then {
                [ACE_player, objNull] call ACEFUNC(backpacks,backpackOpened);
            } else {
                playSound selectRandom [
                    QACEGVAR(wardrobe,fabric_06),
                    QACEGVAR(wardrobe,fabric_07),
                    QACEGVAR(wardrobe,fabric_16),
                    QACEGVAR(wardrobe,fabric_20),
                    QACEGVAR(wardrobe,fabric_25)
                ];
            };
        }];
    };
};

