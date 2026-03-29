#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Air time sequence
 * Preps helicopter & crate
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_supply_drop_fnc_airSequence;
 *
*/

private _players = call EFUNC(common,listPlayers);

if (_players isEqualTo []) exitWith {};

private _dropZone = [getPosATL selectRandom _players, selectRandom GVAR(dropZones)] select (GVAR(dropZones) isNotEqualTo []);

private _heli = createVehicle [selectRandom GVAR(heliTypes), [0, 0, 0], [], 0, "FLY"];
private _heliGroup = createVehicleCrew _heli;
_heli setDir (_heli getDir _dropZone);

_heli enableRopeAttach true;

_heli flyInHeight 75;

private _crate = createVehicle [selectRandom GVAR(crateTypes), position _heli vectorAdd [0, 0, -10], [], 0, "NONE"];

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

[_crate] call FUNC(populateCrate);

_heli setSlingLoad _crate;

_heliGroup move _dropZone;

[QEGVAR(common,radioBroadcast), [
    groupId _heliGroup,
    format ["En-route to drop zone, GRID: %1", _dropZone]
]] call CBA_fnc_globalEvent;

// Blacklist all objects from saving
if (!isNil "grad_persistence_blacklist") then {
    [_heli] call grad_persistence_fnc_blacklistObjects;
    [_crate] call grad_persistence_fnc_blacklistObjects;
    {
        [_x] call grad_persistence_fnc_blacklistObjects;
    } forEach crew _heli;
};

// Add to remains collection in case helicopter is blown up
addToRemainsCollector [_heli];
addToRemainsCollector [_crate];

addToRemainsCollector (crew _heli);

[{
    params ["_args", "_handle"];
    _args params ["_dropZone", "_heliGroup", "_heli", "_crate"];

    if !(alive _heli) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_heli distance _dropZone < 200) exitWith {
        [_dropZone, _heliGroup, _heli, _crate] call FUNC(dropSequence);
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_dropZone, _heliGroup, _heli, _crate]] call CBA_fnc_addPerFrameHandler;

