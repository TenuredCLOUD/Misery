#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

//Artifact Light emission handling:
if (hasInterface) then {

private ["_light"];

player addEventHandler ["Take", {
    params ["_unit", "_container", "_item"];
    if (_item in MIS_Artifact) then {
        _light = _container getVariable "Artifact_LightEmission";
        if (!isNil "_light") then {
            deleteVehicle _light;
        };
    };
}];

player addEventHandler ["Put", {
        params ["_unit", "_container", "_item"];
        if (_item in MIS_Artifact) then {
            if (_container isKindOf "GroundWeaponHolder") then {
            _light = "#lightpoint" createVehicle getPos _container;
            _light setLightBrightness 0.1; 
            _light setLightColor [random 1, random 1, random 1]; 
            _light lightAttachObject [_container, [0,0,0]]; 
            _container setVariable ["Artifact_LightEmission", _light]; 
            }; //Only build light source if _container is the ground (vehicles conflict with other systems...)
        };
    }];
};

ADDON = true;
