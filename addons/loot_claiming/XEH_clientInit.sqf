#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {

    [] call ACEFUNC(common,player) params ["_player"];

    _player addEventHandler ["InventoryOpened", {
        params ["_unit", "_primaryContainer", "_secondaryContainer"];

        private _claimant = _primaryContainer getVariable [QGVAR(claimedBy), objNull];

        if (!isNull _claimant && {alive _claimant} && {group _claimant isNotEqualTo group _unit} && {side _unit isEqualTo side _claimant}) then {

            [{!isNull findDisplay 602}, {
                (findDisplay 602) closeDisplay 2;
                [QEGVAR(common,tileText), localize LSTRING(Warning)] call CBA_fnc_localEvent;
            }, []] call CBA_fnc_waitUntilAndExecute;
        };
    }];
};
