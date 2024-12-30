#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Client handling of inside radiation zone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radiation_fnc_playerRadZone
*/

// PFH monitoring when the player leaves the radzone.
[{
    params ["_args", "_handle"];

//Handle dosage
private _gear = player call EFUNC(common,getSimplifiedLoadout);

_totalProtection = [0, 0, 0, 0];

{
_equipment = _x;

if (_equipment isEqualTo "") then {
_totalProtection = [0, 0, 0, 0];
} else {
{
    if (_x select 0 == _equipment) then {
    _totalProtection = _totalProtection vectorAdd (_x select 1);
};
} forEach EGVAR(common,protectiveGear);
};
} forEach _gear;

_skinProtection = _totalProtection select 0;
_respiratoryProtection = _totalProtection select 1;
_eyeProtection = _totalProtection select 2;

private _protectionFactor = _skinProtection + _respiratoryProtection + _eyeProtection;

private _baseDose = 1;
private _effectiveDose = _baseDose * (1 - (_protectionFactor / 300));

player setVariable [QCLASS(radiation), (player getVariable [QCLASS(radiation), 0]) + _effectiveDose];

if (EGVAR(common,debug)) then {
    systemChat format ["Radiation Protection: Skin %1%2, Respiratory %3%4, Eye %5%6", _skinProtection, "%", _respiratoryProtection, "%", _eyeProtection, "%"];
    systemChat format ["Effective Radiation Dose: %1", _effectiveDose];
};

    private _leftRadZone = GVAR(radiationAreas) findIf {player inArea _x} == -1;

    if (_leftRadZone) exitWith {
        player setVariable [QGVAR(insideRadZone), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
