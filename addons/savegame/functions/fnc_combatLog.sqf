#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Prevents combat logging, forcibly saves after countdown ends.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_savegame_fnc_combatLog
*/

diag_log "[MISERY] - Combat log prevention active";

(findDisplay 46) displayAddEventHandler ["KeyDown", {
    [{
        if (!isNull findDisplay 49) then {
            /*
            private _abortButton = (findDisplay 49) displayCtrl 104;
            _abortButton ctrlEnable false;
            */
            [{
                ["_args", "_handle"];
                _args params [["_iteration", 5], ["_time", 0]];

                if (!isNull findDisplay 49) then {
                    if (CBA_missionTime - _time >= 1) then {
                        private _abortButton = (findDisplay 49) displayCtrl 104;
                        _abortButton ctrlEnable false;
                        _abortButton ctrlSetText format ["Please Wait %1 Seconds", _iteration];
                        _args set [0, (_iteration -1)];
                        _args set [1, CBA_missionTime];

                        if (_iteration == 0) then {
                            _handle call CBA_fnc_removePerFrameHandler;
                            _abortButton ctrlSetText "Logout";
                            _abortButton ctrlEnable true;
                            [QGVAR(executeSaveGame)] call CBA_fnc_localEvent;
                        };
                    };
                } else {
                    _handle call CBA_fnc_removePerFrameHandler;
                };
            }] call CBA_fnc_addPerFrameHandler;
        };
    }, [], 0.05] call CBA_fnc_waitAndExecute;
}];