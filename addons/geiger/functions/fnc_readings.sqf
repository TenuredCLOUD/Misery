#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Geiger UI Reading updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_readings
 *
*/

waitUntil {sleep 1; !isNull findDisplay 982344};

while {!isNull findDisplay 982344} do {

_RadReading = format ["%1 mSv", round (player getVariable [QCLASS(radiation),0])];
ctrlSetText [1000, _RadReading];

sleep 0.25;
};

