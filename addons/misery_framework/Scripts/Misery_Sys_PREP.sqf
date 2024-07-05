 /* -----------------------------------
Misery Module startup
Reads all module startups on scenario load
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

//if ((count(entities"Misery_Survival")) < 1) exitWith {}; //Exit startup code if no Misery survival module is placed 

//if ((count(entities"Ravage_survival")) > 0) exitwith {}; //Exit startup code if Ravage survival module is placed (Version 1.1.6 + is no longer compatible)

if!(isNil"MiseryExit")exitWith{};

MiseryDebug=FALSE;
MiseryEnabled=TRUE;

MiserySurvivalShowStatus=FALSE;

MiserySurvival=FALSE;

MiserySurvivalItems=[];
MiserySurvivalItemEffects=[];

MiseryAllBuildings=[];

MiserySleeping=FALSE;

// Custom inventory click actions [_itemClassName,_scriptPath]
MiseryActionsItemCustom=[];

MiseryActions=[];

MiseryActionsMode="";

//Prestart for vehicle interaction to avoid undefined RPT logs
MiseryTarget_Veh = objNull;

//Prestart for Trader varname tracking:
MiseryActiveTraders = [];

//Deleteclickcheck:
MiseryDeleteConfirm = 0;

//PDAclickcheck:
MiseryPDACompass = FALSE;
MiseryPDAClock = FALSE;
MiseryPDAClimate = FALSE;

//Psyfield preset:
MiseryinPsyfield = FALSE; 

//RadZone preset:
MiseryinRadZone = FALSE;

// Custom player menu actions [_description,_scriptPath]
MiseryActionsCustom=[];

MiseryMP=TRUE; // Multiplayer
if!(isMultiplayer)then{MiseryMP=FALSE};

MiseryRavage=FALSE;
if (isClass(configFile>>"cfgPatches">>"ravage")) then {MiseryRavage=TRUE};

MiseryRavageAtmo = FALSE;
if ((count(entities"Ravage_atmosphere")) > 0) then {MiseryRavageAtmo = TRUE};

if (MiseryRavageAtmo && isServer) then {
private _atmomodule=(entities"Ravage_atmosphere")select 0;
_BreathfogisActive = _atmomodule getVariable ["breathfog_m", false];

if (_BreathfogisActive) then{
private _rvgatmofunctions = ["RVG_fnc_breathfog"];

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, nil];
            publicVariable _x;
            missionNamespace setVariable [_x, {false}];
            publicVariable _x;
        };
    } forEach _rvgatmofunctions;
    };
};

MiseryVA=FALSE;
if(isClass(configFile>>"cfgPatches">>"VandeansonsApocalypse"))then{MiseryVA=TRUE};

//If VA is active disable inventory handles:
if (MiseryVA && isServer) then {
    private _VAgvars = ["VA_click_handle"];
    private _VAfunctions = ["VA_fnc_actionSelect"];

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, false];
            publicVariable _x;
        };
    } forEach _VAgvars;

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, nil];
            publicVariable _x;
            missionNamespace setVariable [_x, {false}];
            publicVariable _x;
        };
    } forEach _VAfunctions;
};

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

MiseryACERefuel=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_refuel"))then{MiseryACERefuel=TRUE};

MiseryUsingiBuild=FALSE; 
if(isClass(configFile>>"cfgPatches">>"NerdMods_iBuild"))then{MiseryUsingiBuild=TRUE};

MiseryRemnant=FALSE; 
if(isClass(configFile>>"cfgPatches">>"remnant"))then{MiseryRemnant=TRUE};

MiseryDSA=FALSE; 
if(isClass(configFile>>"cfgPatches">>"DSA_Spooks"))then{MiseryDSA=TRUE};

//If GRAD persistence is active, push Remnant ODRA object holders to blacklister, so they won't save / reload (This will execute only once)
if (MiseryRemnant && isServer) then {
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
            if (MiseryDebug) then {systemChat format ["[Misery Remnant Compat] GRAD Persistence detected, Adding %1 to blacklist for saving / reloading...", _x]}; 
        };
    } forEach _RemnantODRA;
    };
};

MiseryWBKIMS=FALSE; 
if(isClass(configFile>>"cfgPatches">>"WBK_MeleeMechanics"))then{MiseryWBKIMS=TRUE};

//CBA settings added for IMS:
if (MiseryWBKIMS && hasInterface) then {
[
"MiseryShowWBKIMSHUD", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
"CHECKBOX", // setting type
["WBK IMS HUD", "Enable IMS HUD"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
["Misery","WBK IMS HUD settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
false, // data for this setting: [min, max, default, number of shown trailing decimals]
2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
{
params ["_value"];
MiseryShowWBKIMSHUD = _value;
if !(MiseryShowWBKIMSHUD) then {WBK_ShowHud = false} else {WBK_ShowHud = true}; 
} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
};

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

MiseryFires=[
"MetalBarrel_burning_F",
"Land_Campfire_F",
"Land_FirePlace_F",
"FirePlace_burning_F"
];

MiseryWaterSources=[
"well",
"watertank",
"watercooler",
"barrelwater",
"waterbarrel",
"stallwater",
"waterpump",
"waterfountain",
"pumpa"//CHR redux /CUP
];

MiseryFuelSources=[
"fuel_source",
"fuel"
];

//Repair zone:
if (isNil "MiseryinVehiclerepairarea") then {MiseryinVehiclerepairarea = false}; 

//Resupply zone:
if (isNil "MiseryinVehiclerearmarea") then {MiseryinVehiclerearmarea = false}; 

//Refueling zone:
if (isNil "MiseryinRefuelzonearea") then {MiseryinRefuelzonearea = false}; 

//Medical zone:
if (isNil "MiseryinMedzonearea") then {MiseryinMedzonearea = false}; 

if ((count(entities"Misery_MedicalZoneSettings")) > 0) then {
private _module=(entities"Misery_MedicalZoneSettings")select 0;
Mis_Medcurrencytype =_module getvariable "Misery_Medcurrency";
Mis_Medfundstype =_module getvariable "Misery_Medfundstype";
Mis_Medpriceheal =_module getvariable "Misery_Medpriceheal";
Mis_Medpriceradheal=_module getvariable "Misery_Medpriceradheal";
};

//Safezone:
if (isNil "MiseryinSafezonearea") then {MiseryinSafezonearea = false}; 

if (hasInterface) then {
[] execVM MIS_FILESYS(Survival\Zinfect\zinfection); //Zed infection pre-checks in file 
};

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


if (MiseryFearenabled) then {
//Param checks:
if (MiseryFearRvg == 1) then {
PREPROC_FUNCTION(Misery_fnc_NearZed,MIS_FILESYS(Survival\Functions\Fear\Nearzeds))
};
if (MiseryFearRem == 1) then {
PREPROC_FUNCTION(Misery_fnc_NearPhantom,MIS_FILESYS(Survival\Functions\Fear\NearPhantom))
};
if (MiseryFearDSA == 1) then {
PREPROC_FUNCTION(Misery_fnc_NearSpook,MIS_FILESYS(Survival\Functions\Fear\NearSpook))
};

if (hasInterface) then {
//Fear loops:
[] execVM MIS_FILESYS(Survival\Fear\Fear);
[] execVM MIS_FILESYS(Survival\Fear\Fearcycle);
	};
};

//Radiation Exp+:
if (MiseryEnhrads && hasInterface) then {
[] execVM MIS_FILESYS(Survival\Radiation\radiationex);

//Reactivate Geiger if picking up active one:
player addEventHandler ["Take", {
params ["_unit", "_container", "_item"];
if (_item == "Misery_personalgeiger") then {
if (isNil {(_this select 0) getVariable "GeigerON"}) then {
(_this select 0) setVariable ["GeigerON", true,true];
		};
	};
}];
//Kill Detection var for Geiger if you drop it:
player addEventHandler ["Put", {
params ["_unit", "_container", "_item"];
if (_item == "Misery_personalgeiger") then {
if ((_this select 0) getVariable ["GeigerON", true]) then {
		(_this select 0) setVariable ["GeigerON", nil, true];
			};
		};
	}];
};

//Killed EH for clients, kills Geiger active detection var (Runs on Server only)
if (MiseryEnhrads && isServer) then {
addMissionEventHandler ["EntityKilled", {
  params ["_killed", "_killer", "_instigator"];
  if (_killed == player) then {
    if ((_this select 0) getVariable ["GeigerON", true]) then {
		(_this select 0) setVariable ["GeigerON", nil, true];
			}; 
  		};
	}];
};

//Artifact exposure+:
if (MiseryEnhartifacts && hasInterface) then {
[] execVM MIS_FILESYS(Survival\Radiation\Artifactexposure);
};

//gasmasks +:
if (Miserygasmasks && hasInterface) then {
[] execVM MIS_FILESYS(Survival\Radiation\gasmasktimer);
//Misery Gasmask audio overhaul:
[] execVM MIS_FILESYS(Survival\Immersion\Gasmaskaudio);
//};
};

//Phantom artifact drops:
if (MiseryPhantDrops && isServer) then {
[] execVM MIS_FILESYS(Survival\Phantoms\phantomdrops);
};

//Character Immersion:
if (MiseryChrenhan && hasInterface) then{
//Misery Hunger:
[] execVM MIS_FILESYS(Survival\Immersion\hungerimmersion);
//Cold: 
[] execVM MIS_FILESYS(Survival\Immersion\coldimmersion);
//Hot:
[] execVM MIS_FILESYS(Survival\Immersion\feverimmersion);
};

//Inventory sound overhaul:
if (MiseryEnhinv && hasInterface) then {
//Always true if selected
player addEventHandler ["InventoryClosed", {
		playSound3D ["Misery\audio\sounds\inventory\inv_closenew.ogg", player, false, getPosASL player, 4, 1, 10];
}];
player addEventHandler ["InventoryOpened", {
		playSound3D ["Misery\audio\sounds\inventory\inv_opennew.ogg", player, false, getPosASL player, 4, 1, 10];
}];

player addEventHandler ["Take", {
		playSound3D ["Misery\audio\sounds\inventory\pickup.ogg", player, false, getPosASL player, 3, 1, 10];
}];

player addEventHandler ["Put", {
		playSound3D ["Misery\audio\sounds\inventory\drop5.ogg", player, false, getPosASL player, 3, 1, 10];
}];
};

//Loot
if (MiseryLootEnabled) then {
[] execVM MIS_FILESYS(Modules\Loot\Start);
};

//Audio
if (MiseryEnhamb && isServer) then {
[] execVM MIS_FILESYS(Survival\Audio loops\Amb_Soundscape);
};

if (count Misery_AmbientMusic_Listed_audio > 0 && isServer) then {
[] call Misery_fnc_playMusic_Random; //First Track play
[] execVM MIS_FILESYS(Survival\Audio loops\Amb_Music); //Begin loop
};

//Traders
if (MiseryDynamicMarketsActive && isServer) then {
[] execVM MIS_FILESYS(Survival\Traders\TrackTraders);
};

//Ambient Wildlife
if (MiseryAmbientWildlife && isServer) then {
[] execVM MIS_FILESYS(Modules\AmbientAnimals);
};

//Forge Audio loops:
if (MiseryEnhForge && isServer) then {
[] execVM MIS_FILESYS(Survival\Audio loops\forgeaudio);
};

if (((count(entities"Misery_Psyfieldcreate")) > 0) && hasInterface) then {
[] execVM MIS_FILESYS(Modules\Psyfield\Psyfieldinit);
}; 

if (((count(entities"Misery_RadZonecreate")) > 0) && hasInterface) then {
[] execVM MIS_FILESYS(Modules\RadZone\RadZoneinit);
}; 

if (MiseryPDAEMSAL == 1 && hasInterface) then {
[] execVM MIS_FILESYS(Modules\PDA\alerts\Emission);
};

if (MiseryRFEMFacts && hasInterface) then {
if (MiseryDSA && hasInterface) then {
private _gvars = ["dsaSpookBases", "dsaDevMutants", "dsaWebknightCreatures"];
{
waitUntil {!isNil _x}; // Check Gvar arrays every second
} forEach _gvars;
[] execVM MIS_FILESYS(Survival\RFdetector\RFsyncLoop);
}else{
[] execVM MIS_FILESYS(Survival\RFdetector\RFsyncLoop);    
    };
};

// if (((count (entities"Misery_RadioSettings")) > 0) && hasInterface) then {
// [] execVM MIS_FILESYS(Survival\Radio\RadiosyncLoop);
// };

//Auto Detector changes after player killed: 
if (MiseryRFEMFacts && isServer) then {
addMissionEventHandler ["EntityKilled", {
  params ["_killed", "_killer", "_instigator"];
  if (_killed == player) then {
    if ((_this select 0) getVariable ["Misery_RFEMFDet", true]) then {
		(_this select 0) setVariable ["Misery_RFEMFDet", false,true];
			}; 
  		};
	}];
};

//Kill Audio loop when dropping active RF detector:
if (MiseryRFEMFacts && hasInterface) then {
player addEventHandler ["Put", {
params ["_unit", "_container", "_item"];
if (_item == "Misery_RFHighrangeON") then {
if ((_this select 0) getVariable ["Misery_RFEMFDet", true]) then {
	(_this select 0) setVariable ["Misery_RFEMFDet", false,true];
			}; 
		};
	}];
};

//Headlamp object blacklister (auto) for GRAD persistence:
if (isServer) then {
if (!isNil "grad_persistence_blacklist") then {
    if ((grad_persistence_blacklist find (toLower "#lightpoint") == -1) && (grad_persistence_blacklist find (toUpper "#lightpoint") == -1)) then {
        ["#lightpoint"] call grad_persistence_fnc_blacklistClasses;
        if (MiseryDebug) then {systemChat "[Misery Headlamp] GRAD Persistence detected, Adding light object class to blacklist for saving / reloading..."};
    	};
	};
};

// Auto headlamp termination after player killed: 
if (isServer) then {
    addMissionEventHandler ["EntityKilled", {
        params ["_killed", "_killer", "_instigator"];
        if (_killed == player) then {
            if (!isNil {_killed getVariable "Misery_Headlamp"}) then {
                private _headlamp = _killed getVariable "Misery_Headlamp";
                deleteVehicle _headlamp; // Delete the light
                _killed setVariable ["Misery_Headlamp", nil, true];
            };
        };
    }];
};

// Terminate lightsource when dropping active headlamp:
if (hasInterface) then {
    player addEventHandler ["Put", {
        params ["_unit", "_container", "_item"];
        if (_item == "Misery_HeadlampON") then {
            if (!isNil {_unit getVariable "Misery_Headlamp"}) then {
                private _headlamp = _unit getVariable "Misery_Headlamp";
                deleteVehicle _headlamp; // Delete the light
                _unit setVariable ["Misery_Headlamp", nil, true];
            };
        };
    }];
};

// Reactivate lightsource when picking up active headlamp:
if (hasInterface) then {
    player addEventHandler ["Take", {
        params ["_unit", "_container", "_item"];
        if (_item == "Misery_HeadlampON") then {
            // If the player doesn't already have an active headlamp...
            if (isNil {_unit getVariable "Misery_Headlamp"}) then {
                // Create the light and attach it to the player.
                private _headlamp = "#lightpoint" createVehicle position _unit;
                _headlamp setLightBrightness 0.15; // Set brightness
                _headlamp setLightColor [1, 1, 1]; // Set color to white
                _headlamp setLightAmbient [1, 1, 1]; // Set ambient light color to white
                _headlamp setLightAttenuation [0.5, 0, 0, 1]; // Set attenuation

                _headlamp attachTo [_unit, [0,0,0], "pilot"];
                _headlamp setDir (direction _unit);

                // Store the headlamp in the player's namespace so we can access it later.
                _unit setVariable ["Misery_Headlamp", _headlamp, true];
            };
        };
    }];
};

//Artifact Light emission handling:
if (hasInterface) then {

private ["_light"];

player addEventHandler ["Take", {
    params ["_unit", "_container", "_item"];
    if (_item in MIS_Artifact) then {
        _light = _container getVariable "Artifact_LightEmission";
        if (!isNil "_light") then {
            deleteVehicle _light;
        };
    };
}];

player addEventHandler ["Put", {
        params ["_unit", "_container", "_item"];
        if (_item in MIS_Artifact) then {
            if (_container isKindOf "GroundWeaponHolder") then {
            _light = "#lightpoint" createVehicle getPos _container;
            _light setLightBrightness 0.1; 
            _light setLightColor [random 1, random 1, random 1]; 
            _light lightAttachObject [_container, [0,0,0]]; 
            _container setVariable ["Artifact_LightEmission", _light]; 
            }; //Only build light source if _container is the ground (vehicles conflict with other systems...)
        };
    }];
};

// //WBK IMS Handle for Dash / sprint w/ no stamina (overrides to enforce stamina depletion)
if (MiseryWBKIMS && hasInterface) then {
[] execVM MIS_FILESYS(Survival\Immersion\IMSDash);
};

//Auto Radio changes after player killed: 
// if (((count (entities"Misery_RadioSettings")) > 0) && isServer) then {
// addMissionEventHandler ["EntityKilled", {
//   params ["_killed", "_killer", "_instigator"];
//   if (_killed == player) then {
//     if ((_this select 0) getVariable ["Misery_HHRadio", true]) then {
// 		(_this select 0) setVariable ["Misery_HHRadio", false,true];
// 			}; 
//   		};
// 	}];
// };

// //Kill Audio loop when dropping active Radio
// if (((count (entities"Misery_RadioSettings")) > 0) && hasInterface) then {
// player addEventHandler ["Put", {
// params ["_unit", "_container", "_item"];
// if (_item == "Misery_PortableradioON") then {
// if ((_this select 0) getVariable ["Misery_HHRadio", true]) then {
// 	(_this select 0) setVariable ["Misery_HHRadio", false,true];
// 			}; 
// 		};
// 	}];
// };

//Module startup wait check:
MiseryReady=TRUE;
publicVariable"MiseryReady";

MiserySurvival=TRUE;
player setVariable ["MiseryThirst",MIS_THIRST];
player setVariable ["MiseryHunger",MIS_HUNGER];
player setVariable ["MiserySleepiness",MIS_SLEEP];
MiserySleepinessIncrement = 0;
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
private _rads = player getVariable ["MiseryRadiation", 0];
player setVariable ["MiseryPoison",MIS_POISON]; 
player setVariable ["MiseryInfection",MIS_INFECTION]; 
player setVariable ["MiseryFear",MIS_FEAR];
player setVariable ["MiseryExposure",MIS_EXPOSURE]; 
player setVariable ["MiseryPlayerTemp", (call Misery_fnc_Temperature) select 0];
player setVariable ["MiseryBreathFogSim", nil];
player setVariable ["MiseryBreath", false];

MiserySeaTemp = 0; 

// Autogenerate savefile if blank:
if (MiserySurvivalSaveName == "") then{
MiserySurvivalSaveName=format["MiseryPlayerSave_%1%2%3",missionName,worldName,name player];
}else{
MiserySurvivalSaveName=format["MiseryPlayerSave_%1",MiserySurvivalSaveName]
};

[] call Misery_fnc_DefineSurvivalItems;

if (MiseryDefineItemsScript != "") then {
	MiserySurvivalItemEffects=[];
	MiserySurvivalItems=[];
[] execVM MiseryDefineItemsScript;
};

if (MiserySurvivalDebugacts && hasInterface) then {
[] execVM MIS_FILESYS(Survival\Debug\AddDebug);
};

if (MiseryManualPData == 1 && MiserySurvivalSaveMode == 2) then {
	MiseryActions pushback [localize "STR_MISERY_PLAYERDATA", localize "STR_MISERY_PLAYERDATA"];
};

//Persistency:
//Persistency handle:
if (MiserySurvivalPersistence == 1) then {
[[], MIS_FILESYS(Survival\Persistency\Persistencehandle)] remoteExec ["execVM", 0, true];
};
//Persistency keyhandle press:
if (MiserySurvivalPersistence == 2) then {
if (hasInterface) then {
[] execVM MIS_FILESYS(Survival\Persistency\Keyhandle);
};
[[], MIS_FILESYS(Survival\Persistency\Persistencehandle)] remoteExec ["execVM", 0, true];
};

if !(MiserySurvivalKillhandleScript=="") then {
[[], MIS_FILESYS(Survival\Persistency\Killhandle)] remoteExec ["execVM", 0, true];
};

// //Persistency reloader:
if (MiserySurvivalSaveMode == 2) then { 
	private _saveArray=[];
	if!(isNil{profileNamespace getVariable MiserySurvivalSaveName})then{
		_saveArray=profileNamespace getVariable MiserySurvivalSaveName;
		if((count _saveArray)<1)exitWith{systemChat"New Misery Character";
		};
		[player] call Misery_fnc_MiseryDeserializeplayer;
		MiseryNewCharacter=FALSE;
	}else{
		systemChat"New Misery Character"; 
	};
	enableSaving [false, false]; //Disable saving options + Save & exit etc... 
};

if (MiserySurvivalSaveMode == 1) then {
	if (MiserySurvivalHardCoreSaveMode == 1) then {
//titleText ["Hardcore player saving ENABLED... You can now ONLY save near campfires.", "PLAIN DOWN"];

enableSaving [false,false]; //Disables saving / autosaving

player addAction
[
    "Save Character",
    {
        enableSaving [true,true];
        sleep 1;
        saveGame;
        titleText ["Progress saved.", "PLAIN DOWN"];
        sleep 1;
        enableSaving [false,false];
    },
    nil,
    1.5,
    true,
    true,
    "",
    "[player] call Misery_fnc_NearFire",//"inflamed cursorTarget",
    5,
    false,
    "",
    ""
];	
	}else{
    enableSaving TRUE;
	};
};

MiserySurvivalShowStatus=TRUE; 

if (MiseryTemperature == 1 && hasInterface) then { 
MiseryActions pushBack [localize "STR_MISERY_CheckClothing", localize "STR_MISERY_CheckClothing"];
[player] call Misery_fnc_EffectiveTemperature;

//CBA settings added for Misery BreathFog simulation (optional effect):
[
"MiseryBFEffect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
"CHECKBOX", // setting type
["Misery BreathFog simulation", "Enables BreathFog simulation, even though a local effect, lower end PC's might lose a couple FPS when running this..."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
["Misery","Effects & Performance settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
true, // data for this setting: [min, max, default, number of shown trailing decimals]
2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
{
params ["_value"];
MiseryBFEffect = _value;
if !(MiseryBFEffect) then {MiseryBreathFogAllowed = false} else {MiseryBreathFogAllowed = true}; 
} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
};

if (MiseryWeightcheck) then {
MiseryActions pushBack[localize "STR_MISERY_CheckGearweight", localize "STR_MISERY_CheckGearweight"];
};

//respawn handle for stats (Singleplayer) - incase respawns exist: 
if !(MiseryMP && MiserySurvivalSaveMode == 1) then {
player addEventHandler ["Respawn",{ 
params ["_unit", "_corpse"];
_MiseryDebuffs = [];
_MiseryCraftingKnowledge = [];

    {
        _var = (_this select 0) getVariable [_x select 0, nil];
        if (!isNil "_var") then {
            (_this select 0) setVariable [_x select 0, _x select 1];
        };
    } forEach [
		["hunger", 100],
    	["thirst", 100],
        ["MiseryThirst", MIS_THIRST],
        ["MiseryHunger", MIS_HUNGER],
        ["MiserySleepiness", MIS_SLEEP],
        ["MiseryPoison", MIS_POISON],
        ["MiseryInfection", MIS_INFECTION],
        ["MiseryExposure", MIS_EXPOSURE],
        ["MiseryFear", MIS_FEAR],
		["Zinfectionlogged", nil],
		["Turbidwaterlogged", nil],
		["Rawmeatlogged", nil],
        ["MiseryDebuffs", _MiseryDebuffs],
        ["Misery_Crafting_DataSet", _MiseryCraftingKnowledge],
        ["MiseryCurrency", 0],
        ["MiseryCurrency_Banked", 0],
        ["MiserySleeppillstaken", 0],
        ["Misery_IsSleeping", false],
        ["Misery_FearSleep", false],
        ["MiseryBreathFogSim", nil],
        ["MiseryBreath", false]
    ];
	}];
};

if !(MiseryMP && hasInterface) then {
[player] execVM MIS_FILESYS(Survival\Sleep\setSleepAction);
PREPROC_FUNCTION(Misery_fnc_HourSelected,MIS_FILESYS(Survival\Functions\Sleep\HourSelected));
};

if !(MiseryMP) then {
player setVariable ["MiserySleeppillstaken", 0];
player setVariable ["Misery_IsSleeping", false];
player setVariable ["Misery_FearSleep", false];
};

//MP "Tired" Debuff removal:
if(MiseryMP)then{MiserySleepinessIncrement=0};

_MDebuffs = player getVariable "MiseryDebuffs";
if (MiseryMP && {_MDebuffs find "TIRED" != -1}) then {_MDebuffs deleteAt (_MDebuffs find "TIRED"); player setVariable ["MiseryDebuffs", _MDebuffs];};

//Reload checks for sickness:
//Zedinfection:
if !(isNil {player getVariable "Zinfectionlogged"}) then {

player setVariable ["Zinfectionlogged", nil]; 

private _MDebuffs = player getVariable "MiseryDebuffs";

player setVariable ["MiseryInfection", (random 10)]; //add random infection status up to value of 10
_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs]; //Push parasites to player
};

//Turbidwater:
if !(isNil {player getVariable "Turbidwaterlogged"}) then {

player setVariable ["Turbidwaterlogged", nil];

private _MDebuffs = player getVariable "MiseryDebuffs";
_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];
};

//Rawmeat:
if !(isNil {player getVariable "Rawmeatlogged"}) then {

player setVariable ["Rawmeatlogged", nil];

private _MDebuffs = player getVariable "MiseryDebuffs";
_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];
};

MiseryClientReady=TRUE;
publicVariable"MiseryClientReady";

//Client execute survival loop
if (hasInterface) then {[] execVM MIS_FILESYS(Survival\Survival_loop)};

if (hasInterface) then {
[] execVM MIS_FILESYS(Inventory\Inventoryhandle);
};

//------------------------------------------------------------------- <<--//End of start file 

