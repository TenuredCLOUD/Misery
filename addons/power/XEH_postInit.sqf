#include "script_component.hpp"

if (isServer) then {
    call FUNC(initLightSources);

    if (isClass (missionConfigFile >> "CfgGradPersistence")) then {
        {
            [_x] call GRADFUNC(persistence,blacklistClasses);
        } forEach GVAR(powerEquipment);
    };
};

if !(hasInterface) exitWith {};

call FUNC(generatorInteractions);

