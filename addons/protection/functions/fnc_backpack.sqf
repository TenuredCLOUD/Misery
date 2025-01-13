#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Backpack protection ratings return
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Backpack Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection
 *
 * Example:
 * [] call misery_protection_fnc_backpack;
 *
*/

private _backpack = backpack player;
if (_backpack isEqualTo "") exitWith {
    MACRO_NO_PROTECTIONS
};

private _backpackCfg = configFile >> "CfgVehicles" >> _backpack;

private _gasMask = getNumber (_backpackCfg >> QGVAR(gasmask));
private _scba = getNumber (_backpackCfg >> QGVAR(scba));
private _skinProtection = getNumber (_backpackCfg >> QGVAR(skinProtection));
private _respiratoryProtection = getNumber (_backpackCfg >> QGVAR(respiratoryProtection));
private _eyeProtection = getNumber (_backpackCfg >> QGVAR(eyeProtection));
private _hearingProtection = getNumber (_backpackCfg >> QGVAR(hearingProtection));

[_gasMask, _scba, _skinProtection, _respiratoryProtection, _eyeProtection, _hearingProtection]
