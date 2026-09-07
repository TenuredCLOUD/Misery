#include "script_component.hpp"

[QCLASSACE(medicalMenuOpened), {
    params ["_unit", "_patient", "_menuType"];

    // Zombification force close of ACE medical ui
    if (ACE_player getVariable ["WBK_AI_ISZombie", false]) exitWith {
        [{!isNull findDisplay 38580}, {
            (findDisplay 38580) closeDisplay 2;
        }, []] call CBA_fnc_waitUntilAndExecute;
    };

    if (_patient isEqualTo ACE_player) then {
        private _display = findDisplay 46 createDisplay QCLASS(vitals_framework_ui);
        ACE_player setVariable [QGVAR(medicalDisplay), _display];

        [{isNull findDisplay 38580}, {
            params ["_display"];
            if (!isNull _display) then {
                _display closeDisplay 1;
            };

            ACE_player setVariable [QGVAR(medicalDisplay), nil];
        }, [_display]] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_addEventHandler;

[QCLASSACE(treatmentStarted), {
    params ["_caller", "_target", "_selectionName", "_className", "_itemUser", "_usedItem", "_createLitter"];

    private _display = ACE_player getVariable [QGVAR(medicalDisplay), displayNull];

    if (!isNull _display) then {
        _display closeDisplay 1;
        ACE_player setVariable [QGVAR(medicalDisplay), nil];
    };
}] call CBA_fnc_addEventHandler;

