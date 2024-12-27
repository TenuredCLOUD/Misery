#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Charcoal tabs usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_charcoalTablets;
 *
*/

private _MPoison = player getVariable [QCLASS(toxicity), MACRO_PLAYER_TOXICITY];

if (!hasInterface) exitWith {};

 if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

  if (alive player) then {

    playSound3D [QPATHTOEF(audio,sounds\inventory\Items\CrinklingPlastic.ogg), player, false, getPosASL player, 4, 1, 10];

  player removeItem "Misery_charcoaltabs";
  titleText ["You take some Charcoal tablets...", "PLAIN DOWN"];

  sleep 60;

if (_MPoison > 0) then {
    player setVariable [QCLASS(toxicity), MACRO_PLAYER_TOXICITY];
};

};
