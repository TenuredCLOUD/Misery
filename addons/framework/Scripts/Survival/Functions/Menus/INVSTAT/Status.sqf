#include "\z\misery\addons\framework\Scripts\Misery_PreParser.hpp"

/*
Misery Status UI for inventory framework 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

disableSerialization;

[{!isNull findDisplay 982377},
{
	[{
		params ["_args", "_handle"];
		if ( isNull findDisplay 982377 || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

	private ["_display","_TempText","_TempVal","_GasText","_GasVal","_cartridgecalc","_GascartridgeVal","_GasSuppAir","_FundsVal","_HealthText","_HealthNum","_ValtoBarHealth","_ValtoBarBlood","_BloodtoVal","_HealthtoVal","_HealthNumVal","_HungerNum","_ValtoBarHunger","_HungerNumVal","_ThirstNum","_ValtoBarThirst","_ThirstNumVal","_FatigueNum","_ValtoBarFatigue","_FatigueNumVal","_MHunger","_MThirst","_MInfection","_MPoison","_MSleepiness","_MExposure","_MPlayertemp","_MDebuffs","_Health","_pfatigue","_thirst","_temp","_funds","_tired","_parasites","_poison","_infection"];

	_display = findDisplay 982377; 
	_TempText = _display displayCtrl 1015;
	_TempVal = _display displayCtrl 1010; 
	_GasText =_display displayCtrl 1016;
	_GasVal =_display displayCtrl 1017; 
	_FundsVal = _display displayCtrl 1009; 
	_HealthText = _display displayCtrl 1008;
	_HealthNum = _display displayCtrl 1011;
	_HungerNum = _display displayCtrl 1012;
	_ThirstNum = _display displayCtrl 1013;
	_FatigueNum = _display displayCtrl 1014;
	_buffsList = _display displayCtrl 1501;
	_ailmentsList = _display displayCtrl 1502;
	_buffsicon = _display displayCtrl 1201;
	_ailmentsicon =_display displayCtrl 1200;
	_CurrMag = _display displayCtrl 1111;
	_CurrMagVal =_display displayCtrl 1112;

	_MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];
	_MThirst = player getVariable ["MiseryThirst", MIS_THIRST];
	_MInfection = player getVariable ["MiseryInfection", MIS_INFECTION];
	_MPoison = player getVariable ["MiseryPoison", MIS_POISON];
	_MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];
	_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
	_MPlayertemp = player getVariable ["MiseryPlayerTemp", 0];
	_MDebuffs = player getVariable "MiseryDebuffs";

	_pfatigue = (getfatigue player) * 100; //Fatigue calc 
	_convpfatigue = round (100 - _pfatigue); //conversion to 100 - 0 

	_cartridgecalc = player getVariable ["Miserycartridge", 100];

	_buffs = player getVariable ["buffs", []];
	_ailments = player getVariable ["ailments", []];

lbClear _buffsList;
lbClear _ailmentsList;

{ 
    private _buffname = _x select 0; 
    private _buffimage = _x select 1; 
    private _buffsindex = _buffsList lbAdd _buffname; 
    _buffsList lbSetData [_buffsindex, _buffname];  
    _buffsList lbSetPicture [_buffsindex, _buffimage];
} forEach _buffs; 

{ 
    private _ailmentname = _x select 0; 
    private _ailmentimage = _x select 1; 
    private _ailmentsindex = _ailmentsList lbAdd _ailmentname; 
    _ailmentsList lbSetData [_ailmentsindex, _ailmentname];  
    _ailmentsList lbSetPicture [_ailmentsindex, _ailmentimage];
} forEach _ailments; 

	if (MiseryACE) then {
	_Health = player getVariable ["ace_medical_bloodVolume", 6]; //ACE blood calc
	_HealthText ctrlSetText "Blood:";
	}else{
	_Health = round ((1 - (damage player)) * 100); //Vanilla Health calc
	_HealthText ctrlSetText "Health:";	
	};

	if !(Miserygasmasks) then {
	_GasText ctrlShow false; 
	_GasVal ctrlShow false;	
	};
	if (Miserygasmasks) then {
	private _GasmaskBuff = _buffs findIf {(_x select 0) isEqualTo "Gas Mask"}; 
	private _SCBABuff = _buffs findIf {(_x select 0) isEqualTo "Supplied Air"}; 
	if ((goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs)) then {
	_GascartridgeVal = format["%1%2",round(_cartridgecalc * 1), "%"];
	_GasVal ctrlSetText _GascartridgeVal;
	["buff","Gas Mask", "Misery\Scripts\Survival\Data\gasmask.paa", "You are wearing a gasmask, it can protect your lungs from harmful contaminants like radioactive particles, as well as toxic gases. You should be mindful of your cartridges..."] call Misery_fnc_AddBuffOrAilment;
	};
	if ((goggles player in antirad_goggles) && (vest player in antirad_vests || backpack player in antirad_packs) || (vest player in antirad_vests || backpack player in antirad_packs)) then {	
	_GasSuppAir = format["%1","∞"];
	_GasVal ctrlSetText _GasSuppAir;
	["buff","Supplied Air", "Misery\Scripts\Survival\Data\SCBA.paa", "You are utilizing an SCBA device which is useful in an IDLH (Immediately Dangerous to Life or health) area. You have the greatest protection gear available for air contaminants."] call Misery_fnc_AddBuffOrAilment;	
	};
	if ((!(goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs)) && (!(goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs) || !(vest player in antirad_vests || backpack player in antirad_packs))) then {
	if (_GasmaskBuff > -1) then {
		["buff","Gas Mask"] call Misery_fnc_RemoveBuffOrAilment;
	};	
	if (_SCBABuff > -1) then {
		["buff","Supplied Air"] call Misery_fnc_RemoveBuffOrAilment;
	};	
		};
			};

	private _currentMagazineDetail = currentMagazineDetail player;
	private _magazine = currentMagazine player; 
	private _cfg = configFile >> "CfgMagazines" >> _magazine;

	if (isClass _cfg) then { 
    private _picPath = getText (_cfg >> "picture"); 
    if (_picPath != "") then { 
        _CurrMag ctrlSetText _picPath; 
    } else { 
        _CurrMag ctrlShow false;
    	}; 
	};

	if (("(" in _currentMagazineDetail > -1) && ("/" in _currentMagazineDetail > -1)) then {
    	private _ammoDetailsString = ((_currentMagazineDetail splitString "(") select 1) splitString "/" select 0; 
    	private _totalAmmoString = ((_currentMagazineDetail splitString "/") select 1) splitString ")" select 0; 
    	private _ammoCount = parseNumber _ammoDetailsString; 
    	private _totalAmmo = parseNumber _totalAmmoString; 
    	_CurrMagVal ctrlSetText format ["(%1/%2)",_ammoCount,_totalAmmo];
	} else {
    	_CurrMagVal ctrlShow false;
	};

	if(MiseryTemperature == 0) then {
	_TempText ctrlShow false; 
	_TempVal ctrlShow false; 
	};
	if(MiseryTemperature == 1 && "Misery_PDA" in magazines player) then {
	_temp = format["%1°C",round (_MPlayertemp),(player call Misery_fnc_ClothingWarmth)select 0];
	_TempVal ctrlSetText _temp;
	};
	if(MiseryTemperature == 1 && !("Misery_PDA" in magazines player)) then {
	_TempVal ctrlSetText "No PDA";	
	};

	_GetFunds = player getVariable "MiseryCurrency";

	if (isNil "MiseryCurrencySymbol") then {MiseryCurrencySymbol = "$"};

	_FundsDisplay = format ["%1 %2",MiseryCurrencySymbol,[_GetFunds, 1, 2, true] call CBA_fnc_formatNumber]; //[_GetFunds] call Misery_fnc_formatNumber

	_FundsVal ctrlSetText _FundsDisplay; 
	
	if (!isNil "MiseryinPsyfield") then {
	private _input1 =(_module getvariable "Misery_Psyprotection") call Misery_fnc_ParseArray2; //STRING to ARRAY
	private _psyprot = _input1;
	private _PsyProtected = _ailments findIf {(_x select 0) isEqualTo "Psy Emissions (Protected)"}; 
	private _PsyNoProtection = _ailments findIf {(_x select 0) isEqualTo "Psy Emissions"}; 
	if (!(headgear player in _psyprot) && MiseryinPsyfield) then {
		["ailment","Psy Emissions", "Misery\Scripts\Survival\data\Psyfield.paa", "You hear a very loud pulsing hum, its vibrations are pounding in your head, you're not sure how much longer you can take it..."] call Misery_fnc_AddBuffOrAilment;
    };
	if ((headgear player in _psyprot) && MiseryinPsyfield) then {
		["ailment","Psy Emissions (Protected)", "Misery\Scripts\Survival\data\Psyfield.paa", "You feel subtle vibrations around your skull, you are uneasy..."] call Misery_fnc_AddBuffOrAilment;
    };
	if (MiseryinPsyfield == false) then {
	if (_PsyNoProtection > -1) then {
		["ailment","Psy Emissions"] call Misery_fnc_RemoveBuffOrAilment;
	};	
	if (_PsyProtected > -1) then {
		["ailment","Psy Emissions (Protected)"] call Misery_fnc_RemoveBuffOrAilment;
	};
		};	
			};

private _tiredAilments = ["Tired", "Mildy Tired", "Very Tired", "Exhausted", "Inhumanely Exhausted"];

if (_MSleepiness >= 15) then { 
    {
        private _ailmentName = _x select 0;
        if (_ailmentName in _tiredAilments) then {
            private _index = _ailments findIf {(_x select 0) isEqualTo _ailmentName};
            if (_index > -1) then {
                ["ailment", str _index] call Misery_fnc_RemoveBuffOrAilment;
            };
        };
    } forEach _ailments;

    private _tirednessIndex = floor((_MSleepiness - 15) / 5);
    if (_tirednessIndex >= count _tiredAilments) then {
        _tirednessIndex = count _tiredAilments - 1;
    };
    private _tirednessAilment = _tiredAilments select _tirednessIndex;
    private _imageNames = ["sleepy", "sleepy1", "sleepy2", "sleepy3", "tired"];
    ["ailment", _tirednessAilment, format ["Misery\Scripts\Survival\data\%1.paa", (_imageNames select _tirednessIndex)], format ["You are %1...", _tirednessAilment]] call Misery_fnc_AddBuffOrAilment;
} else {
    {
        private _ailmentName = _x select 0;
        if (_ailmentName in _tiredAilments) then {
            private _index = _ailments findIf {(_x select 0) isEqualTo _ailmentName};
            if (_index > -1) then {
                ["ailment", str _index] call Misery_fnc_RemoveBuffOrAilment;
            };
        };
    } forEach _ailments;
};

	_parasites = _ailments findIf {(_x select 0) isEqualTo "Parasite Infection"};
	_poison = _ailments findIf {(_x select 0) isEqualTo "Poisoned"};
	_infection = _ailments findIf {(_x select 0) isEqualTo "Bacterial Infection"};

	if(_MDebuffs find "PARASITES" != -1 && MiseryAilments == 1) then {
		["ailment","Parasite Infection", "Misery\Scripts\Survival\data\parasites.paa", "You are infected with Parasites, You feel a gnawing hunger that is unsatiable, as well as unquenchable thirst..."] call Misery_fnc_AddBuffOrAilment;
	}else{
	if (_parasites > -1) then {
		["ailment","Parasite Infection"] call Misery_fnc_RemoveBuffOrAilment;
	};	
		};

	if(_MPoison > 0 && MiseryAilments == 1)then{
	["ailment","Poisoned", "Misery\Scripts\Survival\data\poison.paa", "You are poisoned, you feel a wave of unease wash over you as death lingers..."] call Misery_fnc_AddBuffOrAilment;
	}else{
	if (_poison > -1) then {
		["ailment","Poisoned"] call Misery_fnc_RemoveBuffOrAilment;
	};		
		};

	if(_MInfection > 0 && MiseryAilments == 1)then{
		["ailment","Bacterial Infection", "Misery\Scripts\Survival\data\infection.paa", "You have a Bacterial infection, your breaths are shallow, and feel hot. You can feel your muscles weakening..."] call Misery_fnc_AddBuffOrAilment;
	}else{
	if (_infection > -1) then {
		["ailment","Bacterial Infection"] call Misery_fnc_RemoveBuffOrAilment;
	};		
		};

	private _ColdExposureAilments = ["Chilly", "Cold", "Freezing", "Hypothermia risk", "Hypothermic"];

if (_MExposure <= -1) then { 
    
	private _coldexposureindex = -1;

        if (_MExposure <= -1) then {_coldexposureindex = 0};
        if (_MExposure <= -5) then {_coldexposureindex = 1};
        if (_MExposure <= -10) then {_coldexposureindex = 2};
        if (_MExposure <= -15) then {_coldexposureindex = 3};
		if (_MExposure <= -20) then {_coldexposureindex = 4};

    private _coldexpoAilment = _ColdExposureAilments select _coldexposureindex;
    private _imageNames = ["chilly", "cold", "freezing", "hypo", "hypo2"];
    private _ColdExpoDesclevels = ["You feel chilly...", "You are cold...", "You are freezing...", "You are at risk of hypothermia...", "You are hypothermic..."];
    ["ailment", _coldexpoAilment, format ["Misery\Scripts\Survival\data\%1.paa", (_imageNames select _coldexposureindex)], format ["%1", (_ColdExpoDesclevels select _coldexposureindex)]] call Misery_fnc_AddBuffOrAilment;
};

private _HeatExposureAilments = ["Warm", "Hot", "Fever", "Hyperthermia risk", "Hyperthermic"];

if (_MExposure >= 1) then { 
    
	private _heatexposureindex = -1;

        if (_MExposure >= 1) then {_heatexposureindex = 0};
        if (_MExposure >= 5) then {_heatexposureindex = 1};
        if (_MExposure >= 10) then {_heatexposureindex = 2};
        if (_MExposure >= 15) then {_heatexposureindex = 3};
		if (_MExposure >= 20) then {_heatexposureindex = 4};

    private _heatexpoAilment = _HeatExposureAilments select _heatexposureindex;
    private _imageNames = ["hot", "hot2", "fever", "hyper", "hyper2"];
    private _HeatExpolevels = ["You feel a bit warm...", "You feel hot...", "You have a fever...", "You are at risk of hyperthermia...", "You are hyperthermic..."];
    ["ailment", _heatexpoAilment, format ["Misery\Scripts\Survival\data\%1.paa", (_imageNames select _heatexposureindex)], format ["%1", (_HeatExpolevels select _heatexposureindex)]] call Misery_fnc_AddBuffOrAilment;
};

if (_MExposure == 0) then { 
{
        private _ailmentName = _x select 0;
        if (_ailmentName in (_ColdExposureAilments + _HeatExposureAilments)) then {
            private _index = _ailments findIf {(_x select 0) isEqualTo _ailmentName};
            if (_index > -1) then {
                ["ailment", str _index] call Misery_fnc_RemoveBuffOrAilment;
            };
        };
} forEach _ailments;
};

if (MiseryHUDlayout == 0) then {

if (MiseryACE) then {
_BloodtoVal = round(_Health / 6 * 100);
_ValtoBarBlood = [_BloodtoVal] call Misery_fnc_ValToBar;
_HealthNum ctrlSetText _ValtoBarBlood;
}else{
_HealthtoVal = round((1 - (damage player)) * 100);
_ValtoBarHealth = [_HealthtoVal] call Misery_fnc_ValToBar;
_HealthNum ctrlSetText _ValtoBarHealth;
};

_ValtoBarHunger = [_MHunger] call Misery_fnc_ValToBar;
_HungerNum ctrlSetText _ValtoBarHunger;

_ValtoBarThirst = [_MThirst] call Misery_fnc_ValToBar;
_ThirstNum ctrlSetText _ValtoBarThirst;

_ValtoBarFatigue = [_convpfatigue] call Misery_fnc_ValToBar;
_FatigueNum ctrlSetText _ValtoBarFatigue;

}else{

if (MiseryHUDlayout == 1) then {
if (MiseryACE) then {
_HealthNumVal = format ["%1",round(_Health / 6 * 100)];
_HealthNum ctrlSetText _HealthNumVal;
}else{
_HealthNumVal = format ["%1",round ((1 - (damage player)) * 100)];
_HealthNum ctrlSetText _HealthNumVal;
};

_HungerNumVal = format ["%1",round (_MHunger)];
_HungerNum ctrlSetText _HungerNumVal;

_ThirstNumVal = format ["%1",round (_MThirst)];
_ThirstNum ctrlSetText _ThirstNumVal;

_FatigueNumVal = format ["%1", _convpfatigue];
_FatigueNum ctrlSetText _FatigueNumVal;
};
	};

	if (MiseryTemperature == 1) then {
	_NFireBuff = _buffs findIf {(_x select 0) isEqualTo "Near Fire"};
	_ShelterBuff = _buffs findIf {(_x select 0) isEqualTo "Sheltered"};
	_CoverageBuff = _buffs findIf {(_x select 0) isEqualTo "Under Roof"};
	if ([player] call Misery_fnc_NearFire) then {
	["buff","Near Fire", "Misery\Scripts\Survival\data\nearfire.paa", "When near a fire, you will be warmed from the cold, you can also utilize the fire for cooking, or boiling water to kill off micro-organisms..."] call Misery_fnc_AddBuffOrAilment;
	}else{
	if (_NFireBuff > -1) then {
	["buff","Near Fire"] call Misery_fnc_RemoveBuffOrAilment;
	};
		};

    if ((([player] call Misery_fnc_Isinside) select 0) && (([player] call Misery_fnc_Isinside) select 1)) then {
		["buff","Sheltered", "Misery\Scripts\Survival\data\shelter.paa", "You are sheltered from the weather, while inside you cannot build a fire due to smoke inhalation..."] call Misery_fnc_AddBuffOrAilment;
    }else{
	if (_ShelterBuff > -1) then {
	["buff","Sheltered"] call Misery_fnc_RemoveBuffOrAilment;
	};	
		};
    if ((([player] call Misery_fnc_Isinside) select 0)) then {
		["buff","Under Roof", "Misery\Scripts\Survival\data\roof.paa", "You are under a roof, protected from the rain, a fire can safetly be constructed here..."] call Misery_fnc_AddBuffOrAilment;
    }else{
	if (_CoverageBuff > -1) then {
	["buff","Under Roof"] call Misery_fnc_RemoveBuffOrAilment;	
	};	
		};
			};

	}, 0, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;