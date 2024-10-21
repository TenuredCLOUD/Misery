#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * ERU ui
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_eru_fnc_main
 *
*/

disableSerialization;

[{"Misery_ERU" in magazines player}, {
    [{
        params ["_args", "_handle"];
        if (!("Misery_ERU" in magazines player) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            ("MiseryERU_UI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
            [] execVM "\z\misery\addons\eru\functions\fnc_ERU_main.sqf";
        };

        "MiseryERU_UI" cutRsc ["MiseryERU_UI", "PLAIN", 1, false];

        private _display = uiNamespace getVariable "MiseryERU_UI";
        private _textControl = _display displayCtrl 1000;
        private _textControlReadings = _display displayCtrl 1001;

        private _time = format ["%1", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];
        private _date = format ["%4%5/%2%3/%1",
            date select 0,
            ["", "0"] select (date select 1 < 10),
            date select 1,
            ["", "0"] select (date select 2 < 10),
            date select 2
        ];

        _textControl ctrlSetText format ["%1 %2", _time, _date];

        switch (true) do {
            case (!isNil "Misery_ERU_Temp"): {
                _textControlReadings ctrlSetText format ["Air: %1°C Sea: %2°C", parseNumber (((call EFUNC(temperature,environment)) select 0) toFixed 1), parseNumber (((call EFUNC(temperature,environment)) select 1) toFixed 1)];
            };
            case (!isNil "Misery_ERU_Radiation"): {
                if (!isNil "MiseryinRadZone" && MiseryinRadZone) then {
                    _textControlReadings ctrlSetText "Radiation Detected!";
                    playSound3D ["\z\misery\addons\audio\sounds\eru\PowerDownBeep.ogg", player, false, getPosASL player, 4, 1, 10];
                } else {
                    _textControlReadings ctrlSetText "No Radiation Detected...";
                };
            };
            case (!isNil "Misery_ERU_PsyEmm"): {
                if (!isNil "MiseryinPsyfield" && MiseryinPsyfield) then {
                    _textControlReadings ctrlSetText "Psy-Emmissions detected!";
                    playSound3D ["\z\misery\addons\audio\sounds\eru\PowerDownBeep.ogg", player, false, getPosASL player, 4, 1, 10];
                } else {
                    _textControlReadings ctrlSetText "No Psy-Emmissions Detected...";
                };
            };
            case (!isNil "Misery_ERU_Compass"): {
                _direction = round (getDir (vehicle player));
                _Bearing = _direction;
                switch true do {
                    case(((_direction >= 355) && (_direction <=359)) || ((_direction >= 0) && (_direction <= 5))) : {_Bearing = "N";};
                    case((_direction > 5) && (_direction < 85)) : {_Bearing = "NE";};
                    case((_direction >= 85) && (_direction <= 95)) : {_Bearing = "E";};
                    case((_direction > 95) && (_direction < 175)) : {_Bearing = "SE";};
                    case((_direction >= 175) && (_direction <= 185)) : {_Bearing = "S";};
                    case((_direction > 185) && (_direction < 265)) : {_Bearing = "SW";};
                    case((_direction >= 265) && (_direction <= 275)) : {_Bearing = "W";};
                    case((_direction > 275) && (_direction < 355)) : {_Bearing = "NW";};
                };
                _textControlReadings ctrlSetText format ["Compass: %1 %2", _direction, _Bearing];
            };
            default {
                _textControlReadings ctrlSetText "No data to retrieve...";
            };
        };

    }, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

