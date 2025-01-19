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

[{
    params ["_args", "_handle"];

    private _hasGeiger = [[QCLASS(geiger_On)]] call EFUNC(common,hasItem);

    if !(_hasGeiger || alive player || isNull findDisplay 982344) exitWith {
        [QUOTE(COMPONENT_BEAUTIFIED), "Geiger loop exiting"] call EFUNC(common,debugMessage);
        QCLASS(geiger_ui) cutText ["", "PLAIN"];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    QCLASS(geiger_ui) cutRsc ["MiseryGeiger_UI", "PLAIN", 1, false];
    private _display = uiNamespace getVariable "MiseryGeiger_UI";
    private _textControl = _display displayCtrl 1000;
    private _radReading = format ["%1 mSv", player getVariable [QEGVAR(survival,radiation),0]];
    _textControl ctrlSetText _radReading;

    // Sound is local to avoid orbital saturation of the network in MP.
    playSound selectRandom [MACRO_GEIGER_SOUNDS];
}, 0.5] call CBA_fnc_addPerFrameHandler;
