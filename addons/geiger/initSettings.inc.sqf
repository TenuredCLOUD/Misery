            #include "\a3\ui_f\hpp\defineDIKCodes.inc"

            ["Misery", "Geiger Power", "Turn on/off Geiger", {
            private _formattedText;
            if ("Misery_personalgeigerOFF" in magazines player) then {
                _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_TURNONGEIGERBOOTUP"], "PLAIN DOWN", -1, true, true];
                [_formattedText] call Misery_fnc_FormatToTile;
                playSound3D ["\z\misery\addons\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 5, 1, 10];
                player removeMagazine 'Misery_personalgeigerOFF';
                player addMagazine 'Misery_personalgeiger';
                } else {
                if ("Misery_personalgeiger" in magazines player) then {
                    _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_TURNONGEIGERTURNOFF"], "PLAIN DOWN", -1, true, true];
                    [_formattedText] call Misery_fnc_FormatToTile;
                    playSound3D ["\z\misery\addons\audio\sounds\Geigerenable\GeigerOFF.ogg", player, false, getPosASL player, 5, 1, 10];
                    player removeMagazine 'Misery_personalgeiger';
                    player addMagazine 'Misery_personalgeigerOFF';
                } else {
                    _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_TURNONGEIGERNOITEM"], "PLAIN DOWN", -1, true, true];
                    [_formattedText] call Misery_fnc_FormatToTile;
                };
            };
            }, {}, [DIK_K, [false, false, false]]] call CBA_fnc_addKeybind;
