#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Sick
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_sick","_MPlayertemp","_MExposure","_MThirst","_MDebuffs","_sickcalc1","_Miserytempsickcalc1","_sickcalc2","_Miserytempsickcalc2"];

_sick = FALSE;
_MPlayertemp = player getVariable "MiseryPlayerTemp";
_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
_MThirst = player getVariable ["MiseryThirst", MIS_THIRST];
_MDebuffs = player getVariable "MiseryDebuffs";

	switch (true) do {

    case ((_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && _MPlayertemp > 20): {

		_sickcalc1 = MISERY_SICKEXPOSURE(_MPlayertemp); //- this value scales   
 
		player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickcalc1)toFixed 2))];

		_sick = TRUE;

	//Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
	if (MiseryTemperaturedeficiency == 1) then {

	_Miserytempsickcalc1 = MISERY_SICKEXPOSURE(_MPlayertemp);

	player setVariable ["MiseryThirst", (_MThirst - parseNumber ((_Miserytempsickcalc1)toFixed 2))];

	};
};

	case ((_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && _MPlayertemp < 20): {

		_sickcalc2 = MISERY_COLDEXPOSURE(_MPlayertemp); //- this value scales   
 
		player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickcalc2)toFixed 2))];

		_sick = TRUE;

	//Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
	if (MiseryTemperaturedeficiency == 1) then {

	_Miserytempsickcalc2 = MISERY_COLDEXPOSURE(_MPlayertemp);

	player setVariable ["MiseryThirst", (_MThirst - parseNumber ((_Miserytempsickcalc2)toFixed 2))];

	};
};

 case ((_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && _MPlayertemp == 20): {
        
		_sickcalc3 = MISERY_SICKEXPOSURE(_MPlayertemp); //- this value scales   
 
		player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickcalc3)toFixed 2))];

		_sick = TRUE;

	//Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
	if (MiseryTemperaturedeficiency == 1) then {

	_Miserytempsickcalc3 = MISERY_SICKEXPOSURE(_MPlayertemp);

	player setVariable ["MiseryThirst", (_MThirst - parseNumber ((_Miserytempsickcalc3)toFixed 2))];

		};
    };
};

	_sick