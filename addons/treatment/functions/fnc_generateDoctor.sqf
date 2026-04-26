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

private _traderAction = [
    QGVAR(accessDoctor),
    localize ECSTRING(common,ReqTreatment),
    QPATHTOEF(markers,data\pillbottle_ca.paa),
    {
        params ["_target", "_player"];
        _player setVariable [QGVAR(currentDoctor), _target];
        createDialog QCLASS(medicalTreatment_ui);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

[_trader, 0, [QUOTE(ACE_MainActions)], _traderAction] call ACEFUNC(interact_menu,addActionToObject);
