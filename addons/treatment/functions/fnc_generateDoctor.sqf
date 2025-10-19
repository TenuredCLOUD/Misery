#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Treatment / Doctor Generator
 * Initializes trader with treatment hold interaction
 *
 * Arguments:
 * 0: Trader object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_treatment_fnc_generateDoctor;
 *
*/

params ["_trader"];

if (isNull _trader) exitWith {};

_trader setVariable [QGVAR(isTreating), false, true];

// Add hold action
[
    _trader,
    "Request treatment",
    QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
    QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
    QUOTE(_this distance _target < 3 && !(_target getVariable [ARR_2(QUOTE(QGVAR(isTreating)),false)])),
    QUOTE(_caller distance _target < 3 && !(_target getVariable [ARR_2(QUOTE(QGVAR(isTreating)),false)])),
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _caller setVariable [QGVAR(currentDoctor), _target];
        createDialog QCLASS(medicalTreatment_ui);
    },
    {},
    [_trader],
    1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;
