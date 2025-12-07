#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Drop sequence for supply crate
 *
 * Arguments:
 * 0: Drop Zone position <ARRAY>
 * 1: Heli group driver <OBJECT>
 * 2: Helicopter <OBJECT>
 * 3: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_supply_drop_fnc_dropSequence;
 *
*/

params ["_dropZone", "_heliGroup", "_heli", "_crate"];

_heli flyInHeight 100;

[QEGVAR(common,radioBroadcast), [
    groupId _heliGroup,
    "Dropping supply cargo, standby."
]] call CBA_fnc_globalEvent;

[{
    params ["_heliGroup", "_heli", "_crate"];

    _crate allowDamage false;

    _heli setSlingLoad objNull;

    private _smoke = "SmokeShellOrange" createVehicle position _crate;
    private _flare = createVehicle ["F_40mm_red", position _crate, [], 0, "FLY"];

    private _parachute = "steerable_parachute_f" createVehicle position _crate;

    _parachute attachTo [_crate, [0, 0, -1]];

    _flare setVelocity [0, 0, -1];

    if (!isNil "grad_persistence_blacklist") then {
        [_smoke] call grad_persistence_fnc_blacklistObjects;
        [_flare] call grad_persistence_fnc_blacklistObjects;
        [_parachute] call grad_persistence_fnc_blacklistObjects;
    };

    _heliGroup move [0, 0, 0];
    _heli flyInHeight 75;

    GVAR(activeDrops) pushBack _crate;

    [QEGVAR(common,radioBroadcast), [
    groupId _heliGroup,
    "Supply cargo delivered, heading back to HQ."
    ]] call CBA_fnc_globalEvent;

    [{
        params ["_args", "_handle"];
        _args params ["_heli", "_smoke", "_flare"];

        if !(alive _heli) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (_heli distance [0, 0, 0] < 200) exitWith {
            {
                deleteVehicle _x;
            } forEach crew _heli;

            {
                deleteVehicle _x;
            } forEach [_heli, _smoke, _flare];

            _handle call CBA_fnc_removePerFrameHandler;
        };
    }, 1, [_heli, _smoke, _flare]] call CBA_fnc_addPerFrameHandler;
}, [_heliGroup, _heli, _crate], 15] call CBA_fnc_waitAndExecute;

