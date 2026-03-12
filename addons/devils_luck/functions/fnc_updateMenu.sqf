#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Devils luck menu updater
 * Keeps menu updated
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_updateMenu;
 *
*/

disableSerialization;

[{!isNull findDisplay 3384575825},
{
    [{
        params ["_args", "_handle"];
        if ( isNull findDisplay 3384575825 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

    private _betValue = (ctrlText ((findDisplay 3384575825) displayCtrl 1600)) call BIS_fnc_parseNumber;

    ctrlSetText [1102, _betValue];

    }, 0, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
