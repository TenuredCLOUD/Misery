#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Starts mouse tracking, for scroll wheel and clicking
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Is direct placement <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_trackMouse
 *
*/

GVAR(rotationHandle) = ["MouseZChanged", {
    params ["_control", "_scroll"];

    private _object = player getVariable [QGVAR(placingObject), objNull];
    if (isNull _object) exitWith {};

    private _scrollDir = if (_scroll > 0) then {1} else {-1};
    private _rotation = _object getVariable [QGVAR(rotation), 0];
    private _increment = GVAR(rotationIncrement);
    _rotation = _rotation + (_scrollDir * _increment);
    _object setDir _rotation;
    _object setVariable [QGVAR(rotation), _rotation];
}] call CBA_fnc_addDisplayHandler;

GVAR(clickHandle) = ["MouseButtonDown", {
    params ["", "_button"];

    private _object = player getVariable [QGVAR(placingObject), objNull];
    private _className = player getVariable [QGVAR(selectedFurniture), ""];
    //private _displayName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    [_className] call EFUNC(common,getObjectData) params ["_displayName"];
    private _isForcedPlacement = player getVariable [QGVAR(isForcedplacement), nil];

    // Safety incase no object exists
    if (isNull _object) exitWith {
        player setVariable [QGVAR(placingObject), nil];
        player setVariable [QGVAR(isForcedplacement), nil];
        ["MouseZChanged", GVAR(rotationHandle)] call CBA_fnc_removeDisplayHandler;
        ["MouseButtonDown", GVAR(clickHandle)] call CBA_fnc_removeDisplayHandler;
        GVAR(objectPlacementCancelled) = true;
    };

    if (_button isEqualTo 0) then {
        [format ["Placing... %1", _displayName],
        5,
        {true},
        {
            params ["_args"];
            _args params ["_object", "_displayName", "_className", "_isForcedPlacement"];

            private _posASL = getPosASL _object;
            private _rotation = _object getVariable [QGVAR(rotation), 0];

            [_object, _className, _posASL, _rotation, _displayName] call FUNC(createObject);

            if (!_isForcedPlacement) then {
                private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;
                private _itemMass = [[_className] call EFUNC(common,getObjectMass), getNumber (_furnitureCfg >> "mass")] select (isNumber (_furnitureCfg >> "mass"));
                private _currentMass = player getVariable [QGVAR(furnitureLoad), MACRO_PLAYER_DEFAULTS_LOW];
                private _newMass = _currentMass - _itemMass max 0;
                player setVariable [QGVAR(furnitureLoad), _newMass];
            };

            if (isForcedWalk player) then {
                player forceWalk false;
            };
        },
        {
            ["Cancelled placement...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        },
        [_object, _displayName, _className, _isForcedPlacement]] call CBA_fnc_progressBar;
    };

    if (_button isEqualTo 1) then {
        private _className = player getVariable [QGVAR(selectedFurniture), ""];
        //private _displayName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
        [_className] call EFUNC(common,getObjectData) params ["_displayName"];
        private _posASL = getPosASL _object;
        private _rotation = _object getVariable [QGVAR(rotation), 0];

        if (_isForcedPlacement) then {
            private _tooHeavyTip = format ["%1 is too heavy and has been dropped to the ground...", _displayName];
            [_tooHeavyTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
            [_object, _className, _posASL, _rotation, _displayName] call FUNC(createObject);
        } else {
            deleteVehicle _object;
            player setVariable [QGVAR(placingObject), nil];
            player setVariable [QGVAR(isForcedplacement), nil];
            ["MouseZChanged", GVAR(rotationHandle)] call CBA_fnc_removeDisplayHandler;
            ["MouseButtonDown", GVAR(clickHandle)] call CBA_fnc_removeDisplayHandler;
            GVAR(objectPlacementCancelled) = true;

            private _inventory = player getVariable [QGVAR(furnitureInventory), []];
            _inventory pushBack _className;
            player setVariable [QGVAR(furnitureInventory), _inventory];
        };

        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };
}] call CBA_fnc_addDisplayHandler;
