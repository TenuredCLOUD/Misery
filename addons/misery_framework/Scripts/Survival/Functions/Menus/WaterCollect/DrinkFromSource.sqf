#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

/*
Misery WaterCollection Drink from source processor
Takes inputs from GUI and processes recipe (if it exists)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"

private _dialog = findDisplay 982380;

private _FillB = _dialog displayCtrl 1600;
private _DrinkFSB = _dialog displayCtrl 1601;
private _ExitB = _dialog displayCtrl 1602;

    if (alive player) then {

        _FillB ctrlShow false;
        _DrinkFSB ctrlShow false;
        _ExitB ctrlShow false;

        if !((currentWeapon player)=="") then {
	    player action["SWITCHWEAPON",player,player,-1];
	    };

	    player playAction "Gear";

        player setVariable ["Misery_ISDrinking", true];

    _FillInterrupt = (findDisplay 982380) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable ["Misery_ISDrinking",false]; 
                [parseText "<t font='PuristaMedium' size='1'>Drinking interrupted...</t>", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;    
        };
}];

private _text = "Drinking From Source...";
private _displayedText = "";
private _delay = 8 / count _text;

for "_i" from 0 to (count _text - 1) do {
    if ((player getVariable "Misery_ISDrinking") isEqualTo false) exitWith {}; 
    _displayedText = _displayedText + (_text select [_i, 1]);
    ctrlSetText [1001, _displayedText];
    sleep _delay; 
};

if ((player getVariable "Misery_ISDrinking") isEqualTo true) then {
        
private _module=(entities"Misery_Survival")select 0;
Miseryturbidwaterchance=_module getvariable "Misery_Waterturbidchance"; //Dirty water causes disease chance

private _MThirst = player getVariable ["MiseryThirst", MIS_THIRST];

playSound3D ["STALKERsounds\sounds\character\drinkwater_gulp.ogg", player, false, getPosASL player, 4, 1, 10];

if((random 100) > Miseryturbidwaterchance) exitWith {

player setVariable ["MiseryThirst", (_MThirst + 10)];
_SuccessText_NoSickness = "You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst.";
player setVariable ["radiation", (player getvariable ["radiation",0]) + random 150, true];

ctrlSetText [1001, _SuccessText_NoSickness];    
        
    _FillB ctrlShow true;
    _DrinkFSB ctrlShow true;
    _ExitB ctrlShow true;

            player setVariable ["Misery_ISDrinking", nil]; //terminate crafting flag
            (findDisplay 982380) displayRemoveEventHandler ["KeyDown", _FillInterrupt]; //Remove Display EH 
};

player setVariable ["MiseryThirst", (_MThirst + 10)];
_SuccessText_Sickness = "You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst.";
player setVariable ["radiation", (player getvariable ["radiation",0]) + random 150, true];
player setVariable ["Turbidwaterlogged", true];
_time = time + 180;
[_time] spawn {
	private ["_TimeA"];
	_TimeA=_this select 0;
	waitUntil {(!alive player) or (time > _TimeA)};
	if (alive player) then {
		player setVariable ["Turbidwaterlogged", nil];

		private _MDebuffs = player getVariable "MiseryDebuffs";
    	_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs]; //<< sick from bad water
		};
	};

    ctrlSetText [1001, _SuccessText_Sickness];    
        
    _FillB ctrlShow true;
    _DrinkFSB ctrlShow true;
    _ExitB ctrlShow true;

            player setVariable ["Misery_ISDrinking", nil]; //terminate crafting flag
            (findDisplay 982380) displayRemoveEventHandler ["KeyDown", _FillInterrupt]; //Remove Display EH 
    };
};

