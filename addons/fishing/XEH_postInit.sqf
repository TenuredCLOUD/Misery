#include "script_component.hpp"

if (GVAR(enabled)) then {
    // [
    //     "fishing_menu",
    //     localize ECSTRING(common,StartFishing),
    //     {call FUNC(canFish)},
    //     {
    //         player setVariable [QEGVAR(actions,currentParentID), "fishing_menu"];
    //         call EFUNC(actions,displayActions);
    //     },
    //     "",
    //     QPATHTOEF(icons,data\fishing_hook_ca.paa),
    //     ""
    // ] call EFUNC(actions,addAction);

    // [
    //     "fishingAction_menu",
    //     localize ECSTRING(common,StartFishingAct),
    //     {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fishing_menu"},
    //     {
    //         [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    //         [] call FUNC(action);
    //     },
    //     "fishing_menu",
    //     QPATHTOEF(icons,data\fishing_hook_ca.paa),
    //     ""
    // ] call EFUNC(actions,addAction);

    // [
    //     "fishingRequirements_menu",
    //     localize ECSTRING(common,StartFishingRequirements),
    //     {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fishing_menu"},
    //     {
    //         [QEGVAR(common,tileText), localize ECSTRING(common,StartFishingRequirements_Listed)] call CBA_fnc_localEvent;
    //     },
    //     "fishing_menu",
    //     QPATHTOEF(icons,data\fishing_hook_ca.paa),
    //     ""
    // ] call EFUNC(actions,addAction);

    private _fishingMainMenu = [
        QGVAR(fishing_menu),
        localize ECSTRING(common,StartFishing),
        QPATHTOEF(icons,data\fishing_hook_ca.paa),
        {
            call EFUNC(actions,displayActions);
        },
        {
            call FUNC(canFish)
        }
    ] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _fishingMainMenu] call ace_interact_menu_fnc_addActionToObject;

    private _fishingActionMenu = [
        QGVAR(fishingAction_menu),
        localize ECSTRING(common,StartFishingAct),
        QPATHTOEF(icons,data\fishing_hook_ca.paa),
        {
            [] call FUNC(action);
        },
        {
            true
        }
    ] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", QGVAR(fishing_menu)], _fishingActionMenu] call ace_interact_menu_fnc_addActionToObject;

    private _fishingRequirementsMenu = [
        QGVAR(fishingRequirements_menu),
        localize ECSTRING(common,StartFishingRequirements),
        QPATHTOEF(icons,data\fishing_hook_ca.paa),
        {
            [QEGVAR(common,tileText), localize ECSTRING(common,StartFishingRequirements_Listed)] call CBA_fnc_localEvent;
        },
        {
            true
        }
    ] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", QGVAR(fishing_menu)], _fishingRequirementsMenu] call ace_interact_menu_fnc_addActionToObject;
};
