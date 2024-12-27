#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * hydrology Data Remover
 * Removes specific filling recipe knowledge from players
 *
 * Arguments:
 * 0: Empty container in recipe <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "rvg_plasticBottleEmpty" call misery_hydrology_fnc_removeFillable;
 *
 * Public: No
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable [QCLASS(hydrologyKnowledge), []];
private _index = _playerRecipes findIf {_x select 0 isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable [QCLASS(hydrologyKnowledge), _playerRecipes];
};
