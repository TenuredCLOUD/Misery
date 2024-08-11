#include "\z\misery\addons\main\script_macros.hpp"

/*
Misery gasmask cartridge degradation
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

//If No Client data exists add default cartridge capacity:
if (isNil{(profileNamespace getVariable MiserysurvivalSaveName)}) then {
player setVariable ["Miserycartridge", 100];
};

//If cartridge GVAR isn't defined yet define default value:
if (isNil {player getVariable "Miserycartridge"}) then {player setVariable ["Miserycartridge", 100]};

[{((goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs))},
{

    [{
        params ["_args", "_handle"];

        if ((!(goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs)) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Gasmask deficiency cycle terminated..."};
            [] execVM "\z\misery\addons\gasmask\functions\fnc_gasmasktimer.sqf";
            if(MiseryDebug)then{systemChat "Misery Gasmask deficiency cycle checks re-initiated..."};
        };

private _MCartridge = player getVariable ["Miserycartridge", 100];
		
if ((goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs)) then {
//Miserycartridge = Miserycartridge -1;
player setVariable ["Miserycartridge", (_MCartridge - 1)];
if (_MCartridge <= 0) then {
MiseryEmptyGasmask = goggles player; //Store currently worn gasmask before removal 
removeGoggles player;
titleText ["Gasmask cartridges empty, removed mask...", "PLAIN DOWN"];
player additem "Misery_gasmaskempty";
player setVariable ["Miserycartridge", 100];
};
}; 

if(MiseryDebug)then{systemChat "Misery Gasmask deficiency cycle..."};

}, MiseryGMdeficiencyCycle, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

