#include "script_component.hpp"

["ace_medicalMenuOpened", {
    params ["_unit", "_patient", "_menuType"];

    if (_patient isEqualTo player) then {
        private _display = findDisplay 46 createDisplay QCLASS(vitals_framework_ui);
        player setVariable [QGVAR(medicalDisplay), _display];

        [{isNull findDisplay 38580}, {
            params ["_display"];
            if (!isNull _display) then {
                _display closeDisplay 1;
            };

            player setVariable [QGVAR(medicalDisplay), nil];
        }, [_display]] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_addEventHandler;

["ace_treatmentStarted", {
    params ["_caller", "_target", "_selectionName", "_className", "_itemUser", "_usedItem", "_createLitter"];

    private _display = player getVariable [QGVAR(medicalDisplay), displayNull];

    if (!isNull _display) then {
        _display closeDisplay 1;
        player setVariable [QGVAR(medicalDisplay), nil];
    };
}] call CBA_fnc_addEventHandler;

