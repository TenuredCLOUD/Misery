#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Populates burn time progress bar & updates it
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_burnMonitor
 */

[{!isNull findDisplay 982388},
{

[{
    params ["_args", "_handle"];

    if (isNull findDisplay 982388) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler
    };

    private _fuelProgressBar = findDisplay 982388 displayCtrl 1009;
    private _fuelTime = findDisplay 982388 displayCtrl 1008;

    _fuelProgressBar ctrlShow false;

    private _nearbyFire = objNull;
    private _burnTimeLeft = 0;
    private _type = "";
    {
        if (player distance (_x select 0) < 2.5) exitWith {
            _nearbyFire = _x select 0;
            _burnTimeLeft = _x select 2;
            _type = _x select 1;
        };
    } forEach GVAR(activeFires);

    if (!isNull _nearbyFire && {inflamed _nearbyFire}) then {
        _fuelProgressBar ctrlShow true;
        private _maxTime = [2700, 5400, 7200] select (["small", "big", "barrel"] find _type);
        _fuelProgressBar progressSetPosition (_burnTimeLeft / _maxTime);
        _fuelTime ctrlSetText format ["Burn Time: %1(s)", round _burnTimeLeft];
        (findDisplay 982388 displayCtrl 1600) ctrlEnable false;
    } else {
        _fuelTime ctrlSetText "";
        if (!(player getVariable [QCLASS(isCraftingFire), nil]) && !ctrlEnabled (findDisplay 982388 displayCtrl 1600)) then {
            (findDisplay 982388 displayCtrl 1600) ctrlEnable true;
        };
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;

}, []] call CBA_fnc_waitUntilAndExecute;
