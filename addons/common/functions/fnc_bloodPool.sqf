#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Spawns bloodpool and tracks it with ACE
 * Deletes source after pushed to ACE blood tracker
 *
 * Arguments:
 * 0: Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_bloodPool;
 *
*/

params ["_source"];

private _position = getPos _source;

private _randomPool = selectRandom [MACRO_BLOODPOOL_TYPES];
private _bloodpool = createSimpleObject [_randomPool, [0, 0, 0]];

_bloodpool setDir random 360;
_bloodpool setPos _position;

[QACEGVAR(medical_blood,bloodDropCreated), [_bloodpool, _source]] call CBA_fnc_serverEvent;

// Delete source after registered to ACE's blood registry
deleteVehicle _source;
