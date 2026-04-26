#include "\a3\ui_f\hpp\defineDIKCodes.inc"
private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[_category, QGVAR(power), localize LSTRING(ERUActionToggleERU), {
    call FUNC(keybind);
}, {}, [DIK_U, [false, false, false]]] call CBA_fnc_addKeybind;

[_category, QGVAR(compass), localize LSTRING(ERUCompassSetting), {
    if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
        GVAR(temperatureEnvironment) = nil;
        GVAR(temperatureBody) = nil;
        GVAR(compass) = true;
        playSound QEGVAR(audio,sound_chirpBeep);
    };
}, {}, [DIK_NUMPAD0, [false, false, true]]] call CBA_fnc_addKeybind;

[_category, QGVAR(temperature_0), localize LSTRING(ERUTempEnv), {
    if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
        GVAR(temperatureEnvironment) = true;
        GVAR(temperatureBody) = nil;
        GVAR(compass) = nil;
        playSound QEGVAR(audio,sound_chirpBeep);
    };
}, {}, [DIK_NUMPAD1, [false, false, true]]] call CBA_fnc_addKeybind;

[_category, QGVAR(temperature_1), localize LSTRING(ERUTempExp), {
    if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
        GVAR(temperatureEnvironment) = nil;
        GVAR(temperatureBody) = true;
        GVAR(compass) = nil;
        playSound QEGVAR(audio,sound_chirpBeep);
    };
}, {}, [DIK_NUMPAD2, [false, false, true]]] call CBA_fnc_addKeybind;
