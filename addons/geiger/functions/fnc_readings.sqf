#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD, MikeMF
 * Geiger counter UI and sound effects.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_readings
 *
*/

[{[[QCLASS(geiger_On)]] call EFUNC(common,hasItem)}, {

    QGVAR(display) cutRsc [QCLASS(geiger_ui), "PLAIN", 1, false];

    [{
        params ["_args", "_handle"];

        private _hasGeiger = [[QCLASS(geiger_On)]] call EFUNC(common,hasItem);
        private _inRadiationArea = player getVariable [QEGVAR(radiation,insideArea), false];
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "_radiation"];

        if (!_hasGeiger || !alive player) exitWith {
            [QUOTE(COMPONENT_BEAUTIFIED), "Geiger loop exiting"] call EFUNC(common,debugMessage);
            QGVAR(display) cutText ["", "PLAIN"];
            _handle call CBA_fnc_removePerFrameHandler;
        };

        private _display = uiNamespace getVariable [QGVAR(ui), objNull];
        private _textControl = _display displayCtrl 1000;
        private _radReading = format ["%1 mSv", _radiation * 10000];
        _textControl ctrlSetText _radReading;

        // Sound is local to avoid orbital saturation of the network in MP.
        if (_inRadiationArea || (EGVAR(radiation,enhancedArtifacts) && call EFUNC(radiation,hasArtifact))) then {
            playSound selectRandom [MACRO_GEIGER_SOUNDS];
        };
    }, 0.5] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
