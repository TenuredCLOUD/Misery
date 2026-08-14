#include "script_component.hpp"

if (isServer) then {
    call FUNC(inArea);
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    [QGVAR(chemicalAreaEvent), FUNC(process)] call CBA_fnc_addEventHandler;

    call FUNC(gas);
    call FUNC(detectorAlert);
    call FUNC(updateDetector);
}] call CBA_fnc_addEventHandler;



