#include "script_component.hpp"

GVAR(worldSize) = worldSize;
GVAR(worldAxis) = worldSize / 2;
GVAR(worldCenter) = [GVAR(worldAxis), GVAR(worldAxis), 0];
GVAR(worldRadius) = sqrt 2 * GVAR(worldAxis);

//If GRAD persistence is active, push Remnant ODRA object holders to blacklister, so they won't save / reload (This will execute only once)
if (isServer) then {
if (GVAR(remnant)) then {
    if (!isNil "grad_persistence_blacklist") then {
        private _RemnantODRA = [
            "Sign_Sphere10cm_F",
            "Land_HandyCam_F",
            "Reflector_Cone_01_narrow_blue_F",
            "Reflector_Cone_01_narrow_red_F",
            "Reflector_Cone_01_wide_blue_F",
            "Reflector_Cone_01_wide_orange_F",
            "odra_l_alert",
            "odra_lamp_p",
            "odra_l_idle",
            "odra"
        ];

        {
            if ((grad_persistence_blacklist find (toLower _x) == -1) && (grad_persistence_blacklist find (toUpper _x) == -1)) then {
                [_x] call grad_persistence_fnc_blacklistClasses;
                if (EGVAR(common,debug)) then {systemChat format ["[Misery Remnant Compat] GRAD Persistence detected, Adding %1 to blacklist for saving / reloading...", _x]};
            };
        } forEach _RemnantODRA;
        };
    };
};

if (!hasInterface) exitWith {};

// Default loadout
GVAR(defaultLoadout) = [[[],[],[],[],[],[],"","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

// Combat Logging
[] call FUNC(combatLogPrevention);

// Loadout change will clear item cache for hasItem
["loadout", {
    GVAR(itemsCache) = nil;
}] call CBA_fnc_addPlayerEventHandler;

[QGVAR(titleText), {
    params ["_text"];
    titleText [format ["<t font='PuristaMedium'>%1</t>", _text], "PLAIN DOWN", -1, true, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(tileText), {
    params ["_text"];
    [parseText _text, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
}] call CBA_fnc_addEventHandler;

[QGVAR(exitGui), {
(findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
(findDisplay 602) closeDisplay 2;
}] call CBA_fnc_addEventHandler;
