#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caffetin tablets usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_caffetinTablets;
 *
*/

private _MInfection = player getVariable [QCLASS(infection), MACRO_PLAYER_DEFAULTS_LOW];
private _MExposure = player getVariable [QCLASS(exposure), MACRO_PLAYER_DEFAULTS_LOW];
private _ailments = player getVariable QCLASS(ailments);

if (!hasInterface) exitWith {};

 if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if ((_MInfection > 1) || (_ailments find "PARASITES" isNotEqualTo -1)) then {

    titleText ["You take some Caffetin tablets...", "PLAIN DOWN"];
    playSound3D [QPATHTOEF(audio,sounds\inventory\Items\CrinklingPlastic.ogg), player, false, getPosASL player, 4, 1, 10];

    player removeItem QCLASS(caffetin);

     if (EGVAR(common,ace)) then {
    [player, QCLASS(caffetin), 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;
    };

  sleep 60;

  player setVariable [QCLASS(exposure), (_MExposure - 25)];

    if (_MExposure > 0) then {player setVariable [QCLASS(exposure), MACRO_PLAYER_DEFAULTS_LOW]};

}else{
//Nothing
};
