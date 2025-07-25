#include "\a3\ui_f\hpp\defineDIKCodes.inc"
private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[_category, QGVAR(power), "Toggle ERU", {
    call FUNC(keybind);
}, {}, [DIK_U, [false, false, false]]] call CBA_fnc_addKeybind;

[_category, QGVAR(temperature), "Temperature Readings", {
    if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
        GVAR(temperature) = true;
        GVAR(compass) = nil;
        playSound QEGVAR(audio,sound_chirpBeep);
    };
}, {}, [DIK_NUMPAD0, [false, false, true]]] call CBA_fnc_addKeybind;

[_category, QGVAR(compass), "Compass Setting", {
    if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
        GVAR(temperature) = nil;
        GVAR(compass) = true;
        playSound QEGVAR(audio,sound_chirpBeep);
    };
}, {}, [DIK_NUMPAD1, [false, false, true]]] call CBA_fnc_addKeybind;
