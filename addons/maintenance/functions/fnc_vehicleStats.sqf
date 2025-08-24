#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle UI processor
 * Processes dialog when player enters driver seat showing vehicle stats
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_vehicleStats;
 *
 * Public: No
*/

showHUD [true, false, true, true, true, true, true, true, true, true, true];

[{
    params ["_args", "_handle"];

    private _vehicle = vehicle player;

    [_vehicle] call EFUNC(common,getObjectData) params ["_displayName", "_picture"];

    // Make sure driver or pilot / co-pilot get display only
    if (currentPilot _vehicle isEqualTo player) then {
        QGVAR(display) cutRsc [QUOTE(CLASS(vehicleStats_ui)), "PLAIN", 1, false];
    } else {
        QGVAR(display) cutText ["", "PLAIN"];
    };

    if (!alive player || isNull objectParent player) exitWith {
        QGVAR(display) cutText ["", "PLAIN"];
        showHUD [true, true, true, true, true, true, true, true, true, true, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (gunner _vehicle isEqualTo player || commander _vehicle isEqualTo player) then {
        showHUD [true, true, true, true, true, true, true, true, true, true, true];
    } else {
        showHUD [true, false, true, true, true, true, true, true, true, true, true];
    };

    private _display = uiNamespace getVariable [QGVAR(vehicleStats_ui), objNull];

    private _vehicleNameCtrl = _display displayCtrl 1000;
    private _fuelBar = _display displayCtrl 1801;
    private _powerBar = _display displayCtrl 1802;
    private _oilBar = _display displayCtrl 1803;
    private _coolantIcon = _display displayCtrl 1100;
    private _coolantBar = _display displayCtrl 1804;
    private _vehicleSpeedCtrl = _display displayCtrl 1001;
    private _batteryCtrl = _display displayCtrl 1002;

    private _fuelLevel = fuel _vehicle;
    private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
    private _batteryType = _vehicle getVariable [QGVAR(batteryType), nil];
    private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 0];
    private _oilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
    private _coolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];
    private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];

    private _found = false;
    private _fuelLiters = 0;
    private _coolantLiters = 0;
    private _batteryCount = 0;
    private _oilLiters = 0;

    {
        if ((_x select 0) isEqualTo typeOf _vehicle) then {
            _array = _x;
            _found = true;
            _fuelLiters = _x select 2;
            _coolantLiters = _x select 7;
            _batteryCount = _x select 6;
            _oilLiters = _x select 8;
        };
    } forEach EGVAR(common,vehicleData);

    if !(_found) exitWith {};

    [_vehicle, _batteryType, _requiredBatteries] call FUNC(getBatteryCharge) params ["_totalCharge", "_maxCharge"];

    _vehicleNameCtrl ctrlSetText format ["%1", _displayName];
    _batteryCtrl ctrlSetText format ["(Batteries: %1/%2)", _installedBatteries, _requiredBatteries];
    _fuelBar progressSetPosition _fuelLevel;
    _powerBar progressSetPosition (_totalCharge / _maxCharge);
    _oilBar progressSetPosition _oilLevel;
    _coolantBar progressSetPosition _coolantLevel;

    switch (true) do {
        case (_batteryCount isEqualTo 0): {
            {
                _display displayCtrl _x ctrlShow false;
            } forEach [1802, 2001, 1002];
        };
        case (_fuelLiters isEqualTo 0): {
            {
                _display displayCtrl _x ctrlShow false;
            } forEach [1801, 2000];
        };
        case (_oilLiters isEqualTo 0): {
            {
                _display displayCtrl _x ctrlShow false;
            } forEach [1803, 2002];
        };
        case (_coolantLiters isEqualTo 0): {
            {
                _display displayCtrl _x ctrlShow false;
            } forEach [1804, 2003];
        };
    };

    private _speedType = ["MPH:", "Km/h:"] select GVAR(speedType);
    private _speedValue = [round (abs (speed _vehicle) * 0.6214), round (abs speed _vehicle)] select GVAR(speedType);

    private _speedText = format ["%1 %2", _speedType, [_speedValue, 1, 0, false] call CBA_fnc_formatNumber];

    _vehicleSpeedCtrl ctrlSetText _speedText;

}, 0] call CBA_fnc_addPerFrameHandler;



