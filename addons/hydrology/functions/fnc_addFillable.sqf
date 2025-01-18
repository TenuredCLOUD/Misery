#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * hydrology Data Parser
 * Parses data to players knowledge of fillable objects
 *
 * Arguments:
 * 0: Required container (empty) <STRING>
 * 1: Returned container (after filled) <STRING>
 * 2: Time taken to fill container <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["rvg_plasticBottleEmpty","rvg_plasticBottle",5]] call misery_hydrology_fnc_addFillable;
 *
 * Public: No
*/

_this params ["_recipe"];
private _playerRecipes = player getVariable [QCLASS(hydrologyKnowledge), []];

private _recipeName = _recipe select 0;
if (_playerRecipes findIf {_x select 0 isEqualTo _recipeName} isEqualTo -1) then {
    _playerRecipes pushBack _recipe;
    player setVariable [QCLASS(hydrologyKnowledge), _playerRecipes];
};
