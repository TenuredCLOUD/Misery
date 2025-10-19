#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Prevents combat logging, forcibly saves after countdown ends, will only run in Multiplayer.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_combatLogPrevention
*/

if !(GVAR(combatLogPreventionEnabled) || isMultiplayer) exitWith {};

(findDisplay 46) displayAddEventHandler ["KeyDown", {
    [{
        if (!isNull findDisplay 49) then {
            [{
                params ["_args", "_handle"];
                _args params [["_iteration", 5], ["_time", 0]];

                if (!isNull findDisplay 49) then {
                    if (CBA_missionTime - _time >= 1) then {
                        private _abortButton = (findDisplay 49) displayCtrl 104;
                        _abortButton ctrlEnable false;
                        _abortButton ctrlSetText format ["Please Wait %1 Seconds", _iteration];
                        _args set [0, (_iteration -1)];
                        _args set [1, CBA_missionTime];

                        if (_iteration isEqualTo 0) then {
                            _handle call CBA_fnc_removePerFrameHandler;
                            _abortButton ctrlSetText "Logout";
                            _abortButton ctrlEnable true;
                            if (!isNil QEGVAR(persistence,enabled) && EGVAR(persistence,enabled)) then {
                                [QEGVAR(persistence,saveDataToServer), EFUNC(persistence,multiplayerDataSave)] call CBA_fnc_addEventHandler;
                            };
                        };
                    };
                } else {
                    _handle call CBA_fnc_removePerFrameHandler;
                };
            }] call CBA_fnc_addPerFrameHandler;
        };
    }, [], 0.05] call CBA_fnc_waitAndExecute;
}];
