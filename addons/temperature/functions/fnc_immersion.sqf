#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Immersion audio for having a fever or cold
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_immersion;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "_exposure", "", "", "_infection", "_parasites"];
call EFUNC(protection,totalProtection) params ["_gasMask", "_scba"];

// Fever
if (_exposure > 0.1 && (_infection > 0 || _parasites > 0)) then {
    if (_gasMask > 0 || _scba > 0) then {
        player say3D [QEGVAR(audio,sound_coughMask01), 10, 1, 2, 0];
    } else {
        player say3D [QEGVAR(audio,sound_coughing), 10, 1, 2, 0];
    };
};

// Cold
if (_exposure < -0.1 && (_infection > 0 || _parasites > 0)) then {
    if (_gasMask > 0 || _scba > 0) then {
        player say3D [QEGVAR(audio,sound_coughMask01), 10, 1, 2, 0];
    } else {
        player say3D [QEGVAR(audio,sound_sneeze), 10, 1, 2, 0];
    };
};

[{
    [] call FUNC(immersion);
}, [], 300] call CBA_fnc_waitAndExecute;
