#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * RF detector loop
 * Runs audio samples + constant detection cycles
 * Also runs a generated numeric chance spawner for extremely hostile entities
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_rfdetector_fnc_loop;
 *
*/

/*
[{(player getVariable [QCLASS(rfdetectorStatus), false])},
{
    [{
        params ["_args", "_handle"];

        if ((!(player getVariable [QCLASS(rfdetectorStatus), false])) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

    private ["_randomaudio","_randomunknownREMNANT","_randomunknownDSA","_RFsoundrandom","_group","_pos","_entity","_timeafter","_TimeA","_spookArray"];

    if ((player getVariable [QCLASS(rfdetectorStatus), false])) then {
    _randomaudio = [1, 10] call BIS_fnc_randomInt;
    _randomunknownREMNANT = [1, 50] call BIS_fnc_randomInt;
    _randomunknownDSA = [1, 50] call BIS_fnc_randomInt;
    MiseryRFLoopdummy = "Land_HelipadEmpty_F" createVehicle (position player);
    MiseryRFLoopdummy attachTo [player, [0, 0, 0], "Pelvis"];
    _RFsoundrandom = selectRandom ["StaticWEIRD1","StaticWEIRD2","StaticWEIRD3","StaticWEIRD4","StaticWEIRD5","StaticWEIRD6","StaticWEIRD7","StaticWEIRD8","StaticWEIRD9","StaticWEIRD10"];

    if (_randomaudio isEqualTo 5) then {
    [MiseryRFLoopdummy, [_RFsoundrandom, 50]] remoteExec ["say3D", 0, MiseryRFLoopdummy];
    } else {
    [MiseryRFLoopdummy, ["StaticBASIC", 50]] remoteExec ["say3D", 0, MiseryRFLoopdummy];
    };

    if (_randomunknownREMNANT isEqualTo 25 && EGVAR(common,remnant)) then {
    _group = creategroup [civilian, true];
    _pos = getPos player;
    _pos = [_pos select 0, _pos select 1, _pos select 2];
    _pos = _pos vectorAdd [50, 0, 0];
    _entity = ["myst_phantom_hidden_f","myst_phantom_naked_f"];
    (selectRandom _entity) createUnit [_pos, _group, "MiseryPsuedoPhantom = this"]; //Create phantom and tag it with Gvar
    //Spawn scheduled code on registered spawned entity:
    _timeafter = time + 30;
    [_timeafter] spawn {
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};
    deleteVehicle MiseryPsuedoPhantom;
    };
        };

    if (_randomunknownDSA isEqualTo 25 && EGVAR(common,dsa)) then {
    _group = creategroup [civilian, true];
    _pos = getPos player;
    _pos = [_pos select 0, _pos select 1, _pos select 2];
    _pos = _pos vectorAdd [50, 0, 0];
    _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;
    (selectRandom _spookArray) createUnit [_pos, _group, "MiseryPsuedoSpook = this"]; //Create spook and tag it with Gvar
    //Spawn scheduled code on registered spawned entity:
    _timeafter = time + 30;
    [_timeafter] spawn {
    _TimeA=_this select 0;
    waitUntil {(!alive player) or (time > _TimeA)};
    deleteVehicle MiseryPsuedoSpook;
    };
        };

    [{
    !(player getVariable [QCLASS(rfdetectorStatus), false])
    },{deleteVehicle _this; //Delete active audio source if detector is "off"
    }, MiseryRFLoopdummy] call CBA_fnc_waitUntilAndExecute;
        };

    }, 59, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
*/
