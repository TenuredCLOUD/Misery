#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vest protection ratings return
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Vest Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection
 *
 * Example:
 * [] call misery_protection_fnc_vest;
 *
*/

private _vest = vest player;
if (_vest isEqualTo "") exitWith {
    MACRO_NO_PROTECTIONS
};

private _vestCfg = configFile >> "CfgWeapons" >> _vest;

private _gasMask = getNumber (_vestCfg >> QGVAR(gasmask));
private _scba = getNumber (_vestCfg >> QGVAR(scba));
private _skinProtection = getNumber (_vestCfg >> QGVAR(skinProtection));
private _respiratoryProtection = getNumber (_vestCfg >> QGVAR(respiratoryProtection));
private _eyeProtection = getNumber (_vestCfg >> QGVAR(eyeProtection));
private _hearingProtection = getNumber (_vestCfg >> QGVAR(hearingProtection));

[_gasMask, _scba, _skinProtection, _respiratoryProtection, _eyeProtection, _hearingProtection]
