#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_CookingData")) then {
        [] call FUNC(parseData);

        private _cookingAction = [
            QGVAR(cooking_menu),
            localize ECSTRING(common,UseFire_Cook),
            QPATHTOEF(icons,data\cooking_ca.paa),
            {
                params ["_target", "_player"];
                createDialog QCLASS(cookingFramework_ui);
            },
            {call EFUNC(common,nearFire) params ["_nearestFire", "_isInflamed"]; _nearestFire isNotEqualTo [] && _isInflamed},
            {},
            ["_target", "_player"],
            [0, 0, 0],
            3
        ] call ACEFUNC(interact_menu,createAction);

        {
            [_x, 0, [QUOTE(ACE_MainActions), QEGVAR(fire,fire_menu)], _cookingAction] call ACEFUNC(interact_menu,addActionToClass);
        } forEach [MACRO_FIRETYPES];

    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_CookingData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};

