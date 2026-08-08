#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Updates Thermometer
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Exposure <NUMBER>
 *
 * Return Value:
 * None
 */

params ["_ctrl", "_exposure"];

if (isNull _ctrl) exitWith {};

private _topY = 9.5 * GUI_GRID_H + GUI_GRID_Y;
private _totalHeight = 4.5 * GUI_GRID_H;
private _halfHeight = _totalHeight / 2;
private _centerY = _topY + _halfHeight;

private _targetY = _centerY - (_exposure * _halfHeight);

private _indicatorH = 0.1 * GUI_GRID_H;
private _indicatorY = _targetY - (_indicatorH / 2);

private _indicatorColor = if (_exposure > 0) then {
    [1, 1 - _exposure, 1 - _exposure, 1]
} else {
    [1 - abs(_exposure), 1 - (abs(_exposure) * 0.5), 1, 1]
};

_ctrl ctrlSetPosition [
    25 * GUI_GRID_W + GUI_GRID_X,
    _indicatorY,
    0.5 * GUI_GRID_W,
    _indicatorH
];

_ctrl ctrlSetBackgroundColor _indicatorColor;
_ctrl ctrlCommit 0;

private _perceivedTemp = switch (true) do {
    case (_exposure > 0.8):  { localize LSTRING(HyperthermiaRisk) };
    case (_exposure > 0.6):  { localize LSTRING(Overheating) };
    case (_exposure > 0.4):  { localize LSTRING(Hot) };
    case (_exposure > 0.2):  { localize LSTRING(Warm) };
    case (_exposure < -0.8): { localize LSTRING(HypothermiaRisk) };
    case (_exposure < -0.6): { localize LSTRING(Freezing) };
    case (_exposure < -0.4): { localize LSTRING(Cold) };
    case (_exposure < -0.2): { localize LSTRING(Chilled) };
    default { localize LSTRING(Temperate) };
};

_ctrl ctrlSetTooltip _perceivedTemp;
