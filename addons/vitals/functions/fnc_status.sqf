#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Status UI for inventory framework
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_vitals_fnc_status;
 *
 */

disableSerialization;
[{
    params ["_args", "_handle"];

    if (isNull findDisplay 982377) exitWith {};

    private _vitalsDisplay = findDisplay 982377;
    private _temperatureText = _vitalsDisplay displayCtrl 1015;
    private _temperatureValue = _vitalsDisplay displayCtrl 1010;
    private _gasMaskText =_vitalsDisplay displayCtrl 1016;
    private _gasMaskValue =_vitalsDisplay displayCtrl 1017;
    private _currencyValue = _vitalsDisplay displayCtrl 1009;
    private _healthText = _vitalsDisplay displayCtrl 1008;
    private _healthNumber = _vitalsDisplay displayCtrl 1011;
    private _hungerNumber = _vitalsDisplay displayCtrl 1012;
    private _thirstNumber = _vitalsDisplay displayCtrl 1013;
    private _fatigueNumber = _vitalsDisplay displayCtrl 1014;
    private _buffsList = _vitalsDisplay displayCtrl 1501;
    private _ailmentsList = _vitalsDisplay displayCtrl 1502;
    private _currentMagazine = _vitalsDisplay displayCtrl 1111;
    private _currentMagazineValue = _vitalsDisplay displayCtrl 1112;
    private _playerFatigue = (getFatigue player) * 100;
    private _convertPlayerFatigue = round _playerFatigue;

    call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit", "_playerTemperature", "_exposure", "_radiation", "_infection", "_parasites", "_toxicity", "", "_buffs", "_ailments", "_funds", "", "", "", "", "_cartridges"];
    call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "_skinProtection", "_respiratoryProtection", "_eyeProtection", "_hearingProtection"];

    lbClear _buffsList;
    lbClear _ailmentsList;

    {
        _x params ["_buffName", "_buffImage"];
        private _buffsIndex = _buffsList lbAdd _buffName;
        _buffsList lbSetData [_buffsIndex, _buffName];
        _buffsList lbSetPicture [_buffsIndex, _buffImage];
    } forEach _buffs;

    {
        _x params ["_ailmentName", "_ailmentImage"];
        private _ailmentsIndex = _ailmentsList lbAdd _ailmentName;
        _ailmentsList lbSetData [_ailmentsIndex, _ailmentName];
        _ailmentsList lbSetPicture [_ailmentsIndex, _ailmentImage];
    } forEach _ailments;

    if (EGVAR(common,ace)) then {
        _health = player getVariable ["ace_medical_bloodVolume", 6]; //ACE blood calc
        _healthText ctrlSetText "Blood:";
    } else {
        _health = round ((1 - (damage player)) * 100); //Vanilla Health calc
        _healthText ctrlSetText "Health:";
    };

    if (!EGVAR(gasmask,enhanced)) then {
        _gasMaskText ctrlShow false;
        _gasMaskValue ctrlShow false;
    };

    if (EGVAR(gasmask,enhanced)) then {
        private _gasMaskBuff = _buffs findIf {(_x select 0) isEqualTo "Gas Mask"} > -1;
        private _scbaBuff = _buffs findIf {(_x select 0) isEqualTo "Supplied Air"} > -1;

        private _gearCase = switch (true) do {
            case (_gasMask > 0 && (_scba isEqualTo 0)): {"GasMask"};
            case (_gasMask > 0 && (_scba > 0)): {"SuppliedAir"};
            default {"None"};
        };

        switch (_gearCase) do {
            case "GasMask": {
                if (_respiratoryProtection > 0) then {
                    private _gasMaskCartridgeValue = format["%1%2", round(_cartridges * 100), "%"];
                    _gasMaskValue ctrlSetText _gasMaskCartridgeValue;
                } else {
                    _gasMaskValue ctrlSetText "No Cartridge";
                };
                ["buff", "Gas Mask", QPATHTOEF(icons,data\gasmask_ca.paa), "You are wearing a gasmask, it can protect your lungs from harmful contaminants like radioactive particles, as well as toxic gases. You should be mindful of your cartridges..."] call FUNC(addBuffOrAilment);
                if (_scbaBuff) then {
                    ["buff", "Supplied Air"] call FUNC(removeBuffOrAilment);
                };
            };
            case "SuppliedAir": {
                private _suppliedAir = format["%1", "∞"];
                _gasMaskValue ctrlSetText _suppliedAir;
                ["buff", "Supplied Air", QPATHTOEF(icons,data\scba_ca.paa), "You are utilizing an SCBA device which is useful in an IDLH (Immediately Dangerous to Life or health) area. You have the greatest protection gear available for air contaminants."] call FUNC(addBuffOrAilment);
                if (_gasMaskBuff) then {
                    ["buff", "Gas Mask"] call FUNC(removeBuffOrAilment);
                };
            };
            case "None": {
                if (_gasMaskBuff) then {
                    ["buff", "Gas Mask"] call FUNC(removeBuffOrAilment);
                };
                if (_scbaBuff) then {
                    ["buff", "Supplied Air"] call FUNC(removeBuffOrAilment);
                };
                _gasMaskValue ctrlSetText "None";
            };
        };
    };

    private _currentMagazineDetail = currentMagazineDetail player;
    private _magazine = currentMagazine player;
    private _magazineConfig = configFile >> "CfgMagazines" >> _magazine;

    if (isClass _magazineConfig) then {
        private _picPath = getText (_magazineConfig >> "picture");
        if (_picPath isNotEqualTo "") then {
            _CurrMag ctrlSetText _picPath;
        } else {
            _currentMagazine ctrlShow false;
        };
    };

    if (("(" in _currentMagazineDetail) && ("/" in _currentMagazineDetail)) then {
        private _ammoDetailsString = ((_currentMagazineDetail splitString "(") select 1) splitString "/" select 0;
        private _totalAmmoString = ((_currentMagazineDetail splitString "/") select 1) splitString ")" select 0;
        private _ammoCount = parseNumber _ammoDetailsString;
        private _totalAmmo = parseNumber _totalAmmoString;
        _currentMagazineValue ctrlSetText format ["(%1/%2)", _ammoCount, _totalAmmo];
    } else {
        _currentMagazineValue ctrlShow false;
    };

    if (!EGVAR(temperature,enabled)) then {
        _temperatureText ctrlShow false;
        _temperatureValue ctrlShow false;
    };
    if (EGVAR(temperature,enabled) && QCLASS(eru_On) in magazines player) then {
        _temperature = format["%1°C",round (_playerTemperature)];
        _temperatureValue ctrlSetText _temperature;
    };
    if (EGVAR(temperature,enabled) && !(QCLASS(eru_On) in magazines player)) then {
        _temperatureValue ctrlSetText "No ERU";
    };

    private _fundsDisplay = format ["%1 %2",EGVAR(currency,symbol),[_funds, 1, 2, true] call CBA_fnc_formatNumber];

    _currencyValue ctrlSetText _fundsDisplay;

    private _cognitoProtected = _ailments findIf {(_x select 0) isEqualTo "Cognitohazard (Protected)"};
    private _cognitoNoProtection = _ailments findIf {(_x select 0) isEqualTo "Cognitohazard"};

    if ((_hearingProtection < 1) && (player getVariable [QEGVAR(cognitohazard,insideArea), false])) then {
        ["ailment","Cognitohazard", QPATHTOEF(icons,data\psyfield_ca.paa), "You hear a very loud pulsing hum, its vibrations are pounding in your head, you're not sure how much longer you can take it..."] call FUNC(addBuffOrAilment);
    };

    if ((_hearingProtection > 1) && (player getVariable [QEGVAR(cognitohazard,insideArea), false])) then {
        ["ailment","Cognitohazard (Protected)", QPATHTOEF(icons,data\psyfield_ca.paa), "You feel subtle vibrations around your skull, you are uneasy..."] call FUNC(addBuffOrAilment);
    };

    if !(player getVariable [QEGVAR(cognitohazard,insideArea), false]) then {
        if (_cognitoNoProtection isNotEqualTo -1) then {
            ["ailment","Cognitohazard"] call FUNC(removeBuffOrAilment);
        };
        if (_cognitoProtected isNotEqualTo -1) then {
            ["ailment","Cognitohazard (Protected)"] call FUNC(removeBuffOrAilment);
        };
    };

    private _tiredAilments = ["Tired", "Mildy Tired", "Very Tired", "Exhausted", "Inhumanely Exhausted"];

    if (_sleepiness >= 15) then {
        {
            private _ailmentName = _x select 0;
            if (_ailmentName in _tiredAilments) then {
                private _index = _ailments findIf {(_x select 0) isEqualTo _ailmentName};
                if (_index > -1) then {
                    ["ailment", str _index] call FUNC(removeBuffOrAilment);
                };
            };
        } forEach _ailments;

        private _tirednessIndex = floor ((_sleepiness - 15) / 5);
        if (_tirednessIndex >= count _tiredAilments) then {
            _tirednessIndex = count _tiredAilments - 1;
        };
        private _tirednessAilment = _tiredAilments select _tirednessIndex;
        private _imageNames = ["sleepy", "sleepy1", "sleepy2", "sleepy3", "tired"];
        ["ailment", _tirednessAilment, format ["data\%1.paa", (_imageNames select _tirednessIndex)], format ["You are %1...", _tirednessAilment]] call FUNC(addBuffOrAilment);
    } else {
        {
            private _ailmentName = _x select 0;
            if (_ailmentName in _tiredAilments) then {
                private _index = _ailments findIf {(_x select 0) isEqualTo _ailmentName};
                if (_index > -1) then {
                    ["ailment", str _index] call FUNC(removeBuffOrAilment);
                };
            };
        } forEach _ailments;
    };

    if (EGVAR(survival,ailments)) then {
        private _parasiteAilment = _ailments findIf {(_x select 0) isEqualTo "Parasite Infection"};
        private _poisonAilment = _ailments findIf {(_x select 0) isEqualTo "Poisoned"};
        private _infectionAilment = _ailments findIf {(_x select 0) isEqualTo "Bacterial Infection"};

        if (_parasites > 0) then {
            if (_parasiteAilment isEqualTo -1) then {
                ["ailment","Parasite Infection", QPATHTOEF(icons,data\parasites_ca.paa), "You are infected with Parasites, You feel a gnawing hunger that is unsatiable, as well as unquenchable thirst..."] call FUNC(addBuffOrAilment);
            };
        } else {
            if (_parasiteAilment isNotEqualTo -1) then {
                ["ailment","Parasite Infection"] call FUNC(removeBuffOrAilment);
            };
        };

        if (_poison > 0) then {
            if (_poisonAilment isEqualTo -1) then {
                ["ailment","Poisoned", QPATHTOEF(icons,data\poison_ca.paa), "You are poisoned, you feel a wave of unease wash over you as death lingers..."] call FUNC(addBuffOrAilment);
            };
        } else {
            if (_poisonAilment isNotEqualTo -1) then {
                ["ailment","Poisoned"] call FUNC(removeBuffOrAilment);
            };
        };

        if (_infection > 0) then {
            if (_infectionAilment isEqualTo -1) then {
                ["ailment","Bacterial Infection", QPATHTOEF(icons,data\infection_ca.paa), "You have a Bacterial infection, your breaths are shallow, and feel hot. You can feel your muscles weakening..."] call FUNC(addBuffOrAilment);
            };
        } else {
            if (_infectionAilment isNotEqualTo -1) then {
                ["ailment","Bacterial Infection"] call FUNC(removeBuffOrAilment);
            };
        };
    };

    if (EGVAR(temperature,enabled)) then {
        private _coldExposureAilments = ["Chilly", "Cold", "Freezing", "Hypothermia risk", "Hypothermic"];

        if (_exposure <= -1) then {
            private _coldExposureIndex = -1;
            switch (true) do {
                case (_exposure <= -1): {
                    _coldExposureIndex = 0;
                };
                case (_exposure <= -5): {
                    _coldExposureIndex = 1;
                };
                case (_exposure <= -10): {
                    _coldExposureIndex = 2;
                };
                case (_exposure <= -15): {
                    _coldExposureIndex = 3;
                };
                case (_exposure <= -20): {
                    _coldExposureIndex = 4;
                };
            };

            private _coldExposureAilment = _coldExposureAilments select _coldExposureIndex;
            private _coldExposureIconNames = ["chilly", "cold", "freezing", "hypo", "hypo2"];
            private _coldExposureDescriptionLevels = ["You feel chilly...", "You are cold...", "You are freezing...", "You are at risk of hypothermia...", "You are hypothermic..."];
            ["ailment", _coldExposureAilment, format ["data\%1.paa", (_coldExposureIconNames select _coldExposureIndex)], format ["%1", (_coldExposureDescriptionLevels select _coldExposureIndex)]] call FUNC(addBuffOrAilment);
        };

        private _heatExposureAilments = ["Warm", "Hot", "Fever", "Hyperthermia risk", "Hyperthermic"];

        if (_exposure >= 1) then {

            private _heatExposureIndex = -1;
            switch (true) do {
                case (_exposure >= 1): {
                    _heatExposureIndex = 0;
                };
                case (_exposure >= 5): {
                    _heatExposureIndex = 1;
                };
                case (_exposure >= 10): {
                    _heatExposureIndex = 2;
                };
                case (_exposure >= 15): {
                    _heatExposureIndex = 3;
                };
                case (_exposure >= 20): {
                    _heatExposureIndex = 4;
                };
            };

            private _heatExposureAilment = _heatExposureAilments select _heatExposureIndex;
            private _heatExposureIconNames = ["hot", "hot2", "fever", "hyper", "hyper2"];
            private _heatExposureDescriptionLevels = ["You feel a bit warm...", "You feel hot...", "You have a fever...", "You are at risk of hyperthermia...", "You are hyperthermic..."];
            ["ailment", _heatExposureAilment, format ["data\%1.paa", (_heatExposureIconNames select _heatExposureIndex)], format ["%1", (_heatExposureDescriptionLevels select _heatExposureIndex)]] call FUNC(addBuffOrAilment);
        };

        if (_exposure isEqualTo 0) then {
            {
                private _ailmentName = _x select 0;
                if (_ailmentName in (_coldExposureAilments + _heatExposureAilments)) then {
                    private _index = _ailments findIf {(_x select 0) isEqualTo _ailmentName};
                    if (_index > -1) then {
                        ["ailment", str _index] call FUNC(removeBuffOrAilment);
                    };
                };
            } forEach _ailments;
        };
    };

    if (EGVAR(inventory,hudLayout) isEqualTo 0) then {
        if (EGVAR(common,ace)) then {
            private _bloodToValue = round(_Health / 6 * 100);
            private _valueToBarBlood = [_bloodToValue] call EFUNC(common,valToBar);
            _healthNumber ctrlSetText _valueToBarBlood;
        } else {
            private _healthToValue = round((1 - (damage player)) * 100);
            private _valueToBarHealth = [_healthToValue] call EFUNC(common,valToBar);
            _healthNumber ctrlSetText _valueToBarHealth;
        };

        private _valueToBarHunger = [round(_hunger * 100)] call EFUNC(common,valToBar);
        _hungerNumber ctrlSetText _valueToBarHunger;

        private _valueToBarThirst = [round(_thirst * 100)] call EFUNC(common,valToBar);
        _thirstNumber ctrlSetText _valueToBarThirst;

        private _valueToBarFatigue = [_convertPlayerFatigue] call EFUNC(common,valToBar);
        _fatigueNumber ctrlSetText _valueToBarFatigue;
    } else {
        if (EGVAR(inventory,hudLayout) isEqualTo 1) then {
            if (EGVAR(common,ace)) then {
                private _healthNumberValueAce = format ["%1", round(_Health / 6 * 100)];
                _healthNumber ctrlSetText _healthNumberValueAce;
            } else {
                private _healthNumberValueVanilla = format ["%1", round((1 - (damage player)) * 100)];
                _healthNumber ctrlSetText _healthNumberValueVanilla;
            };

            private _hungerNumberValue = format ["%1", round(_hunger * 100)];
            _hungerNumber ctrlSetText _hungerNumberValue;

            private _thirstNumberValue = format ["%1", round(_thirst * 100)];
            _thirstNumber ctrlSetText _thirstNumberValue;

            private _fatigueNumberValue = format ["%1", _convertPlayerFatigue];
            _fatigueNumber ctrlSetText _fatigueNumberValue;
        };
    };

    if (EGVAR(temperature,enable)) then {
        _nearFireBuff = _buffs findIf {(_x select 0) isEqualTo "Near Fire"};
        _shelterBuff = _buffs findIf {(_x select 0) isEqualTo "Sheltered"};
        if ([player] call EFUNC(common,nearFire)) then {
            ["buff","Near Fire", QPATHTOEF(icons,data\nearfire_ca.paa), "When near a fire, you will be warmed from the cold, you can also utilize the fire for cooking, or boiling water to kill off micro-organisms..."] call FUNC(addBuffOrAilment);
        } else {
            if (_nearFireBuff isNotEqualTo -1) then {
                ["buff","Near Fire"] call FUNC(removeBuffOrAilment);
            };
        };

        if (insideBuilding player isEqualTo 1) then {
            ["buff","Sheltered", QPATHTOEF(icons,data\shelter_ca.paa), "You are sheltered from the weather, while inside you cannot build a fire due to smoke inhalation..."] call FUNC(addBuffOrAilment);
        } else {
            if (_shelterBuff isNotEqualTo -1) then {
                ["buff","Sheltered"] call FUNC(removeBuffOrAilment);
            };
        };
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
