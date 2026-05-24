#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Fortifications data parser / retrieval from description.ext for CfgGradFortifications class
 * Compat data for GRAD Fortifications module
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_parseGradFortData;
 *
*/

{
    private _className = configName _x;

    GVAR(buildingBlacklist) pushBack _className;

} forEach ("true" configClasses (missionConfigFile >> "CfgGradFortifications" >> "Fortifications"));

publicVariable QGVAR(buildingBlacklist);

