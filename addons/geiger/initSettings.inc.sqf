#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["Misery", QGVAR(power), "Turn on/off Geiger", {
    private _formattedText;
    if ("Misery_personalgeigerOFF" in magazines player) then {
        private _geigerTurnOn = format ["<t font='PuristaMedium'>%1</t>",localize "STR_MISERY_TURNONGEIGERBOOTUP"];
        [parseText _geigerTurnOn, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
        playSound3D [QPATHTOEF(audio,sounds\Geigerenable\GeigerON.ogg), player, false, getPosASL player, 5, 1, 10];
        player removeMagazine 'Misery_personalgeigerOFF';
        player addMagazine 'Misery_personalgeiger';
    } else {
        if ("Misery_personalgeiger" in magazines player) then {
            private _geigerTurnOff = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERTURNOFF"];
            [parseText _geigerTurnOff, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
            playSound3D [QPATHTOEF(audio,sounds\Geigerenable\GeigerOFF.ogg), player, false, getPosASL player, 5, 1, 10];
            player removeMagazine 'Misery_personalgeiger';
            player addMagazine 'Misery_personalgeigerOFF';
        } else {
            private _geigerNoItem = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERNOITEM"];
            [parseText _geigerNoItem, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
        };
    };
}, {}, [DIK_K, [false, false, false]]] call CBA_fnc_addKeybind;
