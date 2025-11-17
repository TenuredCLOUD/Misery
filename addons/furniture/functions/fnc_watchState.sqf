#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Watches player lifeState for unconscious or death while placing objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_watchState
 *
*/

[{
    params ["_args", "_handle"];

    private _object = player getVariable [QGVAR(placingObject), objNull];
    private _className = player getVariable [QGVAR(selectedFurniture), ""];
    //private _displayName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    [_className] call EFUNC(common,getObjectData) params ["_displayName"];
    private _isForcedPlacement = player getVariable [QGVAR(isForcedplacement), nil];

    if (GVAR(objectPlacementDone) || GVAR(objectPlacementCancelled)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    // Automatically force player to drop or put object back into inventory if they re-equip weapon
    if ((currentWeapon player isNotEqualTo "")) exitWith {
        if (_isForcedPlacement) then {
            private _posASL = getPosASL _object;
            private _rotation = _object getVariable [QGVAR(rotation), 0];
            private _tooHeavyTip = format ["%1 has been dropped to the ground...", _displayName];
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
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    // Automatically force player to drop or put object back into inventory if dead or unconscious & terminate handles
    if !(lifeState player in ["HEALTHY", "INJURED"]) exitWith {
        if (_isForcedPlacement) then {
            private _posASL = getPosASL _object;
            private _rotation = _object getVariable [QGVAR(rotation), 0];
            private _tooHeavyTip = format ["%1 has been dropped to the ground...", _displayName];
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
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;
