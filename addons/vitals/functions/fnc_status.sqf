#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Status UI for Inventory Framework
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_vitals_fnc_status;
 */

disableSerialization;
[{
    params ["_args", "_handle"];

    if (isNull findDisplay 982377) exitWith {};

    private _vitalsDisplay = findDisplay 982377;
    private _gasMaskText = _vitalsDisplay displayCtrl 1016;
    private _gasMaskBar = _vitalsDisplay displayCtrl 1017;
    private _healthText = _vitalsDisplay displayCtrl 1008;
    private _healthBar = _vitalsDisplay displayCtrl 1011;
    private _hungerBar = _vitalsDisplay displayCtrl 1012;
    private _thirstBar = _vitalsDisplay displayCtrl 1013;
    private _fatigueBar = _vitalsDisplay displayCtrl 1014;
    private _wetnessText = _vitalsDisplay displayCtrl 1007;
    private _wetnessBar = _vitalsDisplay displayCtrl 1018;
    private _buffsList = _vitalsDisplay displayCtrl 1501;
    private _ailmentsList = _vitalsDisplay displayCtrl 1502;
    private _tempBar = _vitalsDisplay displayCtrl 2000;
    private _tempIndicator = _vitalsDisplay displayCtrl 2001;

    call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit", "", "_exposure", "_wetness", "_radiation", "_infection", "_parasites", "_toxicity", "_psychosis", "_buffs", "_ailments", "_funds"];
    [ACE_player] call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "_skinProtection", "_respiratoryProtection", "_eyeProtection", "_hearingProtection"];

    lbClear _buffsList;
    lbClear _ailmentsList;

    private _buffConfigs = "true" configClasses (missionConfigFile >> "CfgMisery_BuffsAilments" >> "Buffs");
    {
        private _name = getText (_x >> "name");
        private _image = getText (_x >> "image");
        private _description = getText (_x >> "description");
        private _showCondition = getText (_x >> "showCondition");
        private _removeCondition = getText (_x >> "removeCondition");

        if (call compile _showCondition) then {
            ["buff", _name, _image, _description] call FUNC(addBuffOrAilment);
        };
        if (call compile _removeCondition) then {
            ["buff", _name] call FUNC(removeBuffOrAilment);
        };
    } forEach _buffConfigs;

    private _ailmentConfigs = "true" configClasses (missionConfigFile >> "CfgMisery_BuffsAilments" >> "Ailments");
    {
        private _name = getText (_x >> "name");
        private _image = getText (_x >> "image");
        private _description = getText (_x >> "description");
        private _showCondition = getText (_x >> "showCondition");
        private _removeCondition = getText (_x >> "removeCondition");

        if (call compile _showCondition) then {
            ["ailment", _name, _image, _description] call FUNC(addBuffOrAilment);
        };
        if (call compile _removeCondition) then {
            ["ailment", _name] call FUNC(removeBuffOrAilment);
        };
    } forEach _ailmentConfigs;

    {
        _x params ["_buffName", "_buffImage"];
        private _index = _buffsList lbAdd _buffName;
        _buffsList lbSetData [_index, _buffName];
        _buffsList lbSetPicture [_index, _buffImage];
    } forEach (ACE_player getVariable ["buffs", []]);

    {
        _x params ["_ailmentName", "_ailmentImage"];
        private _index = _ailmentsList lbAdd _ailmentName;
        _ailmentsList lbSetData [_index, _ailmentName];
        _ailmentsList lbSetPicture [_index, _ailmentImage];
    } forEach (ACE_player getVariable ["ailments", []]);

    if (!EGVAR(gasmask,enhanced)) then {
        [982377, [1016, 1017], false] call EFUNC(common,displayShowControls);
    } else {
        private _gearCase = switch (true) do {
            case (_gasMask > 0 && _scba isEqualTo 0): {"GasMask"};
            case (_gasMask > 0 || _gasMask < 1 && _scba > 0): {"SuppliedAir"};
            default {"None"};
        };
        switch (_gearCase) do {
            case "GasMask": {
                    [982377, [1016, 1017], true] call EFUNC(common,displayShowControls);
                    private _cartridgeEfficiency = call EFUNC(gasmask,checkCartridges);
                    private _cartridgeTipValue  = [_cartridgeEfficiency] call FUNC(valueToPercent);
                    _gasMaskBar ctrlSetTooltip format [localize LSTRING(MaskEfficiency), _cartridgeTipValue];
                    _gasMaskBar progressSetPosition _cartridgeEfficiency;
                };
            case "SuppliedAir": {
                    [982377, [1016, 1017], false] call EFUNC(common,displayShowControls);
                };
            default {
                    [982377, [1016, 1017], false] call EFUNC(common,displayShowControls);
                };
        };
    };

    if !(EGVAR(temperature,enabled) && ACEGVAR(weather,enabled)) then {
        [982377, [2000, 2001], false] call EFUNC(common,displayShowControls);
    } else {
        [_tempIndicator, _exposure] call FUNC(updateThermometer);
    };

    private _hungerValue = [_hunger, (100 - (ACE_player getVariable [QACEXGVAR(field_rations,hunger), 0])) / 100] select (!isNil QACEXGVAR(field_rations,enabled) && {ACEXGVAR(field_rations,enabled)});
    private _thirstValue = [_thirst, (100 - (ACE_player getVariable [QACEXGVAR(field_rations,thirst), 0])) / 100] select (!isNil QACEXGVAR(field_rations,enabled) && {ACEXGVAR(field_rations,enabled)});

    private _kcalValue  = [_hungerValue] call FUNC(hungerToKcal);
    private _waterValue = [_thirstValue] call FUNC(thirstToLitres);

    _hungerBar ctrlSetTooltip format [localize LSTRING(Satiety), _kcalValue];
    _thirstBar ctrlSetTooltip format [localize LSTRING(Hydration), _waterValue];

    _hungerBar progressSetPosition _hungerValue;
    _thirstBar progressSetPosition _thirstValue;

    private _fatigueValue = [getFatigue ACE_player, ACE_player getVariable [QACEGVAR(advanced_fatigue,aimFatigue), 0]] select (!isNil QACEGVAR(advanced_fatigue,enabled) && {ACEGVAR(advanced_fatigue,enabled)});

    private _fatigueTipValue  = [_fatigueValue] call FUNC(valueToPercent);

    _fatigueBar ctrlSetTooltip format [localize LSTRING(Exhaustion), _fatigueTipValue];

    _fatigueBar progressSetPosition _fatigueValue;

    if (_wetness <= 0) then {
        [982377, [1007, 1018], false] call EFUNC(common,displayShowControls);
    } else {
        [982377, [1007, 1018], true] call EFUNC(common,displayShowControls);
        private _wetnessTipValue  = [_wetness] call FUNC(valueToPercent);
        _wetnessBar ctrlSetTooltip format [localize LSTRING(WaterSaturation), _wetnessTipValue];
        _wetnessBar progressSetPosition _wetness;
    };

}, 0.1, []] call CBA_fnc_addPerFrameHandler;
