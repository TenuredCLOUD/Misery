#include "script_component.hpp"

if (hasInterface) then {
    call FUNC(processEffects);

    // Auto swap logic for ACE pain pills
    ACE_player addEventHandler ["Take", {
	    params ["_unit", "_container", "_item"];

        if (_item isEqualTo QCLASSACE(PainKillers)) then {
            [[QCLASSACE(PainKillers)], [QCLASS(painkillers)]] call EFUNC(common,switchMagazine);
        };
    }];


    ACE_player addEventHandler ["InventoryOpened", {
        params ["_unit", "_primaryContainer", "_secondaryContainer"];

        if ([[QCLASSACE(PainKillers)]] call EFUNC(common,hasItem)) then {
            [[QCLASSACE(PainKillers)], [QCLASS(painkillers)]] call EFUNC(common,switchMagazine);
        };
    }];
};
