#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Headlamp Usage (Turning off)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_headlamp_fnc_off
 *
*/

private _player = _this select 0;

if (!isNil {_player getVariable QCLASS(headlampStatus)}) then {

    private _headlamp = _player getVariable QCLASS(headlampStatus);
    deleteVehicle _headlamp;

    _player removeItem QCLASS(headlamp_On);
    _player addItem QCLASS(headlamp_Off);

    _player setVariable [QCLASS(headlampStatus), nil, true];

    //Fixes reloader issues:
}else{
_player removeItem QCLASS(headlamp_On);
_player addItem QCLASS(headlamp_Off);
};
