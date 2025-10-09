#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks nearby corpse for matching type
 *
 * Arguments:
 * 0: Position (referenced by object) <OBJECT>
 * 1: Type <STRING>
 * 2: Radius <NUMBER>
 *
 * Return Value:
 * 0: Near corpse <BOOL>
 * 1: Corpse <OBJECT>
 *
 * Example:
 * [player, ["Sheep_random_F"], 2] call misery_common_fnc_nearCorpse;
*/

params ["_object", "_type", "_radius"];

private _corpses = nearestObjects [_object, _type, _radius];
private _deadCorpses = _corpses select { !alive _x };

[count _deadCorpses > 0, _deadCorpses select 0]
