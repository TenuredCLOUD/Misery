#include "script_component.hpp"

[QGVAR(artifactSpawnEvent), FUNC(spawn)] call CBA_fnc_addEventHandler;

[QGVAR(deleteGlobalLight), {
    params ["_light"];
    if (!isNull _light) then {
        deleteVehicle _light;
    };
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    call FUNC(inArea);
};

GVAR(processedMarkers) = [];

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    [] call FUNC(exposure);

    //Artifact Light emission handling:
    player addEventHandler ["Take", {
        params ["_unit", "_container", "_item"];
        if (_item in [MACRO_ARTIFACTS]) then {
            private _light = _container getVariable [QGVAR(lightEmission), objNull];
            if (!isNull _light) then {
                [QGVAR(deleteGlobalLight), _light] call CBA_fnc_serverEvent;
            };
        };
    }];

    player addEventHandler ["Put", {
        params ["_unit", "_container", "_item"];

        if !(_container isKindOf "GroundWeaponHolder") exitWith {};

        if !(_item in [MACRO_ARTIFACTS]) exitWith {};

        private _reflectorClass = selectRandom [
            "Reflector_Cone_01_white_F",
            "Reflector_Cone_01_orange_F",
            "Reflector_Cone_01_red_F",
            "Reflector_Cone_01_green_F",
            "Reflector_Cone_01_blue_F"
        ];

        private _light = createVehicle [_reflectorClass, [0, 0, 0], [], 0, "CAN_COLLIDE"];

        _light attachTo [_container, [0, 0, 0.5]];
        _light setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];

        _container setVariable [QGVAR(lightEmission), _light, true];
    }];
}] call CBA_fnc_addEventHandler;
