#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    if (GVAR(enhanced)) then {
        call FUNC(deficiency);
        call FUNC(rebreatherAudio);
    };

    if (GVAR(overlays)) then {
        // Only allow if ACE overlays aren't enabled
        if (!isNil "ace_goggles_drawOverlay" && !ace_goggles_drawOverlay) then {
            call FUNC(overlays);
        };
    };

    if (GVAR(rebreatherHoses)) then {
        call FUNC(rebreatherHose);
    };
}] call CBA_fnc_addEventHandler;

// For gasmask cartridge efficiency.
GVAR(modifiers) = 0;
