#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Headgear protection ratings return
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Headgear Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection
 *
 * Example:
 * [] call misery_protection_fnc_headgear;
 *
*/

private _headgear = headgear player;
if (_headgear isEqualTo "") exitWith {
    MACRO_NO_PROTECTIONS
};

private _headgearCfg = configFile >> "CfgWeapons" >> _headgear;

private _gasMask = getNumber (_headgearCfg >> QGVAR(gasmask));
private _scba = getNumber (_headgearCfg >> QGVAR(scba));
private _skinProtection = getNumber (_headgearCfg >> QGVAR(skinProtection));
private _respiratoryProtection = getNumber (_headgearCfg >> QGVAR(respiratoryProtection));
private _eyeProtection = getNumber (_headgearCfg >> QGVAR(eyeProtection));
private _hearingProtection = getNumber (_headgearCfg >> QGVAR(hearingProtection));

[_gasMask, _scba, _skinProtection, _respiratoryProtection, _eyeProtection, _hearingProtection]
