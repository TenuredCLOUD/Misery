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

[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(refuelJerryCan_ui);

private _Jerrycanused= _this; // item classname

[_Jerrycanused] call FUNC(vehicleIcon);