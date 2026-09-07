#include "script_component.hpp"

if !(isServer) exitWith {};

if (GVAR(enabled)) then {

    addMissionEventHandler ["EntityKilled", {
        params ["_unit", "_killer", "_instigator"];

        if (_unit isKindOf "CAManBase") then {
            private _claimant = [_killer, _instigator] select (!isNull _instigator);

            if (!isNull _claimant && {!isPlayer _claimant} && {alive _claimant}) then {

                _unit setVariable [QGVAR(claimedBy), _claimant, true];

            };
        };
    }];
};
