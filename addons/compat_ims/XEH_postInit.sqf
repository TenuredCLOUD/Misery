#include "script_component.hpp"

if (isServer) then {
    private _WBKIMSgvars = ["IMS_RifleDodgeSet", "IMS_IsStaticDeaths", "IMS_EnablePlayerSounds"];
    private _WBKIMSfunctions = ["IMS_DodgeWithFists", "IMS_DodgeWithRifle", "IMS_DodgeLeftOrRight", "FP_SpawnHumanDodge_Actual", "FP_SpawnHumanDodge", "HumanExecutionsSelectFrom"];

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, false];
            publicVariable _x;
        };
    } forEach _WBKIMSgvars;

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, nil];
            publicVariable _x;
            missionNamespace setVariable [_x, {false}];
            publicVariable _x;
        };
    } forEach _WBKIMSfunctions;

//WBKIMS Force compat to Ravage zeds (This insures they no longer scream when killed):
if ("ravage" call EFUNC(common,isModLoaded)) then {
    {
        if (_x isKindOf "zombie") then {
            _x setVariable ["IMS_EventHandler_Hit",{
                _victim = _this select 0;
                if ((damage _victim) >= 0.3) exitWith {
                    _victim setDamage 1;
                };
            },true];
        };
    } forEach allUnits;
};

//IMS melee kill for DSA removed for now
//WBKIMS Force compat to DSA (spooks & Anomalies) (This insures spooks no longer scream when killed, etc...):
// if (MiseryWBKIMS && EGVAR(common,dsa)) then {
//     private _gvars = ["dsaSpookBases", "dsaDevMutants", "dsaWebknightCreatures"];

//     {
//         waitUntil {!isNil _x}; // Run every frame to reload faster
//     } forEach _gvars;

//     private _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;

//     if (isServer) then {
//         {
//             private _unit = _x; // Store the current unit in a variable
//             if (_spookArray findIf {_unit isKindOf _x} isNotEqualTo -1) then {
//                 _unit setVariable ["IMS_EventHandler_Hit",{
//                     _victim = _this select 0;
//                     if ((damage _victim) >= 0.3) exitWith {
//                         _victim setDamage 1;
//                     };
//                 },true];
//             };
//         } forEach allUnits;
//     };
// };
};

if (!hasInterface) exitWith {};

[{!isNil "WBK_ShowHud"}, {
    WBK_ShowHud = false;
}, []] call CBA_fnc_waitUntilAndExecute;

// WBK IMS Handle for Dash / sprint w/ no stamina (overrides to enforce stamina depletion)
[] call FUNC(dash);

// Auto swap logic for basic item conversion to IMS melee weapons
player addEventHandler ["Take", {
	params ["_unit", "_container", "_item"];
    // Knives & Axes
    private _toolGear = MACRO_IMS_COMPAT findIf { _item isEqualTo (_x select 0) };
    if (_toolGear isNotEqualTo -1) then {
        private _oldToolItem = _item;
        private _newToolItem = (MACRO_IMS_COMPAT select _toolGear) select 1;
        if ([_unit, _oldToolItem] call CBA_fnc_removeItem) then {
            [_unit, _newToolItem, true] call CBA_fnc_addItem;
        };
    };
}];

player addEventHandler ["InventoryOpened", {
    params ["_unit", "_primaryContainer", "_secondaryContainer"];
    // Knives & Axes
    {
        private _oldToolItem = _x select 0;
        private _newToolItem = _x select 1;

        if ([[_oldToolItem]] call EFUNC(common,hasItem)) then {
            [_unit, _oldToolItem] call CBA_fnc_removeItem;
            [_unit, _newToolItem, true] call CBA_fnc_addItem;
        };
    } forEach MACRO_IMS_COMPAT;
}];
