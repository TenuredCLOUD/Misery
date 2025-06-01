#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forge fuel watcher
 * Updates fuel progress bar in forge ui
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forge_fnc_showFuel;
 *
 * Public: No
*/

disableSerialization;

[{!isNull findDisplay 982388},
{
    [{
        params ["_args", "_handle"];
        if (isNull findDisplay 982388 || (!alive player)) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        [player] call FUNC(stats) params ["", "_forgeFuel"];

        private _dialog = findDisplay 982388;
        private _fuelProgressBar = _dialog displayCtrl 1011;

        _fuelProgressBar progressSetPosition _forgeFuel;

    }, 1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
