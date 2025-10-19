#include "script_component.hpp"

GVAR(worldSize) = worldSize;
GVAR(worldAxis) = worldSize / 2;
GVAR(worldCenter) = [GVAR(worldAxis), GVAR(worldAxis), 0];
GVAR(worldRadius) = sqrt 2 * GVAR(worldAxis);

//If GRAD persistence is active, push Remnant ODRA object holders to blacklister, so they won't save / reload (This will execute only once)
if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_VehicleData")) then {
    [] call FUNC(parseVehicleData);
    } else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_VehicleData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
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
            if ((grad_persistence_blacklist find (toLower _x) isEqualTo -1) && (grad_persistence_blacklist find (toUpper _x) isEqualTo -1)) then {
                [_x] call grad_persistence_fnc_blacklistClasses;
            };
            } forEach _RemnantODRA;
        };
    };
};

if (!hasInterface) exitWith {};

// Default loadout
GVAR(defaultLoadout) = [[[],[],[],[],[],[],"","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[], false];

// Combat Logging
[] call FUNC(combatLogPrevention);

// Loadout change will clear item cache for hasItem
["loadout", {
    GVAR(itemsCache) = nil;
}] call CBA_fnc_addPlayerEventHandler;

[QGVAR(titleText), {
    params ["_text"];
    titleText [format ["<t font='%1' size='%2'>%3</t>", UI_MACRO_FONT, GVAR(promptSizes), _text], "PLAIN DOWN", -1, true, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(tileText), {
    params ["_text"];
    private _formattedText = parseText format ["<t font='%1' size='%2'>%3</t>", UI_MACRO_FONT, GVAR(promptSizes), _text];
    [_formattedText, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
}] call CBA_fnc_addEventHandler;

[QGVAR(inventoryTile), {
    params ["_text", ["_time", 10]];
    private _display = findDisplay 982377;
    if (isNull _display) exitWith {};
    private _noteBox = _display displayCtrl 1022;
    _noteBox ctrlSetStructuredText parseText format ["<t font='%1' size='%2'>%3</t>", UI_MACRO_FONT, GVAR(promptSizes), _text];

    [{
        params ["_display", "_noteBox"];
        if (isNull _display) exitWith {};
        _noteBox ctrlSetStructuredText parseText "";
    }, [_display, _noteBox], _time] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(exitGui), {
    (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui)) closeDisplay 1;
    (findDisplay 602) closeDisplay 2;
}] call CBA_fnc_addEventHandler;
