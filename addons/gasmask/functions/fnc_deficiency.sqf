#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * gasmask cartridge degradation
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_deficiency
 *
*/

[{
    params ["_args", "_handle"];

    if (isGamePaused) exitWith {};

    call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "", "_respiratory"];
    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "_cartridgeEfficiency"];

    if (_scba >= 1) exitWith {};
    if (_gasmask < 1 && _respiratory < 1) exitWith {};

    private _baseDegradation = 0.001389;
    private _zoneMultiplier = 2;
    private _fatigueMultiplier = 0.008334;
    private _maxDegradation = 0.011112;

    private _decrementValue = _baseDegradation;

    // Check if in hazardous zones
    private _inHazardZone = ((EGVAR(chemical,areas) findIf {player inArea _x} isNotEqualTo -1) || (EGVAR(radiation,areas) findIf {player inArea _x} isNotEqualTo -1));

    if (_inHazardZone) then {
        _decrementValue = _decrementValue * _zoneMultiplier;
    };

    if (isNull objectParent player) then {
        private _fatigue = [getFatigue player, player getVariable ["ace_advanced_fatigue_aimFatigue", 0]] select (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled});
        private _fatiguePenalty = _fatigue * _fatigueMultiplier;
        _decrementValue = _decrementValue + _fatiguePenalty;
    };

    if (_decrementValue > _maxDegradation) then {
        _decrementValue = _maxDegradation;
    };

    [-_decrementValue, "cartridge"] call EFUNC(common,addStatusModifier);
    private _cartridgeEfficiencyTotal = ((_cartridgeEfficiency + GVAR(modifiers)) min 1) max 0;
    player setVariable [QGVAR(cartridgeEfficiency), _cartridgeEfficiencyTotal];
    GVAR(modifiers) = 0;

    if (_cartridgeEfficiencyTotal <= 0) then {
        [] call FUNC(swapMask);
        player setVariable [QGVAR(cartridgeEfficiency), MACRO_PLAYER_DEFAULTS_HIGH];
    };

    [QUOTE(COMPONENT_BEAUTIFIED), "Deficiency cycle..."] call EFUNC(common,debugMessage);
}, 10, []] call CBA_fnc_addPerFrameHandler;
