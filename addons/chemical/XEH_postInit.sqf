#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(inArea);
    };

if (hasInterface) then {
[QGVAR(chemicalAreaEvent), FUNC(process)] call CBA_fnc_addEventHandler;
//TODO: Gas Event
};

}] call CBA_fnc_addEventHandler;
