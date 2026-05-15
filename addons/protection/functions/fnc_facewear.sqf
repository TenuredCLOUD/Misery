#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Facewear protection ratings return
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Facewear Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection
 *
 * Example:
 * [] call misery_protection_fnc_facewear;
 *
*/

params ["_unit"];

private _facewear = goggles _unit;
if (_facewear isEqualTo "") exitWith {
    MACRO_NO_PROTECTIONS
};

private _modConfig = configFile >> "CfgGlasses" >> _facewear;
private _missionConfig = missionConfigFile >> "CfgMisery_GearData" >> "GearValues" >> _facewear;

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
