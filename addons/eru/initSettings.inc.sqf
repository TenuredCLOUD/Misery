#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["Misery", QGVAR(power), "Turn on/off ERU", {
    private _formattedText;
    if ("Misery_ERU_off" in magazines player) then {
        _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERBOOTUP"];
        [_formattedText] call EFUNC(common,formatToTile);
        playSound3D ["\z\misery\addons\audio\sounds\eru\PowerUpBeep.ogg", player, false, getPosASL player, 4, 1, 10];
        player removeMagazine 'Misery_ERU_off';
        player addMagazine 'Misery_ERU';
        } else {
        if ("Misery_ERU" in magazines player) then {
            _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERTURNOFF"];
            [_formattedText] call EFUNC(common,formatToTile);
            playSound3D ["\z\misery\addons\audio\sounds\eru\PowerDownBeep.ogg", player, false, getPosASL player, 4, 1, 10];
            player removeMagazine 'Misery_ERU';
            player addMagazine 'Misery_ERU_off';
        } else {
            _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERNOITEM"];
            [_formattedText] call EFUNC(common,formatToTile);
        };
    };
}, {}, [DIK_U, [false, false, false]]] call CBA_fnc_addKeybind;

["Misery", QGVAR(temperature), "ERU Temperature Readings", {
    if ("Misery_ERU" in magazines player) then {
    Misery_ERU_Temp = true;
    Misery_ERU_Radiation = nil;
    Misery_ERU_PsyEmm = nil;
    Misery_ERU_Compass = nil;
    playSound3D ["\z\misery\addons\audio\sounds\eru\ChirpBeep.ogg", player, false, getPosASL player, 4, 1, 10];
    };
}, {}, [DIK_NUMPAD0, [false, false, true]]] call CBA_fnc_addKeybind;

["Misery", QGVAR(radiation), "ERU Radiation Readings", {
    if ("Misery_ERU" in magazines player) then {
    Misery_ERU_Temp = nil;
    Misery_ERU_Radiation = true;
    Misery_ERU_PsyEmm = nil;
    Misery_ERU_Compass = nil;
    playSound3D ["\z\misery\addons\audio\sounds\eru\ChirpBeep.ogg", player, false, getPosASL player, 4, 1, 10];
    };
}, {}, [DIK_NUMPAD1, [false, false, true]]] call CBA_fnc_addKeybind;

["Misery", QGVAR(psyEmissions), "ERU PsyEmission Readings", {
    if ("Misery_ERU" in magazines player) then {
    Misery_ERU_Temp = nil;
    Misery_ERU_Radiation = nil;
    Misery_ERU_PsyEmm = true;
    Misery_ERU_Compass = nil;
    playSound3D ["\z\misery\addons\audio\sounds\eru\ChirpBeep.ogg", player, false, getPosASL player, 4, 1, 10];
    };
}, {}, [DIK_NUMPAD2, [false, false, true]]] call CBA_fnc_addKeybind;

["Misery", QGVAR(compass), "ERU Compass Readings", {
    if ("Misery_ERU" in magazines player) then {
    Misery_ERU_Temp = nil;
    Misery_ERU_Radiation = nil;
    Misery_ERU_PsyEmm = nil;
    Misery_ERU_Compass = true;
    playSound3D ["\z\misery\addons\audio\sounds\eru\ChirpBeep.ogg", player, false, getPosASL player, 4, 1, 10];
    };
}, {}, [DIK_NUMPAD3, [false, false, true]]] call CBA_fnc_addKeybind;
