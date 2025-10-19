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
    private _temperatureText = _vitalsDisplay displayCtrl 1015;
    private _temperatureValue = _vitalsDisplay displayCtrl 1010;
    private _gasMaskText = _vitalsDisplay displayCtrl 1016;
    private _gasMaskBar = _vitalsDisplay displayCtrl 1017;
    private _currencyValue = _vitalsDisplay displayCtrl 1009;
    private _healthText = _vitalsDisplay displayCtrl 1008;
    private _healthBar = _vitalsDisplay displayCtrl 1011;
    private _hungerBar = _vitalsDisplay displayCtrl 1012;
    private _thirstBar = _vitalsDisplay displayCtrl 1013;
    private _fatigueBar = _vitalsDisplay displayCtrl 1014;
    private _wetnessText = _vitalsDisplay displayCtrl 1007;
    private _wetnessBar = _vitalsDisplay displayCtrl 1018;
    private _buffsList = _vitalsDisplay displayCtrl 1501;
    private _ailmentsList = _vitalsDisplay displayCtrl 1502;

    call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit", "_thermalIndex", "_exposure", "_wetness", "_radiation", "_infection", "_parasites", "_toxicity", "_psychosis", "_buffs", "_ailments", "_funds", "", "_cartridgeEfficiency"];
    call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "_skinProtection", "_respiratoryProtection", "_eyeProtection", "_hearingProtection"];

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
    } forEach (player getVariable ["buffs", []]);

    {
        _x params ["_ailmentName", "_ailmentImage"];
        private _index = _ailmentsList lbAdd _ailmentName;
        _ailmentsList lbSetData [_index, _ailmentName];
        _ailmentsList lbSetPicture [_index, _ailmentImage];
    } forEach (player getVariable ["ailments", []]);

    if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
        private _health = player getVariable ["ace_medical_bloodVolume", 6];
        _healthText ctrlSetText "Blood:";
        _healthBar progressSetPosition (_health / 6);
    } else {
        private _health = 1 - (damage player);
        _healthText ctrlSetText "Health:";
        _healthBar progressSetPosition _health;
    };

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

    if (!EGVAR(temperature,enabled)) then {
        [982377, [1015, 1010], false] call EFUNC(common,displayShowControls);
    } else {
        _temperatureValue ctrlSetText (if (QCLASS(eru_On) in magazines player) then {format ["%1°C", [_thermalIndex, 1, 1, false] call CBA_fnc_formatNumber]} else {"No ERU"});
    };

    _currencyValue ctrlSetText (format ["%1 %2", EGVAR(currency,symbol), [_funds, 1, 2, true] call CBA_fnc_formatNumber]);

    _hungerBar progressSetPosition _hunger;
    _thirstBar progressSetPosition _thirst;
    private _fatigueValue = [getFatigue player, player getVariable ["ace_advanced_fatigue_aimFatigue", 0]] select (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled});
    _fatigueBar progressSetPosition _fatigueValue;

    if (_wetness <= 0) then {
        [982377, [1007, 1018], false] call EFUNC(common,displayShowControls);
    } else {
        [982377, [1007, 1018], true] call EFUNC(common,displayShowControls);
        _wetnessBar progressSetPosition _wetness;
    };

}, 0.1, []] call CBA_fnc_addPerFrameHandler;
