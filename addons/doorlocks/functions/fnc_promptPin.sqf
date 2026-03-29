#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Prompts player with pin pad entry
 *
 * Arguments:
 * 0: Mode <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_promptPin
 *
*/

createDialog QCLASS(doorLock_ui);

private _display = findDisplay 696677;

private _enter = _display displayCtrl 1600;
_enter ctrlAddEventHandler ["ButtonClick", {

    private _pin = ((ctrlText ((findDisplay 696677) displayCtrl 1400))) call BIS_fnc_parseNumber;

    if !(_pin isEqualType 0) exitWith {
        ["PIN must be a number...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
    };

    [_pin] call FUNC(processPin);
    closeDialog 2;
}];


