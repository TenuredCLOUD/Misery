#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Total protection ratings return
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Total Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection
 *
 * Example:
 * [] call misery_protection_fnc_totalProtection;
 *
*/

private _headgear = headgear player;
private _facewear = goggles player;
private _vest = vest player;
private _uniform = uniform player;
private _backpack = backpack player;

private _protectionValues = [0, 0, 0, 0, 0, 0];

if (_headgear isNotEqualTo "") then {
    private _headgearCfg = configFile >> "CfgWeapons" >> _headgear;
    _protectionValues set [0, getNumber (_headgearCfg >> QGVAR(gasmask))];
    _protectionValues set [1, getNumber (_headgearCfg >> QGVAR(scba))];
    _protectionValues set [2, getNumber (_headgearCfg >> QGVAR(skinProtection))];
    _protectionValues set [3, getNumber (_headgearCfg >> QGVAR(respiratoryProtection))];
    _protectionValues set [4, getNumber (_headgearCfg >> QGVAR(eyeProtection))];
    _protectionValues set [5, getNumber (_headgearCfg >> QGVAR(hearingProtection))];
};

if (_facewear isNotEqualTo "") then {
    private _facewearCfg = configFile >> "CfgGlasses" >> _facewear;
    _protectionValues set [0, (_protectionValues select 0) + getNumber (_facewearCfg >> QGVAR(gasmask))];
    _protectionValues set [1, (_protectionValues select 1) + getNumber (_facewearCfg >> QGVAR(scba))];
    _protectionValues set [2, (_protectionValues select 2) + getNumber (_facewearCfg >> QGVAR(skinProtection))];
    _protectionValues set [3, (_protectionValues select 3) + getNumber (_facewearCfg >> QGVAR(respiratoryProtection))];
    _protectionValues set [4, (_protectionValues select 4) + getNumber (_facewearCfg >> QGVAR(eyeProtection))];
    _protectionValues set [5, (_protectionValues select 5) + getNumber (_facewearCfg >> QGVAR(hearingProtection))];
};

if (_vest isNotEqualTo "") then {
    private _vestCfg = configFile >> "CfgWeapons" >> _vest;
    _protectionValues set [0, (_protectionValues select 0) + getNumber (_vestCfg >> QGVAR(gasmask))];
    _protectionValues set [1, (_protectionValues select 1) + getNumber (_vestCfg >> QGVAR(scba))];
    _protectionValues set [2, (_protectionValues select 2) + getNumber (_vestCfg >> QGVAR(skinProtection))];
    _protectionValues set [3, (_protectionValues select 3) + getNumber (_vestCfg >> QGVAR(respiratoryProtection))];
    _protectionValues set [4, (_protectionValues select 4) + getNumber (_vestCfg >> QGVAR(eyeProtection))];
    _protectionValues set [5, (_protectionValues select 5) + getNumber (_vestCfg >> QGVAR(hearingProtection))];
};

if (_uniform isNotEqualTo "") then {
    private _uniformCfg = configFile >> "CfgWeapons" >> _uniform;
    _protectionValues set [0, (_protectionValues select 0) + getNumber (_uniformCfg >> QGVAR(gasmask))];
    _protectionValues set [1, (_protectionValues select 1) + getNumber (_uniformCfg >> QGVAR(scba))];
    _protectionValues set [2, (_protectionValues select 2) + getNumber (_uniformCfg >> QGVAR(skinProtection))];
    _protectionValues set [3, (_protectionValues select 3) + getNumber (_uniformCfg >> QGVAR(respiratoryProtection))];
    _protectionValues set [4, (_protectionValues select 4) + getNumber (_uniformCfg >> QGVAR(eyeProtection))];
    _protectionValues set [5, (_protectionValues select 5) + getNumber (_uniformCfg >> QGVAR(hearingProtection))];
};

if (_backpack isNotEqualTo "") then {
    private _backpackCfg = configFile >> "CfgVehicles" >> _backpack;
    _protectionValues set [0, (_protectionValues select 0) + getNumber (_backpackCfg >> QGVAR(gasmask))];
    _protectionValues set [1, (_protectionValues select 1) + getNumber (_backpackCfg >> QGVAR(scba))];
    _protectionValues set [2, (_protectionValues select 2) + getNumber (_backpackCfg >> QGVAR(skinProtection))];
    _protectionValues set [3, (_protectionValues select 3) + getNumber (_backpackCfg >> QGVAR(respiratoryProtection))];
    _protectionValues set [4, (_protectionValues select 4) + getNumber (_backpackCfg >> QGVAR(eyeProtection))];
    _protectionValues set [5, (_protectionValues select 5) + getNumber (_backpackCfg >> QGVAR(hearingProtection))];
};

_protectionValues
