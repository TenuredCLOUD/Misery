#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"
#include "initSettings.inc.sqf"

// Autogenerate savefile if blank
if (MiserysurvivalSaveName == "") then {
    MiserysurvivalSaveName = format["MiseryPlayerSave_%1%2%3", missionName, worldName, name player];
} else {
    MiserysurvivalSaveName = format["MiseryPlayerSave_%1", MiserysurvivalSaveName];
};

// Persistency
if (MiserysurvivalPersistence == 1) then {
    [[], EFUNC(persistency,persistenceHandle)] remoteExec ["call", 0, true];
};

if (MiserysurvivalPersistence == 2) then {
    if (hasInterface) then {
    [] call EFUNC(persistency,Keyhandle);
    };
    [[], EFUNC(persistency,persistenceHandle)] remoteExec ["call", 0, true];
};

if !(MiserysurvivalKillhandleScript == "") then {
    [[], EFUNC(persistency,killHandle)] remoteExec ["call", 0, true];
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

ADDON = true;
