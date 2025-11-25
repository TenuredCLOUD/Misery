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

    // Only create mask break events, if enabled in ACE
    if (!isNil "ace_goggles_effects" && ace_goggles_effects >= 2) then {
        ["ace_glassesCracked", {
            params ["_unit"];
            if (_unit isEqualTo player) then {
                [QEGVAR(common,tileText), format ["%1 is broken, removing equipment...", [goggles player] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                [{
                    player unlinkItem goggles player;
                }, [], 2] call CBA_fnc_waitAndExecute;
            };
        }] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;

// For gasmask cartridge efficiency.
GVAR(modifiers) = 0;
