#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Updates the image displayed in the GUI
 *
 * Arguments:
 * 0: Display <NUMBER>
 * 1: Class Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_updateImage
 */

params ["_display", "_className"];

private _imageCtrl = _display displayCtrl 1200;

if (isNull _imageCtrl) exitWith {};

_imageCtrl ctrlSetText "";

if (_className isNotEqualTo "") then {
    private _objectImage = getText (configFile >> "CfgVehicles" >> _className >> "editorPreview");
    _imageCtrl ctrlSetText _objectImage;
};
