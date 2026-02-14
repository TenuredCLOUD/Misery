#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_CookingData")) then {
        [] call FUNC(parseData);

        [
            "cooking_menu",
            localize "STR_MISERY_USEFIRE_COOK",
            {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fire_menu" && call EFUNC(common,nearFire) params ["_nearestFire", "_isInflamed"]; _nearestFire isNotEqualTo [] && _isInflamed},
            {
                [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
                createDialog QCLASS(cookingFramework_ui);
                player setVariable [QEGVAR(actions,currentParentID), ""];
            },
            "fire_menu",
            QPATHTOEF(icons,data\cooking_ca.paa),
            ""
        ] call EFUNC(actions,addAction);

    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_CookingData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};

