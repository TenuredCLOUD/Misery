#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
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

if !(isMultiplayer) exitWith {};

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
                        _abortButton ctrlSetText format [localize LSTRING(PleaseWait), _iteration];
                        _args set [0, (_iteration -1)];
                        _args set [1, CBA_missionTime];

                        if (_iteration isEqualTo 0) then {
                            _handle call CBA_fnc_removePerFrameHandler;
                            _abortButton ctrlSetText localize LSTRING(Logout);
                            _abortButton ctrlEnable true;
                            if (GVAR(enabled)) then {
                                call FUNC(saveGame);
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
