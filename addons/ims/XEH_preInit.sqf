#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

MiseryWBKIMS=FALSE; 
if(isClass(configFile>>"cfgPatches">>"WBK_MeleeMechanics"))then{MiseryWBKIMS=TRUE};

//WBKIMS Force Misery compat settings (If loaded):
if (MiseryWBKIMS && isServer) then {
    private _WBKIMSgvars = ["IMS_RifleDodgeSet", "IMS_IsStaticDeaths", "IMS_EnablePlayerSounds"];
    private _WBKIMSfunctions = ["IMS_DodgeWithFists", "IMS_DodgeWithRifle", "IMS_DodgeLeftOrRight", "FP_SpawnHumanDodge_Actual", "FP_SpawnHumanDodge", "HumanExecutionsSelectFrom"];

    //Force FP melee mode:
    if (!isNil "IMS_WBK_MAINFPTP") then {
        if (IMS_WBK_MAINFPTP == false) then {
            IMS_WBK_MAINFPTP = true;
            publicVariable "IMS_WBK_MAINFPTP";
        };
    };

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
};

//WBKIMS Force compat to Ravage zeds (This insures they no longer scream when killed):
if (MiseryWBKIMS && MiseryRavage && isServer) then {
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
// if (MiseryWBKIMS && MiseryDSA) then {
//     private _gvars = ["dsaSpookBases", "dsaDevMutants", "dsaWebknightCreatures"];

//     {
//         waitUntil {!isNil _x}; // Run every frame to reload faster 
//     } forEach _gvars;

//     private _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;

//     if (isServer) then {
//         {
//             private _unit = _x; // Store the current unit in a variable
//             if (_spookArray findIf {_unit isKindOf _x} != -1) then {
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

// //WBK IMS Handle for Dash / sprint w/ no stamina (overrides to enforce stamina depletion)
if (MiseryWBKIMS && hasInterface) then {
[] execVM "\z\misery\addons\ims\functions\fnc_IMSDash.sqf";
};

ADDON = true;
