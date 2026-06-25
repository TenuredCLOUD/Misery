#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes Forge objects audio loops
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forge_fnc_initAudio;
 *
 * Public: No
*/

[QCLASS(forge), "Init", {
    params ["_forge"];
    [{
        params ["_forge"];

        private _soundSource = createSoundSource [QEGVAR(audio,sfx_v_furnace), getPosATL _forge, [], 0];
        _forge setVariable [QGVAR(forgeSoundSource), _soundSource];

        // Delete Sound Source if Forge disappears
        _forge addEventHandler ["Deleted", {
            params ["_forge"];
            private _soundSource = _forge getVariable [QGVAR(forgeSoundSource), objNull];
            deleteVehicle _soundSource;
        }];
    }, [_forge], 1] call CBA_fnc_waitAndExecute;
}, true, [], true] call CBA_fnc_addClassEventHandler;

