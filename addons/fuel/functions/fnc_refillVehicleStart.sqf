#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Array input for refueling amount per Jerrycan
 *
 * Arguments:
 * 0: Jerry can type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_Jerrycanused] call misery_fuel_fnc_refillVehicleStart
 *
*/

(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryRefuel_Vehicle_JCan_GUI";

private _Jerrycanused= _this; // item classname

[_Jerrycanused] call FUNC(vehicleIcon);