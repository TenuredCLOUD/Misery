#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Uniform protection ratings return
 *
 * Arguments:
 * None
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

private _uniform = uniform player;
if (_uniform isEqualTo "") exitWith {
    MACRO_NO_PROTECTIONS
};

private _uniformCfg = configFile >> "CfgWeapons" >> _uniform;

private _gasMask = getNumber (_uniformCfg >> QGVAR(gasmask));
private _scba = getNumber (_uniformCfg >> QGVAR(scba));
private _skinProtection = getNumber (_uniformCfg >> QGVAR(skinProtection));
private _respiratoryProtection = getNumber (_uniformCfg >> QGVAR(respiratoryProtection));
private _eyeProtection = getNumber (_uniformCfg >> QGVAR(eyeProtection));
private _hearingProtection = getNumber (_uniformCfg >> QGVAR(hearingProtection));

[_gasMask, _scba, _skinProtection, _respiratoryProtection, _eyeProtection, _hearingProtection]
