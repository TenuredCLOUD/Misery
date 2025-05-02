#include "script_component.hpp"

[
    "fireCrafting_menu",
    "Craft fire",
    {call FUNC(condition)},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        createDialog QCLASS(fireCrafting_ui);
    },
    "",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    ""
] call EFUNC(actions,addAction);

[
    "fire_menu",
    localize "STR_MISERY_USEFIRE",
    {call EFUNC(common,nearFire) params ["_nearestFire"]; _nearestFire isNotEqualTo []},
    {
        player setVariable [QEGVAR(actions,currentParentID), "fire_menu"];
        call EFUNC(actions,displayActions);
        call FUNC(addData);
    },
    "",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    ""
] call EFUNC(actions,addAction);

[
    "fireStatus_menu",
    "Check fire",
    {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fire_menu"},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        createDialog QCLASS(fireCrafting_ui);
        player setVariable [QEGVAR(actions,currentParentID), ""];
        call EFUNC(actions,displayActions);
    },
    "fire_menu",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    ""
] call EFUNC(actions,addAction);

if (isServer) then {

    GVAR(activeFires) = [];
    publicVariable QGVAR(activeFires);

    // Blacklist fire classes
    if (!isNil "grad_persistence_blacklist") then {
        private _fireClasses = [
            "Land_Campfire_F",
            "Campfire_burning_F",
            "FirePlace_burning_F",
            "Land_FirePlace_F",
            "Land_Fire_barrel_F"
        ];
        {
            if ((grad_persistence_blacklist find (toLower _x) isEqualTo -1) && (grad_persistence_blacklist find (toUpper _x) isEqualTo -1)) then {
                [_x] call grad_persistence_fnc_blacklistClasses;
                if (EGVAR(common,debug)) then {systemChat format ["[Misery - %2] GRAD Persistence: Adding %1 to blacklist...", _x, QUOTE(COMPONENT_BEAUTIFIED)]};
            };
        } forEach _fireClasses;
    };
    call FUNC(manage);
};




