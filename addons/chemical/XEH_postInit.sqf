#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(inArea);
        call FUNC(updateDetector);
    };

    if (hasInterface) then {
        [QGVAR(chemicalAreaEvent), FUNC(process)] call CBA_fnc_addEventHandler;
        [] call FUNC(gas);
        [] call FUNC(detectorAlert);
    };

}] call CBA_fnc_addEventHandler;
