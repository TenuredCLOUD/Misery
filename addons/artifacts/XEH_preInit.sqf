#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"
/*
//Artifact Light emission handling:
if (hasInterface) then {
    player addEventHandler ["Take", {
        params ["_unit", "_container", "_item"];
        if (_item in [MACRO_ARTIFACTS]) then {
            private _light = _container getVariable "Artifact_LightEmission";
            if (!isNil "_light") then {
                deleteVehicle _light;
            };
        };
    }];

    player addEventHandler ["Put", {
        params ["_unit", "_container", "_item"];
        if (_item in [MACRO_ARTIFACTS]) then {
            if (_container isKindOf "GroundWeaponHolder") then {
            private _light = "#lightpoint" createVehicle getPos _container;
            _light setLightBrightness 0.1;
            _light setLightColor [random 1, random 1, random 1];
            _light lightAttachObject [_container, [0,0,0]];
            _container setVariable ["Artifact_LightEmission", _light];
            }; //Only build light source if _container is the ground (vehicles conflict with other systems...)
        };
    }];
};
*/

ADDON = true;
