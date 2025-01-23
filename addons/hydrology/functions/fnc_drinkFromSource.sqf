#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Hydrology Drink from source processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_hydrology_fnc_drinkFromSource;
 *
 * Public: No
*/

private _dialog = findDisplay 982380;

private _FillB = _dialog displayCtrl 1600;
private _DrinkFSB = _dialog displayCtrl 1601;
private _ExitB = _dialog displayCtrl 1602;

    if (alive player) then {

        _FillB ctrlShow false;
        _DrinkFSB ctrlShow false;
        _ExitB ctrlShow false;

        if (currentWeapon player isNotEqualTo "") then {
        player action["SWITCHWEAPON",player,player,-1];
        };

        player playAction "Gear";

        player setVariable [QCLASS(isDrinking), true];

    _FillInterrupt = (findDisplay 982380) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(isDrinking),false];
                [parseText "<t font='PuristaMedium' size='1'>Drinking interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
        };
}];

private _text = "Drinking From Source...";
private _displayedText = "";
private _delay = 8 / count _text;

for "_i" from 0 to (count _text - 1) do {
    if ((player getVariable QCLASS(isDrinking)) isEqualTo false) exitWith {};
    _displayedText = _displayedText + (_text select [_i, 1]);
    ctrlSetText [1001, _displayedText];
    sleep _delay;
};

if ((player getVariable QCLASS(isDrinking)) isEqualTo true) then {

private _MThirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];

playSound3D [QPATHTOEF(audio,sounds\items\drink.ogg), player, false, getPosASL player, 4, 1, 10];

if ((random 100) > EGVAR(survival,turbidWaterChance)) exitWith {

player setVariable [QEGVAR(survival,thirst), (_MThirst + 10)];
_SuccessText_NoSickness = "You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst.";
player setVariable ["radiation", (player getVariable ["radiation",0]) + random 150, true];

ctrlSetText [1001, _SuccessText_NoSickness];

    _FillB ctrlShow true;
    _DrinkFSB ctrlShow true;
    _ExitB ctrlShow true;

            player setVariable [QCLASS(isDrinking), nil]; //terminate crafting flag
            (findDisplay 982380) displayRemoveEventHandler ["KeyDown", _FillInterrupt]; //Remove Display EH
};

player setVariable [QEGVAR(survival,thirst), (_MThirst + 10)];
_SuccessText_Sickness = "You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst.";
player setVariable ["radiation", (player getVariable ["radiation",0]) + random 150, true];
player setVariable [QCLASS(turbidWaterLogged), true];
_time = time + 180;
[_time] spawn {
    private ["_TimeA"];
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};
    if (alive player) then {
        player setVariable [QCLASS(turbidWaterLogged), nil];

        private _ailments = player getVariable QCLASS(ailments);
        _ailments pushBackUnique "PARASITES"; player setVariable [QCLASS(ailments), _ailments]; //<< sick from bad water
        };
    };

    ctrlSetText [1001, _SuccessText_Sickness];

    _FillB ctrlShow true;
    _DrinkFSB ctrlShow true;
    _ExitB ctrlShow true;

            player setVariable [QCLASS(isDrinking), nil]; //terminate crafting flag
            (findDisplay 982380) displayRemoveEventHandler ["KeyDown", _FillInterrupt]; //Remove Display EH
    };
};

