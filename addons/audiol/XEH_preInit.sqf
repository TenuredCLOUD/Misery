#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

//Character Immersion:
if (MiseryChrenhan && hasInterface) then{
//Misery Hunger:
[] execVM "\z\misery\addons\survival\functions\hungerimmersion.sqf";
//Cold:
[] execVM "\z\misery\addons\temperature\functions\coldimmersion.sqf";
//Hot:
[] execVM "\z\misery\addons\temperature\functions\feverimmersion.sqf";
};

//Inventory sound overhaul:
if (MiseryEnhinv && hasInterface) then {
//Always true if selected
player addEventHandler ["InventoryClosed", {
        playSound3D ["\z\misery\addons\audio\sounds\inventory\inv_closenew.ogg", player, false, getPosASL player, 4, 1, 10];
}];
player addEventHandler ["InventoryOpened", {
        playSound3D ["\z\misery\addons\audio\sounds\inventory\inv_opennew.ogg", player, false, getPosASL player, 4, 1, 10];
}];

player addEventHandler ["Take", {
        playSound3D ["\z\misery\addons\audio\sounds\inventory\pickup.ogg", player, false, getPosASL player, 3, 1, 10];
}];

player addEventHandler ["Put", {
        playSound3D ["\z\misery\addons\audio\sounds\inventory\drop5.ogg", player, false, getPosASL player, 3, 1, 10];
}];
};


//Audio
if (MiseryEnhamb && isServer) then {
[] execVM "\z\misery\addons\audiol\functions\Amb_Soundscape.sqf";
};

if (count Misery_AmbientMusic_Listed_audio > 0 && isServer) then {
[] call Misery_fnc_playMusic_Random; //First Track play
[] execVM "\z\misery\addons\audiol\functions\Amb_Music.sqf"; //Begin loop
};

//Forge Audio loops:
if (MiseryEnhForge && isServer) then {
[] execVM "\z\misery\addons\audiol\functions\forgeaudio.sqf";
};

ADDON = true;
