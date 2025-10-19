#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Processes place button usage from furniture GUI & passes selection data
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_placeFromMenu
 *
*/

private _noteBox = findDisplay 982389 displayCtrl 1001;

private _className = player getVariable [QGVAR(selectedFurniture), ""];

if (_className isEqualTo "") exitWith {
    _noteBox ctrlSetText "No placement selected...";
};

(findDisplay 982389) closeDisplay 2;

[_className] call FUNC(place);
