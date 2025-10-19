#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(inArea);
        [QGVAR(artifactSpawnEvent), FUNC(spawn)] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;

GVAR(processedMarkers) = [];

if !(hasInterface) exitWith {};

[] call FUNC(exposure);

//Artifact Light emission handling:
player addEventHandler ["Take", {
    params ["_unit", "_container", "_item"];
    if (_item in [MACRO_ARTIFACTS]) then {
        private _light = _container getVariable QGVAR(lightEmission);
        if (!isNil "_light") then {
            deleteVehicle _light;
        };
    };
}];

player addEventHandler ["Put", {
    params ["_unit", "_container", "_item"];
    if !(_container isKindOf "GroundWeaponHolder") exitWith {}; // Only build light source if _container is the ground (vehicles conflict with other systems...)
    if !(_item in [MACRO_ARTIFACTS]) exitWith {};
    private _light = "#lightpoint" createVehicleLocal getPos _container;
    _light setLightBrightness 0.1;
    _light setLightColor [random 1, random 1, random 1];
    _light lightAttachObject [_container, [0,0,0]];
    _container setVariable [QGVAR(lightEmission), _light];
}];
