#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Hydrology Drink from Source Processor
 * Drink from source action with delayed sickness
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_drinkFromSource;
 *
 * Public: No
*/

private _dialog = findDisplay 982380;
private _fillButton = _dialog displayCtrl 1600;
private _drinkButton = _dialog displayCtrl 1601;
private _exitButton = _dialog displayCtrl 1602;

_fillButton ctrlShow false;
_drinkButton ctrlShow false;
_exitButton ctrlShow false;

if ("ace_field_rations" call EFUNC(common,isModLoaded)) then {
    player switchMove "ace_field_rations_drinkFromSourceLow";
} else {
    player playAction "Gear";
};

playSound3D [QPATHTOEF(audio,sounds\items\drink.ogg), player, false, getPosASL player, 4, 1, 10];

[0.01, "thirst"] call EFUNC(common,addStatusModifier);

[0.015, "radiation"] call EFUNC(common,addStatusModifier);

if ((random 100) <= EGVAR(survival,turbidWaterChance)) then {
    ctrlSetText [1001, "You gulped down foul water. It quenched your thirst, but you feel sick..."];

    [{
        [0.01, "parasites"] call EFUNC(common,addStatusModifier);
    }, [], 180] call CBA_fnc_waitAndExecute;
} else {
    ctrlSetText [1001, "You gulped down foul water... It quenched your thirst."];
};

_fillButton ctrlShow true;
_drinkButton ctrlShow true;
_exitButton ctrlShow true;
