#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Applies ACE spray tags globally on startup from GRAD restored data
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_createGlobalSprayTags
*/

if (!isServer) exitWith {};

private _masterTagMap = missionNamespace getVariable [QGVAR(sprayTagsList), createHashMap];

if (count _masterTagMap isEqualTo 0) exitWith {};

{
    _y params ["_pos", "_vectorDirAndUp", "_texture", "_type"];

    private _globalTag = createVehicle ["UserTexture1m_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];

    _globalTag setPosWorld _pos;

    _globalTag setVectorDirAndUp _vectorDirAndUp;

    _globalTag setObjectTextureGlobal [0, _texture];
} forEach _masterTagMap;
