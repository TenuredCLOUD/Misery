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

// Initialize music tracks if empty
if (GVAR(musicTracks) isEqualTo []) then {
    GVAR(musicTracks) = GVAR(musicTracks) + GVAR(musicTracksMain);
    publicVariable QGVAR(musicTracks);
    if (GVAR(ambientMusicExtras) isEqualType [] && count GVAR(ambientMusicExtras) > 0) then {
        GVAR(musicTracks) append GVAR(ambientMusicExtras);
        publicVariable QGVAR(musicTracks);
    };
};

// Play the first random track, prep for Music stop EH
call FUNC(playRandomMusic);

addMusicEventHandler ["MusicStop", {
    params ["_musicClassname", "_eventID"];

    // Refill music tracks if empty.
    if (GVAR(musicTracks) isEqualTo []) then {
        GVAR(musicTracks) = GVAR(musicTracks) + GVAR(musicTracksMain);
        publicVariable QGVAR(musicTracks);
        // Add custom tracks if optional array isn't empty
        if (GVAR(ambientMusicExtras) isEqualType [] && count GVAR(ambientMusicExtras) > 0) then {
            GVAR(musicTracks) append GVAR(ambientMusicExtras);
            publicVariable QGVAR(musicTracks);
        };
    };

    // Delay by 10s, queue up next track.
    [{
        call FUNC(playRandomMusic);
    }, [], 10] call CBA_fnc_waitAndExecute;
}];
