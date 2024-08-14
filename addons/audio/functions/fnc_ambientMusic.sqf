#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Queues music to be played upon finish
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_audio_ambientMusic
*/

addMusicEventHandler ["MusicStop", {
    params ["_musicClassname", "_eventID"];

    // Refill music tracks if empty.
    if (GVAR(musicTracks) isEqualTo []) then {
        GVAR(musicTracks) = +GVAR(musicTracksMain);
    };

    // Delay by 10s, queue up next track.
    [{
        call FUNC(playRandomMusic);
    }, [], 10] call CBA_fnc_waitAndExecute;

}];
