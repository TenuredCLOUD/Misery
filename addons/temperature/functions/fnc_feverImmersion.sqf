#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * fever immersion
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_feverImmersion;
 *
 * Public: No
*/

[{((player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW]) > 0.1)},
{

    [{
        params ["_args", "_handle"];

        if ((player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW]) < 0.1 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if (EGVAR(common,debug)) then {systemChat "Misery Fever immersion cycle terminated..."};
            [] call FUNC(feverimmersion);
            if (EGVAR(common,debug)) then {systemChat "Misery Fever immersion cycle checks re-initiated..."};
        };

    private _infection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];
    private _parasites = player getVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];

    if (((player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW]) > 0.1) || (_infection > 0 || _parasites > 0) && (call EFUNC(protection,totalProtection) select 0) < 1 && (call EFUNC(protection,totalProtection) select 1) < 1) then {
        player say3D [QEGVAR(audio,sound_coughing),10,1,2,0];

    } else {

    if (((player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW]) > 0.1) || (_infection > 0 || _parasites > 0) && (call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) then {
        player say3D [QEGVAR(audio,sound_coughMask01),10,1,2,0];
        };
    };

if (EGVAR(common,debug)) then {systemChat "Misery Fever immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
