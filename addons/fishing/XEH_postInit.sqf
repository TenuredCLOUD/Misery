#include "script_component.hpp"

if (GVAR(enabled)) then {
    private _fishingMainMenu = [
        QGVAR(fishing_menu),
        localize ECSTRING(common,StartFishing),
        QPATHTOEF(icons,data\fishing_hook_ca.paa),
        {},
        {
            call FUNC(canFish)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _fishingMainMenu] call ACEFUNC(interact_menu,addActionToObject);

    private _fishingActionMenu = [
        QGVAR(fishingAction_menu),
        localize ECSTRING(common,StartFishingAct),
        QPATHTOEF(icons,data\fishing_hook_ca.paa),
        {
            [] call FUNC(action);
        },
        {true}
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions), QGVAR(fishing_menu)], _fishingActionMenu] call ACEFUNC(interact_menu,addActionToObject);

    private _fishingRequirementsMenu = [
        QGVAR(fishingRequirements_menu),
        localize ECSTRING(common,StartFishingRequirements),
        QPATHTOEF(icons,data\fishing_hook_ca.paa),
        {
            [QEGVAR(common,tileText), localize ECSTRING(common,StartFishingRequirements_Listed)] call CBA_fnc_localEvent;
        },
        {true}
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions), QGVAR(fishing_menu)], _fishingRequirementsMenu] call ACEFUNC(interact_menu,addActionToObject);
};
