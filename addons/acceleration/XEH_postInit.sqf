#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Grab mission start accTime value and store it
GVAR(timeValue) = accTime;

if (GVAR(enabled)) then {
    addUserActionEventHandler ["timeInc", "Activate", {
            params ["_activated"];

            if (_activated) then {
            [{
                // Restore original accTime value when player tries to accelerate simulation
                setAccTime GVAR(timeValue);
            }, [], 0.02] call CBA_fnc_waitAndExecute;
        };
    }];
};
