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
 * [] call misery_gasmask_fnc_gasmaskTimer
 *
*/

//If No Client data exists add default cartridge capacity:
if (isNil{(profileNamespace getVariable MiserysurvivalSaveName)}) then {
player setVariable [QCLASS(gasmaskCartridgeLevel), 100];
};

//If cartridge GVAR isn't defined yet define default value:
if (isNil {player getVariable QCLASS(gasmaskCartridgeLevel)}) then {player setVariable [QCLASS(gasmaskCartridgeLevel), 100]};

[{(call EFUNC(protection,totalProtection) select 0) > 0 && (call EFUNC(protection,totalProtection) select 3) > 0 && (call EFUNC(protection,totalProtection) select 1) < 1},
{

    [{
        params ["_args", "_handle"];

        if ((call EFUNC(protection,totalProtection) select 0) < 1 || (call EFUNC(protection,totalProtection) select 3) < 1 || (call EFUNC(protection,totalProtection) select 1) > 0 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Gasmask deficiency cycle terminated..."};
            [] call FUNC(gasmaskTimer);
            if(EGVAR(common,debug))then{systemChat "Misery Gasmask deficiency cycle checks re-initiated..."};
        };

private _MCartridge = player getVariable [QCLASS(gasmaskCartridgeLevel), 100];

player setVariable [QCLASS(gasmaskCartridgeLevel), (_MCartridge - 1)];
if (_MCartridge <= 0) then {
[] call FUNC(swapMask);
player setVariable [QCLASS(gasmaskCartridgeLevel), 100];
};

if(EGVAR(common,debug))then{systemChat "Misery Gasmask deficiency cycle..."};

}, GVAR(deficiencyCycle), []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

