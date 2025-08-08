#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles fire reignition, with option to upgrade small fires to big fires using firewood
 *
 * Arguments:
 * 0: Nearby Fire <OBJECT>
 * 1: Fuel Source <STRING>
 * 2: Fuel Type <STRING>
 * 3: Fire Index <NUMBER>
 * 4: Note Box <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_reignite
 */

params ["_nearbyFire", "_fuel", "_fuelType", "_fireIndex", "_noteBox"];

if (isNull _nearbyFire) exitWith {
    _noteBox ctrlSetText "No nearby fire found.";
    [QUOTE(COMPONENT_BEAUTIFIED), "Reignition failed: No nearby fire."] call EFUNC(common,debugMessage);
};

private _isUpgrade = _fuelType isEqualTo "small" && _fuel isEqualTo QCLASS(firewood);
private _isDowngrade = _fuelType isEqualTo "big" && _fuel isEqualTo QCLASS(woodensticks);
private _isBarrelFire = _fuelType isEqualTo "barrel";

switch (true) do {
    case (_isUpgrade): {
        private _pos = getPosATL _nearbyFire;
        private _dir = getDir _nearbyFire;
        deleteVehicle _nearbyFire;

        if (_fireIndex >= 0 && _fireIndex < count GVAR(activeFires)) then {
            GVAR(activeFires) deleteAt _fireIndex;
        };

        private _fireClass = "Campfire_burning_F";
        private _object = createVehicle [_fireClass, _pos, [], 0, "CAN_COLLIDE"];
        _pos = [_pos select 0, _pos select 1, ((getPosATL player) select 2) + 1];
        _object setPos _pos;
        _pos = (_object call EFUNC(common,surfacePos)) select 0;
        _object setPosASL _pos;
        _object setDir _dir;

        [player, _fuel] call CBA_fnc_removeItem;

        private _burnTimeLeft = 5400;
        GVAR(activeFires) pushBack [_object, "big", _burnTimeLeft];
        publicVariable QGVAR(activeFires);

        _noteBox ctrlSetText "Fire reignited and upgraded...";
        [QUOTE(COMPONENT_BEAUTIFIED), format ["Upgraded small fire at %1 to big fire with %2(s) burn time.", getPosATL _object, _burnTimeLeft]] call EFUNC(common,debugMessage);
    };
    case (_isDowngrade): {
        private _pos = getPosATL _nearbyFire;
        private _dir = getDir _nearbyFire;
        deleteVehicle _nearbyFire;

        if (_fireIndex >= 0 && _fireIndex < count GVAR(activeFires)) then {
            GVAR(activeFires) deleteAt _fireIndex;
        };

        private _fireClass = "FirePlace_burning_F";
        private _object = createVehicle [_fireClass, _pos, [], 0, "CAN_COLLIDE"];
        _pos = [_pos select 0, _pos select 1, ((getPosATL player) select 2) + 1];
        _object setPos _pos;
        _pos = (_object call EFUNC(common,surfacePos)) select 0;
        _object setPosASL _pos;
        _object setDir _dir;

        [player, _fuel] call CBA_fnc_removeItem;

        private _burnTimeLeft = 2700;
        GVAR(activeFires) pushBack [_object, "small", _burnTimeLeft];
        publicVariable QGVAR(activeFires);

        _noteBox ctrlSetText "Fire reignited and downgraded...";
        [QUOTE(COMPONENT_BEAUTIFIED), format ["Downgraded big fire at %1 to small fire with %2(s) burn time.", getPosATL _object, _burnTimeLeft]] call EFUNC(common,debugMessage);
    };
    case (_isBarrelFire): {
        _nearbyFire inflame true;
        private _burnTimeLeft = if (_fuel isEqualTo "") then {30} else {[2700, 5400] select ([QCLASS(woodensticks), QCLASS(firewood)] find _fuel)};
        if (_fuel isNotEqualTo "") then {
            [player, _fuel] call CBA_fnc_removeItem;
        };
        if (_fireIndex >= 0 && _fireIndex < count GVAR(activeFires)) then {
            (GVAR(activeFires) select _fireIndex) set [2, _burnTimeLeft];
        } else {
        GVAR(activeFires) pushBack [_nearbyFire, _fuelType, _burnTimeLeft];
    };
    publicVariable QGVAR(activeFires);

    _noteBox ctrlSetText "Barrel fire reignited successfully...";
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Reignited barrel fire at %1 with %2(s) burn time.", getPosATL _nearbyFire, _burnTimeLeft]] call EFUNC(common,debugMessage);
    };
    default {
        _nearbyFire inflame true;
        private _burnTimeLeft = if (_fuel isEqualTo "") then {30} else {[2700, 5400] select (["small", "big"] find _fuelType)};
        if (_fuel isNotEqualTo "") then {
            [player, _fuel] call CBA_fnc_removeItem;
        };
        if (_fireIndex >= 0 && _fireIndex < count GVAR(activeFires)) then {
            (GVAR(activeFires) select _fireIndex) set [2, _burnTimeLeft];
        } else {
        GVAR(activeFires) pushBack [_nearbyFire, _fuelType, _burnTimeLeft];
    };
    publicVariable QGVAR(activeFires);

    _noteBox ctrlSetText "Fire reignited successfully...";
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Reignited %1 fire at %2 with %3(s) burn time.", _fuelType, getPosATL _nearbyFire, _burnTimeLeft]] call EFUNC(common,debugMessage);
    };
};
