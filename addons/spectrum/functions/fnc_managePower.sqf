#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Power manager for spectrum device
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_managePower
 *
*/

[{[player] call FUNC(hasDetector)}, {
    [{
        params ["_args", "_handle"];

        if !([player] call FUNC(hasDetector)) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(managePower)
        };

        private _power = player getVariable [QGVAR(detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];

        player setVariable [QGVAR(detectorPower), _power - 0.01];

        if (_power <= 0) then {
            // grab active detector items - usually just antenna or flashlight (if they exist):
            [player] call EFUNC(common,handgunAttachments) params ["_muzzle", "_light"];
            // remove in-use spectrum device
            private _detector = currentWeapon player;
            player removeWeapon _detector;
            // add dummy spectrum device
            player addWeapon "hgun_esd_01_dummy_F";
            // add old detectors attachments back to players inventory or drop to ground
            if (_muzzle isNotEqualTo "") then {
                [player, _muzzle, true] call CBA_fnc_addItem;
            };
            if (_light isNotEqualTo "") then {
                [player, _light, true] call CBA_fnc_addItem;
            };
            // reset power value
            player setVariable [QGVAR(detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];
        };
    }, 60, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
