#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Treatment / Doctor Generator
 * Initializes trader with treatment hold interaction
 *
 * Arguments:
 * 0: Doctor object <OBJECT>
 * 1: Wound Treatment Cost <NUMBER>
 * 2: Radiation Treatment Cost <NUMBER>
 * 3: Infection Treatment Cost <NUMBER>
 * 4: Parasites Treatment Cost <NUMBER>
 * 5: Toxicity Treatment Cost <NUMBER>
 * 6: Psychosis Treatment Cost <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_treatment_fnc_generateDoctor;
 *
*/

params [["_doctor", objNull], ["_woundCost", 0], ["_radiationCost", 0], ["_infectionCost", 0], ["_parasiteCost", 0], ["_toxicCost", 0], ["_psychosisCost", 0]];

if (isNull _doctor) exitWith {};

private _doctorAction = [
    QGVAR(requestTreatment),
    localize LSTRING(Request),
    QPATHTOEF(markers,data\pillbottle_ca.paa),
    {},
    {true},
    {},
    [],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _woundTreatment = [
    QGVAR(woundTreatment),
    format ["%1: %2%3", localize LSTRING(TreatWounds), EGVAR(currency,symbol), [_woundCost, 1, 2, true] call CBA_fnc_formatNumber],
    "z\ace\addons\medical_gui\ui\cross.paa",
    {
        params ["_target", "_player", "_params"];
        _params params ["_woundCost"];
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

        if (_funds < _woundCost) exitWith {
            [QEGVAR(common,tileText), localize ECSTRING(common,TooExpensive)] call CBA_fnc_localEvent;
        };

        [-_woundCost] call EFUNC(currency,modifyMoney);

        cutText ["", "BLACK OUT", 2];

        [{
            cutText ["", "BLACK IN", 2];
            [_this] call ACEFUNC(medical_treatment,fullHealLocal);
        }, _player, 5] call CBA_fnc_waitAndExecute;

    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_woundCost"];

        _woundCost isNotEqualTo 0
    },
    {},
    [_woundCost],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _radiationTreatment = [
    QGVAR(radiationTreatment),
    format ["%1: %2%3", localize LSTRING(TreatRadiation), EGVAR(currency,symbol), [_radiationCost, 1, 2, true] call CBA_fnc_formatNumber],
    QPATHTOEF(markers,data\radiation_ca.paa),
    {
        params ["_target", "_player", "_params"];
        _params params ["_radiationCost"];
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "_radiation", "", "", "", "", "", "", "_funds"];

        if (_funds < _radiationCost) exitWith {
            [QEGVAR(common,tileText), localize ECSTRING(common,TooExpensive)] call CBA_fnc_localEvent;
        };

        if (_radiation isEqualTo 0) exitWith {
            [QEGVAR(common,tileText), localize LSTRING(NoTreatmentNeeded)] call CBA_fnc_localEvent;
        };

        [-_radiationCost] call EFUNC(currency,modifyMoney);

        cutText ["", "BLACK OUT", 2];

        [{
            cutText ["", "BLACK IN", 2];
            [-1, "radiation"] call EFUNC(common,addStatusModifier);
        }, [], 5] call CBA_fnc_waitAndExecute;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_radiationCost"];

        _radiationCost isNotEqualTo 0
    },
    {},
    [_radiationCost],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _infectionTreatment = [
    QGVAR(infectionTreatment),
    format ["%1: %2%3", localize LSTRING(TreatInfection), EGVAR(currency,symbol), [_infectionCost, 1, 2, true] call CBA_fnc_formatNumber],
    QPATHTOEF(icons,data\virus_ca.paa),
    {
        params ["_target", "_player", "_params"];
        _params params ["_infectionCost"];
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "_infection", "", "", "", "", "", "_funds"];

        if (_funds < _infectionCost) exitWith {
            [QEGVAR(common,tileText), localize ECSTRING(common,TooExpensive)] call CBA_fnc_localEvent;
        };

        if (_infection isEqualTo 0) exitWith {
            [QEGVAR(common,tileText), localize LSTRING(NoTreatmentNeeded)] call CBA_fnc_localEvent;
        };

        [-_infectionCost] call EFUNC(currency,modifyMoney);

        cutText ["", "BLACK OUT", 2];

        [{
            cutText ["", "BLACK IN", 2];
            [-1, "infection"] call EFUNC(common,addStatusModifier);
        }, [], 5] call CBA_fnc_waitAndExecute;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_infectionCost"];

        _infectionCost isNotEqualTo 0
    },
    {},
    [_infectionCost],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _parasitesTreatment = [
    QGVAR(parasitesTreatment),
    format ["%1: %2%3", localize LSTRING(TreatParasites), EGVAR(currency,symbol), [_parasiteCost, 1, 2, true] call CBA_fnc_formatNumber],
    QPATHTOEF(icons,data\worm_ca.paa),
    {
        params ["_target", "_player", "_params"];
        _params params ["_parasiteCost"];
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "_parasites", "", "", "", "", "_funds"];

        if (_funds < _parasiteCost) exitWith {
            [QEGVAR(common,tileText), localize ECSTRING(common,TooExpensive)] call CBA_fnc_localEvent;
        };

        if (_parasites isEqualTo 0) exitWith {
            [QEGVAR(common,tileText), localize LSTRING(NoTreatmentNeeded)] call CBA_fnc_localEvent;
        };

        [-_parasiteCost] call EFUNC(currency,modifyMoney);

        cutText ["", "BLACK OUT", 2];

        [{
            cutText ["", "BLACK IN", 2];
            [-1, "parasites"] call EFUNC(common,addStatusModifier);
        }, [], 5] call CBA_fnc_waitAndExecute;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_parasiteCost"];

        _parasiteCost isNotEqualTo 0
    },
    {},
    [_parasiteCost],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _toxicityTreatment = [
    QGVAR(toxicityTreatment),
    format ["%1: %2%3", localize LSTRING(TreatToxicity), EGVAR(currency,symbol), [_toxicCost, 1, 2, true] call CBA_fnc_formatNumber],
    QPATHTOEF(markers,data\flask_conical_ca.paa),
    {
        params ["_target", "_player", "_params"];
        _params params ["_toxicCost"];
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "_toxicity", "", "", "", "_funds"];

        if (_funds < _toxicCost) exitWith {
            [QEGVAR(common,tileText), localize ECSTRING(common,TooExpensive)] call CBA_fnc_localEvent;
        };

        if (_toxicity isEqualTo 0) exitWith {
            [QEGVAR(common,tileText), localize LSTRING(NoTreatmentNeeded)] call CBA_fnc_localEvent;
        };

        [-_toxicCost] call EFUNC(currency,modifyMoney);

        cutText ["", "BLACK OUT", 2];

        [{
            cutText ["", "BLACK IN", 2];
            [-1, "toxicity"] call EFUNC(common,addStatusModifier);
        }, [], 5] call CBA_fnc_waitAndExecute;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_toxicCost"];

        _toxicCost isNotEqualTo 0
    },
    {},
    [_toxicCost],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _psychosisTreatment = [
    QGVAR(psychosisTreatment),
    format ["%1: %2%3", localize LSTRING(TreatPsychosis), EGVAR(currency,symbol), [_psychosisCost, 1, 2, true] call CBA_fnc_formatNumber],
    QPATHTOEF(icons,data\brain_ca.paa),
    {
        params ["_target", "_player", "_params"];
        _params params ["_psychosisCost"];
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "_psychosis", "", "", "_funds"];

        if (_funds < _psychosisCost) exitWith {
            [QEGVAR(common,tileText), localize ECSTRING(common,TooExpensive)] call CBA_fnc_localEvent;
        };

        if (_psychosis isEqualTo 0) exitWith {
            [QEGVAR(common,tileText), localize LSTRING(NoTreatmentNeeded)] call CBA_fnc_localEvent;
        };

        [-_psychosisCost] call EFUNC(currency,modifyMoney);

        cutText ["", "BLACK OUT", 2];

        [{
            cutText ["", "BLACK IN", 2];
            [-1, "psychosis"] call EFUNC(common,addStatusModifier);
        }, [], 5] call CBA_fnc_waitAndExecute;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_psychosisCost"];

        _psychosisCost isNotEqualTo 0
    },
    {},
    [_psychosisCost],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);


[_doctor, 0, [QUOTE(ACE_MainActions)], _doctorAction] call ACEFUNC(interact_menu,addActionToObject);

{
    [_doctor, 0, [QUOTE(ACE_MainActions), QGVAR(requestTreatment)], _x] call ACEFUNC(interact_menu,addActionToObject);
} forEach [_woundTreatment, _radiationTreatment, _infectionTreatment, _parasitesTreatment, _toxicityTreatment, _psychosisTreatment];
