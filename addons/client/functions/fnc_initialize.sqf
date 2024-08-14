#include "..\script_component.hpp"
/*
Misery Client Variables Initialization
Pre-Processes Client Variables
Designed specifically for Misery mod
by TenuredCLOUD
*/

player setVariable ["MiseryThirst", MIS_THIRST];
player setVariable ["MiseryHunger", MIS_HUNGER];
player setVariable ["MiserySleepiness", MIS_SLEEP];
_MDebuffs = [];
_MCrafting_DataSet = [];
_MCooking_DataSet = [];
_MWCollect_DataSet = [];
player setVariable ["MiseryDebuffs", _MDebuffs];
player setVariable ["Misery_Crafting_DataSet", _MCrafting_DataSet];
player setVariable ["Misery_Cooking_DataSet", _MCooking_DataSet];
player setVariable ["Misery_WaterCollect_DataSet", _MWCollect_DataSet];
player setVariable ["MiseryCurrency", 0];
player setVariable ["MiseryCurrency_Banked", 0];
player setVariable ["lastPhoenixWithdrawalTime", 0];
player setVariable ["MiseryRadiation", 0];
player setVariable ["MiseryPoison", MIS_POISON];
player setVariable ["MiseryInfection", MIS_INFECTION];
player setVariable ["MiseryFear", MIS_FEAR];
player setVariable ["MiseryExposure", MIS_EXPOSURE];
player setVariable ["MiseryPlayerTemp", (call EFUNC(temperature,Temperature)) select 0];
player setVariable ["MiseryBreathFogSim", nil];
player setVariable ["MiseryBreath", false];

MiserySeaTemp = 0;

// Autogenerate savefile if blank
if (MiserysurvivalSaveName == "") then {
    MiserysurvivalSaveName = format["MiseryPlayerSave_%1%2%3", missionName, worldName, name player];
} else {
    MiserysurvivalSaveName = format["MiseryPlayerSave_%1", MiserysurvivalSaveName];
};

// Persistency
if (MiserysurvivalPersistence == 1) then {
    [[], "\z\misery\addons\persistency\functions\fnc_Persistencehandle.sqf"] remoteExec ["execVM", 0, true];
};

if (MiserysurvivalPersistence == 2) then {
    if (hasInterface) then {
    [] call EFUNC(persistency,Keyhandle);
    };
    [[], "\z\misery\addons\persistency\functions\fnc_Persistencehandle.sqf"] remoteExec ["execVM", 0, true];
};

if !(MiserysurvivalKillhandleScript == "") then {
    [[], "\z\misery\addons\persistency\functions\fnc_Killhandle.sqf"] remoteExec ["execVM", 0, true];
};

// Persistency reloader
if (MiserysurvivalSaveMode == 2) then {
    private _saveArray = [];
    if !(isNil {profileNamespace getVariable MiserysurvivalSaveName}) then {
        _saveArray = profileNamespace getVariable MiserysurvivalSaveName;
        if ((count _saveArray) < 1) exitWith {systemChat "New Misery Character";};
        [player] call EFUNC(persistency,Deserializeplayer);
        MiseryNewCharacter = false;
    } else {
        systemChat "New Misery Character";
    };
    enableSaving [false, false]; // Disable saving options + Save & exit etc...
};

if (MiserysurvivalSaveMode == 1) then {
    if (MiserysurvivalHardCoreSaveMode == 1) then {
        enableSaving [false, false]; // Disables saving / autosaving
        player addAction [
            "Save Character",
            {
                enableSaving [true, true];
                sleep 1;
                saveGame;
                titleText ["Progress saved.", "PLAIN DOWN"];
                sleep 1;
                enableSaving [false, false];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "[player] call Misery_fnc_NearFire",
            5,
            false,
            "",
            ""
        ];
    } else {
        enableSaving true;
    };
};

player addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator"];
    systemChat format ["Killed Event Triggered: Unit: %1, Killer: %2, Instigator: %3", _unit, _killer, _instigator];
    if (_unit == player) then {
        systemChat "Player killed. Calling Misery_fnc_DeleteData.";
        [_unit] call EFUNC(persistency,DeleteData);
    };
}];
