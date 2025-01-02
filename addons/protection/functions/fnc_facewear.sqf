#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Facewear protection ratings return
 *
 * Arguments:
 * None
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

private _facewear = goggles player;
if (_facewear isEqualTo "") exitWith {};

private _facewearCfg = configFile >> "CfgGlasses" >> _facewear;

private _gasMask = getNumber (_facewearCfg >> QGVAR(gasmask));
private _scba = getNumber (_facewearCfg >> QGVAR(scba));
private _skinProtection = getNumber (_facewearCfg >> QGVAR(skinProtection));
private _respiratoryProtection = getNumber (_facewearCfg >> QGVAR(respiratoryProtection));
private _eyeProtection = getNumber (_facewearCfg >> QGVAR(eyeProtection));
private _hearingProtection = getNumber (_facewearCfg >> QGVAR(hearingProtection));

[_gasMask, _scba, _skinProtection, _respiratoryProtection, _eyeProtection, _hearingProtection]