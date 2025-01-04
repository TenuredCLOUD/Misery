#include "script_component.hpp"

["CBA_settingsInitialized", {
if (hasInterface) then {
if (GVAR(enhanced)) then {
[] call FUNC(gasmaskTimer);
[] call FUNC(gasmaskAudio);
};
};
}] call CBA_fnc_addEventHandler;
