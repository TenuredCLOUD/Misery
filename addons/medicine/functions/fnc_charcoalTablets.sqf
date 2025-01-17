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

private _MPoison = player getVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_TOXICITY];

if (!hasInterface) exitWith {};

 if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

  if (alive player) then {

    playSound3D [QPATHTOEF(audio,sounds\inventory\Items\CrinklingPlastic.ogg), player, false, getPosASL player, 4, 1, 10];

  player removeItem QCLASS(charcoalTablets);
  titleText ["You take some Charcoal tablets...", "PLAIN DOWN"];

  sleep 60;

if (_MPoison > 0) then {
    player setVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_TOXICITY];
};

};
