#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

MiseryFires=[
"MetalBarrel_burning_F",
"Land_Campfire_F",
"Land_FirePlace_F",
"FirePlace_burning_F"
];

//If GRAD persistence is active, push Fireplace types to blacklister, so they won't save / reload (This will execute only once)
if (isServer) then {
if (!isNil "grad_persistence_blacklist") then {

private _Fireclasses = [
  "Land_Campfire_F",
  "Campfire_burning_F",
  "FirePlace_burning_F",
  "Land_FirePlace_F"
  ];

    {
        if ((grad_persistence_blacklist find (toLower _x) == -1) && (grad_persistence_blacklist find (toUpper _x) == -1)) then {
            [_x] call grad_persistence_fnc_blacklistClasses;
            if (MiseryDebug) then {systemChat format ["[Misery Fire crafting] GRAD Persistence detected, Adding %1 to blacklist for saving / reloading...", _x]}; 
        };
    } forEach _Fireclasses;
    };
};


ADDON = true;
