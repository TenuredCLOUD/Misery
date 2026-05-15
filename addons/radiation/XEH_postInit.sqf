#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(inArea);
    };

    if (hasInterface) then {
        [QGVAR(radiationEvent), FUNC(process)] call CBA_fnc_addEventHandler;

        private _leadContainer = [
            QGVAR(leadContainers_menu),
            localize ECSTRING(common,StoreArtifact),
            QPATHTOEF(icons,data\package_open_ca.paa),
            {
                call FUNC(storeArtifact)
            },
            {
                [[QCLASS(leadContainer_Open)]] call EFUNC(common,hasItem) && [[MACRO_ARTIFACTS]] call EFUNC(common,hasItem)
            }
        ] call ACEFUNC(interact_menu,createAction);

        [player, 1, [QUOTE(ACE_SelfActions)], _leadContainer] call ACEFUNC(interact_menu,addActionToObject);


        // Reactivate Geiger if picking up active one:
        player addEventHandler ["Take", {
            params ["_unit", "_container", "_item"];
            if (_item isEqualTo QCLASS(geiger_On)) then {
                if (isNil {_unit getVariable "GeigerON"}) then {
                    _unit setVariable ["GeigerON", true, true];
                };
            };
        }];

        // Kill Detection var for Geiger if you drop it:
        player addEventHandler ["Put", {
            params ["_unit", "_container", "_item"];
            if (_item isEqualTo QCLASS(geiger_On)) then {
                if (_unit getVariable ["GeigerON", true]) then {
                    _unit setVariable ["GeigerON", nil, true];
                };
            };
        }];
    };
}] call CBA_fnc_addEventHandler;

GVAR(modifiers) = 0;
