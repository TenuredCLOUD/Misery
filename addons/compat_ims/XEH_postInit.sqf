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
if (EGVAR(common,checkRavage)) then {
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

WBK_ShowHud = GVAR(hudShow);

// WBK IMS Handle for Dash / sprint w/ no stamina (overrides to enforce stamina depletion)
[] call FUNC(dash);

player addEventHandler ["InventoryOpened", {
    [player, QCLASS(woodaxe), "WBK_axe"] call EFUNC(common,weaponSwap);
    [player, QCLASS(sledgehammer), "WBK_survival_weapon_2"] call EFUNC(common,weaponSwap);
    [player, QCLASS(craftingHammer), "WBK_SmallHammer"] call EFUNC(common,weaponSwap);
    [player, QCLASS(anvilHammer), "WBK_SmallHammer"] call EFUNC(common,weaponSwap);
    [player, "rvg_guttingKnife", selectRandom [MACRO_KNIVES]] call EFUNC(common,weaponSwap);
    [player, QCLASS(guttingKnife), selectRandom [MACRO_KNIVES]] call EFUNC(common,weaponSwap);
}];
