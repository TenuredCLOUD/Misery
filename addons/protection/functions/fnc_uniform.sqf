#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Uniform protection ratings return
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Uniform Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection
 *
 * Example:
 * [] call misery_protection_fnc_uniform;
 *
*/

params ["_unit"];

private _uniform = uniform _unit;
if (_uniform isEqualTo "") exitWith {
    MACRO_NO_PROTECTIONS
};

private _modConfig = configFile >> "CfgWeapons" >> _uniform;
private _missionConfig = missionConfigFile >> "CfgMisery_GearData" >> "GearValues" >> _uniform;

private _attributes = [
    QGVAR(gasmask),
    QGVAR(scba),
    QGVAR(skinProtection),
    QGVAR(respiratoryProtection),
    QGVAR(eyeProtection),
    QGVAR(hearingProtection)
];

_attributes apply {
    if (isClass _missionConfig && {isNumber (_missionConfig >> _x)}) then {
        getNumber (_missionConfig >> _x)
    } else {
        getNumber (_modConfig >> _x)
    };
};
