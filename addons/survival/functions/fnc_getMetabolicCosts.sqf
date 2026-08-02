#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD (Adapted from BaerMitUmlaut & ulteq's ACE Advanced Fatigue)
 * Wrapper function for BaerMitUmlaut and ulteq's metabolic costs for ACE Advanced fatigue API
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Current metabolic costs <NUMBER>
 *
 * Example:
 * [] call misery_survival_fnc_getMetabolicCost;
 */

if (!alive ACE_player) exitWith { 0.1883 };

private _velocity = velocity ACE_player;
private _normal = surfaceNormal (getPosWorld ACE_player);
private _movementVector = vectorNormalized _velocity;
private _fwdAngle = asin (_movementVector select 2);

private _sideAngle = if ((getPosATL ACE_player) select 2 > 0.01) then {
    0 // Ignore terrain normal if airborne or not touching ground
} else {
    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    asin (_sideVector select 2);
};

private _isSwimming = ACEGVAR(advanced_fatigue,isSwimming);
if (_isSwimming) then {
    _fwdAngle = 0;
    _sideAngle = 0;
};

private _currentWork = 18.83;
private _currentSpeed = (vectorMagnitude _velocity) min 6;

private _isProne = (stance ACE_player) isEqualTo "PRONE";
if (_isProne) then {
    _currentSpeed = _currentSpeed min 1.5;
};

private _terrainGradient = abs _fwdAngle;
private _terrainFactor = 1;

private _gearMass = 0 max (((ACE_player getVariable [QACEGVAR(movement,totalLoad), loadAbs ACE_player]) / 22.046 - 3.5) * ACEGVAR(advanced_fatigue,loadFactor));

if (isNull objectParent ACE_player && {_currentSpeed > 0.1} && {isTouchingGround ACE_player || {underwater ACE_player}}) then {
    if (!_isSwimming) then {
        // Downhill relief factor
        if (_fwdAngle < 0) then {
            _terrainGradient = 0.15 * _terrainGradient;
        };

        // Side-slope uneven terrain penalty
        if (_sideAngle != 0) then {
            private _sideGradient = abs (_sideAngle / 45) min 1;
            _terrainFactor = 1 + _sideGradient ^ 4;
        };
    };

    _currentWork = [_gearMass, _terrainGradient * ACEGVAR(advanced_fatigue,terrainGradientFactor) * 0.1, _terrainFactor, _currentSpeed] call ACEFUNC(advanced_fatigue,getMetabolicCosts);
    _currentWork = _currentWork max 18.83;
};

_currentWork / 100
