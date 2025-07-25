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

    // Make sure driver or pilot / co-pilot get display only
    if (driver _vehicle isEqualTo player || currentPilot _vehicle isEqualTo player) then {
        QGVAR(display) cutRsc [QUOTE(CLASS(vehicleStats_ui)), "PLAIN", 1, false];
    } else {
        QGVAR(display) cutText ["", "PLAIN"];
    };

    if (!alive player || isNull objectParent player) exitWith {
        QGVAR(display) cutText ["", "PLAIN"];
        showHUD [true, true, true, true, true, true, true, true, true, true, true];
        _handle call CBA_fnc_removePerFrameHandler;
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

    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    private _fuelLevel = fuel _vehicle;
    private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
    private _batteryType = _vehicle getVariable [QGVAR(batteryType), nil];
    private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 0];
    private _oilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
    private _coolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];

    [_vehicle, _batteryType] call FUNC(countBatteries) params ["_installedBatteries"];
    [_vehicle, _batteryType, _requiredBatteries] call FUNC(getBatteryCharge) params ["_totalCharge", "_maxCharge"];

    _vehicleNameCtrl ctrlSetText format ["%1", _vehicleName];
    _batteryCtrl ctrlSetText format ["(Batteries: %1/%2)", _installedBatteries, _requiredBatteries];
    _fuelBar progressSetPosition _fuelLevel;
    _powerBar progressSetPosition (_totalCharge / _maxCharge);
    _oilBar progressSetPosition _oilLevel;

    // Remove coolant bar for aircraft (most aircraft use air flow for cooling components)
    if (_vehicle isKindOf "plane" || _vehicle isKindOf "helicopter") then {
        {
            _x ctrlShow false;
        } forEach ["_coolantIcon", "_coolantBar"];
    } else {
        _coolantBar progressSetPosition _coolantLevel;
    };

    private _speedType = ["MPH:", "Km/h:"] select GVAR(speedType);
    private _speedValue = [round (abs (speed _vehicle) * 0.6214), round (abs speed _vehicle)] select GVAR(speedType);

    private _speedText = format ["%1 %2", _speedType, [_speedValue, 1, 0, false] call CBA_fnc_formatNumber];

    _vehicleSpeedCtrl ctrlSetText _speedText;

}, 0] call CBA_fnc_addPerFrameHandler;



