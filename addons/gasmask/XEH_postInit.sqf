#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    if (GVAR(enhanced)) then {
        call FUNC(deficiency);
        call FUNC(rebreatherAudio);
    };

    if (GVAR(rebreatherHoses)) then {
        call FUNC(rebreatherHose);
    };

    // Only create mask break events, if enabled in ACE
    if (!isNil QACEGVAR(goggles,effects) && ACEGVAR(goggles,effects) >= 2) then {
        [QCLASSACE(glassesCracked), {
            params ["_unit"];
            if (_unit isEqualTo player) then {
                if ([_unit] call ACEFUNC(goggles,isGogglesVisible)) then {
                    [QEGVAR(common,tileText), format [localize LSTRING(EquipmentBroken), [goggles _unit] call EFUNC(common,getItemData) select 0]] call CBA_fnc_localEvent;
                    [{
                        params ["_unit"];
                        _unit unlinkItem goggles _unit;
                    }, [_unit], 2] call CBA_fnc_waitAndExecute;
                };
            };
        }] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;

// For gasmask cartridge efficiency.
GVAR(modifiers) = 0;
