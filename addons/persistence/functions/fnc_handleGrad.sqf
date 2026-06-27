#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles GRAD saving / wipes
 * Processes other data handles prior to GRAD
 *
 * Arguments:
 * 0: Type of process <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_handleGrad
*/

params ["_type"];

if (_type isEqualTo 1) then {

    if (GVAR(saveAE3States)) then {
        [QGVAR(grabAE3Devices)] call CBA_fnc_serverEvent;
    };

    if (GVAR(saveACECargo)) then {
        [QGVAR(grabCargo)] call CBA_fnc_serverEvent;
    };

    if (GVAR(saveACEFuelStations)) then {
        [QGVAR(grabFuelStationLitres)] call CBA_fnc_serverEvent;
    };

    [{
        // Slight delay to ensure other persistence frameworks are cached for GRAD write
        [QGVAR(saveWorldState)] call CBA_fnc_serverEvent;
    }, [], 0.02] call CBA_fnc_waitAndExecute;
} else {
    [QGVAR(wipeWorldState)] call CBA_fnc_serverEvent;
};


