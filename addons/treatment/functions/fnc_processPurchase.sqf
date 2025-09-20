#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_treatment_fnc_processPurchase;
 *
 * Public: No
*/

private _dialog = findDisplay 982381;
private _selectedIndex = lbCurSel 1500;

if (_selectedIndex isEqualTo -1) exitWith {ctrlSetText [1001, "No treatment option selected..."];};

[982381, [1600, 1601], false] call EFUNC(common,displayShowControls);

private _treatment = GVAR(data) select _selectedIndex;
private _name = _treatment select 0;
private _price = _treatment select 1;
private _action = _treatment select 2;
private _duration = _treatment select 3;

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

if !([_name] call FUNC(checkStats)) exitWith {
    ctrlSetText [1001, "You don't need any treatment for this..."];
    [982381, [1600, 1601], true] call EFUNC(common,displayShowControls);
};

if (_funds < _price) exitWith {
    ctrlSetText [1001, "You cannot afford this!"];
    [982381, [1600, 1601], true] call EFUNC(common,displayShowControls);
};

player setVariable [QCLASS(processTreatment), true];

private _interruptEH = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processTreatment), false];
        [QEGVAR(common,tileText), "Treatment interrupted..."] call CBA_fnc_localEvent;
    };
}];

private _totalSteps = _duration * 2;
private _currentStep = 0;

[{
    params ["_args", "_handle"];
    _args params ["_dialog", "_name", "_price", "_action", "_totalSteps", "_currentStep", "_interruptEH"];

    if (!(player getVariable [QCLASS(processTreatment), false]) || !alive player) exitWith {
        player setVariable [QCLASS(processTreatment), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _interruptEH];
        [982381, [1600, 1601], true] call EFUNC(common,displayShowControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [5, _currentStep];

    private _progress = (_currentStep / _totalSteps) * 100 toFixed 0;
    ctrlSetText [1001, format ["Receiving treatment... %1%% complete", _progress]];

    if (_currentStep >= _totalSteps) then {
        [-_price] call EFUNC(currency,modifyMoney);

        if (isNil "_action") then {
            if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
                [player] call ace_medical_treatment_fnc_fullHealLocal;
            } else {
                player setDamage 0;
            };
        } else {
            call _action;
        };

        ctrlSetText [1001, format ["%1 complete...", _name]];
        player setVariable [QCLASS(processTreatment), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _interruptEH];
        [982381, [1600, 1601], true] call EFUNC(common,displayShowControls);

        // Refresh list
        [] call EFUNC(treatment,treatListed);

        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [_dialog, _name, _price, _action, _totalSteps, _currentStep, _interruptEH]] call CBA_fnc_addPerFrameHandler;



