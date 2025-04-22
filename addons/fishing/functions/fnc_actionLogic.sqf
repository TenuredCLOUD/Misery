#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, SlayNoMore
 * Creates fishing pole holding logic for fishing action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_actionLogic;
 */

if (!hasInterface) exitWith {};

private _idd = 982387;

[{!isNull findDisplay _this && call FUNC(hasGear)}, {
    params ["_idd"];

    [{
        if (!isNull findDisplay _this) then {
            GVAR(actionLogic) = "GroundWeaponHolder_Scripted" createVehicle(getPos player);
            GVAR(actionLogic) addItemCargoGlobal [QCLASS(fishingPole), 1];
            GVAR(actionLogic) setDir 0;
            GVAR(actionLogic) attachTo [player,[0,-0.15,-0.75],"rightHandMiddle1",true];
            GVAR(actionLogic) setVectorDirAndUp [[3,0,0.55],[9.05,0.65,-0.15]];
        };
    }, _idd, 0.1] call CBA_fnc_waitAndExecute;

    [{isNull findDisplay _this}, {
        deleteVehicle GVAR(actionLogic);
    }, _idd] call CBA_fnc_waitUntilAndExecute;
}, _idd] call CBA_fnc_waitUntilAndExecute;
