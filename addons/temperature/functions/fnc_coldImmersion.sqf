#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * cold immersion
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_coldImmersion;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "_exposure"];
call EFUNC(protection,totalProtection) params ["_gasMask", "_scba"];

if ((_exposure < -0.1) && _gasMask < 1 && _scba < 1) then {
    player say3D [QEGVAR(audio,sound_sneeze), 10, 1, 2, 0];
    } else {
    if ((_exposure < -0.1) && _gasMask > 0 || _scba > 0) then {
        player say3D [QEGVAR(audio,sound_coughMask1), 10, 1, 2, 0];
    };
};

[{
    [] call FUNC(coldImmersion);
}, [], 300] call CBA_fnc_waitAndExecute;
