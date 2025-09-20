#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * treatment UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_treatment_fnc_treatListed;
 *
 * Public: No
*/

[{!isNull findDisplay 982381}, {
    private _list = findDisplay 982381 displayCtrl 1500;

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    ctrlSetText [1002, format ["%3: %1 %2", EGVAR(currency,symbol), [_funds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

    lbClear _list;

    //[name, price, action, duration]
    GVAR(data) = [
        ["Treat Wounds", GVAR(woundCost), nil, GVAR(woundDuration)],
        ["Treat Radiation", GVAR(radiationCost), {player setVariable [QEGVAR(survival,radiation), MACRO_PLAYER_DEFAULTS_LOW]}, GVAR(radiationDuration)],
        ["Treat Infection", GVAR(infectionCost), {player setVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW]}, GVAR(infectionDuration)],
        ["Treat Parasites", GVAR(parasiteCost), {player setVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW]}, GVAR(parasiteDuration)],
        ["Treat Toxicity", GVAR(toxicCost), {player setVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_DEFAULTS_LOW]}, GVAR(toxicDuration)],
        ["Treat Psychosis", GVAR(psychosisCost), {player setVariable [QEGVAR(psychosis,state), MACRO_PLAYER_DEFAULTS_LOW]}, GVAR(psychosisDuration)]
    ];

    publicVariable QGVAR(data);

    {
        private _name = _x select 0;
        private _price = _x select 1;
        private _index = _list lbAdd format ["%1: %2 %3", _name, EGVAR(currency,symbol), [_price, 1, 2, true] call CBA_fnc_formatNumber];
        _list lbSetData [_index, str(_price)];
    } forEach GVAR(data);
}, []] call CBA_fnc_waitUntilAndExecute;


