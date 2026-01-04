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

[{[[QCLASS(eru_On)]] call EFUNC(common,hasItem)}, {
    [{
        params ["_args", "_handle"];

        if (!([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) || !alive player) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            QGVAR(display) cutText ["", "PLAIN"];
            [] call FUNC(readings);
        };

        QGVAR(display) cutRsc [QGVAR(ui), "PLAIN", 1, false];

        private _display = uiNamespace getVariable QGVAR(ui);
        private _textControlTimeDate = _display displayCtrl 1000;
        private _textControlReadings = _display displayCtrl 1001;
        private _inRadiationArea = player getVariable [QEGVAR(radiation,insideArea), false];
        private _inCognitoArea = player getVariable [QEGVAR(cognito_hazard,insideArea), false];

        private _time = format ["%1", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];
        private _date = format ["%4%5/%2%3/%1",
            date select 0,
            ["", "0"] select (date select 1 < 10),
            date select 1,
            ["", "0"] select (date select 2 < 10),
            date select 2
        ];

        _textControlTimeDate ctrlSetText format ["%1 %2", _time, _date];

        switch (true) do {
            case (!isNil QGVAR(temperatureEnvironment)): {
                _textControlReadings ctrlSetText format ["AIR: %1°C SEA: %2°C", parseNumber (((call EFUNC(temperature,environment)) select 0) toFixed 1), parseNumber (((call EFUNC(temperature,environment)) select 1) toFixed 1)];
            };
            case (!isNil QGVAR(temperatureBody)): {
                call EFUNC(common,getPlayerVariables) params ["", "", "", "_thermalIndex"];
                _textControlReadings ctrlSetText format ["EXPOSURE: %1°C", [_thermalIndex, 1, 1, false] call CBA_fnc_formatNumber];
            };
            case (!isNil QGVAR(compass)): {
                _direction = round (getDir player);
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
                _textControlReadings ctrlSetText format ["COMPASS: %1 %2", _direction, _Bearing];
            };
            default {
                _textControlReadings ctrlSetText "> NO DATA <";
            };
        };

    }, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

