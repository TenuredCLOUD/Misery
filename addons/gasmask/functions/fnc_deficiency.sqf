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

    [ACE_player] call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "", "_respiratory"];

    if (_scba >= 1 || {_gasmask < 1 && {_respiratory < 1}}) exitWith {};

    private _deductCount = 1;

    private _inHazardZone = ((EGVAR(chemical,areasCached) findIf {ACE_player inArea _x} isNotEqualTo -1) || {(EGVAR(radiation,areasCached) findIf {ACE_player inArea _x} isNotEqualTo -1)});

    if (_inHazardZone) then {
        _deductCount = _deductCount + 1;
    };

    if (isNull objectParent ACE_player) then {
        private _fatigue = [getFatigue ACE_player, ACE_player getVariable [QACEGVAR(advanced_fatigue,aimFatigue), 0]] select (!isNil QACEGVAR(advanced_fatigue,enabled) && {ACEGVAR(advanced_fatigue,enabled)});
        if (_fatigue > 0.5) then {
            _deductCount = _deductCount + 1;
        };
    };

    private _hasCartridge = [[QCLASS(gasCartridge)]] call EFUNC(common,hasItem);

    for "_i" from 1 to _deductCount do {
        if (_hasCartridge) then {
            _hasCartridge = [QCLASS(gasCartridge)] call EFUNC(common,itemDecrement);
        };
    };

}, 30, []] call CBA_fnc_addPerFrameHandler;
