#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Antiparasitic pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_antiparasitic;
 *
*/

private _MDebuffs = player getVariable "MiseryDebuffs";

MiseryACE=false;
if (isClass(configFile>>"cfgPatches">>"ace_main")) then {
    MiseryACE=true
};

if (!hasInterface) exitWith {};

if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) then {
    titleText ["You take a Anti parasitic pill...", "PLAIN DOWN"];

    player removeItem "Misery_antiparasiticpill";

    if (MiseryACE) then {
        [player, "Misery_antiparasiticpill", 10, 60, -15, 0, -15] call ace_medical_status_fnc_addMedicationAdjustment;
    };

    sleep 60;

    if (_MDebuffs find "PARASITES" != -1) then {
        _MDebuffs deleteAt (_MDebuffs find "PARASITES");
        player setVariable ["MiseryDebuffs", _MDebuffs];
    };
};
