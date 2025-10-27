#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Hides objects with lights that cannot be damaged or used with switchLight
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_blackout_hideObjects
*/

private _terrainObjects = call FUNC(nearObjects);
private _terrainHouses = call FUNC(nearHouses);
private _replacementBuildings = [];

private _blackoutStructureRemove = [
    //CUP Terrains
    ["Land_Mil_House", "Land_Mil_House_ruins"],
    ["Land_Ind_MalyKomin", "Land_Ind_MalyKomin_ruins"],
    ["Land_NavigLight"],
    ["Land_NavigLight_3_F"],
    ["Land_Vez_Silo"],
    ["Land_D_Pec_Vez1"],
    ["Land_D_Pec_Vez2"],
    ["Land_Vez_Pec"],
    ["Land_D_Vez_Mlyn"],
    ["Land_LampAirport_F"],
    ["Land_Ind_Mlyn_04", "Land_Ind_Mlyn_04_ruins"],
    ["Land_TTowerBig_2_F", "Land_TTowerBig_2_ruins_F"],
    ["Land_WaterTower_02_F", "Land_WaterTower_02_ruins_F"],
    ["Land_Ind_Vysypka", "Land_Ind_Vysypka_ruins"],
    ["Land_LightHouse_F", "Land_LightHouse_ruins_F"],
    ["Land_NAV_Lighthouse2", "Land_NAV_Lighthouse_ruins"],
    ["Land_NAV_Lighthouse", "Land_NAV_Lighthouse_ruins"],
    ["Land_Lighthouse_small_F","Land_Lighthouse_small_ruins_F"],
    ["Land_Lighthouse_03_green_F"],
    ["Land_Lighthouse_03_red_F"],
    ["Land_Majak", "Land_NAV_Lighthouse_ruins"],
    ["Land_Majak2", "Land_NAV_Lighthouse_ruins"],
    ["Land_Majak_v_celku"],
    ["Land_Majak_podesta"],
    //Vanilla
    ["Land_Plank_01_4m_F"],
    ["Land_Plank_01_8m_F"],
    ["Land_PowerCable_submarine_F"],
    ["Land_LampAirport_off_F"],
    ["Land_Airport_Tower_F", "Land_Airport_Tower_ruins_F"],
    ["Land_runway_edgelight"],
    ["Land_runway_edgelight_blue_F"],
    ["Land_Flush_Light_green_F"],
    ["Land_Flush_Light_yellow_F"],
    ["Land_Flush_Light_red_F"],
    ["Land_fs_roof_F", "Land_FuelStation_Shed_F"],
    ["Land_fs_feed_F", "Land_FuelStation_Feed_F"],
    ["Land_spp_Tower_F", "Land_spp_Tower_ruins_F"],
    ["Land_dp_smallFactory_F"],
    //Contact DLC
    ["Land_Rail_Crossing_Barrier_F"],
    ["Land_Smokestack_02_F", "Land_Smokestack_02_ruins_F"],
    ["Land_Smokestack_03_F", "Land_Smokestack_03_ruins_F"],
    ["Land_Smokestack_01_factory_F", "Land_Smokestack_01_ruins_F"],
    ["Land_Smokestack_01_F", "Land_Smokestack_01_factory_ruins_F"]
];

private _terminateSource = [
    "Land_Runway_PAPI",
    "Land_Runway_PAPI_2",
    "Land_Runway_PAPI_3",
    "Land_Runway_PAPI_4"
];

private _modelSource = [
    "runway_edgelight.p3d",
    "runway_edgelight_blue_f.p3d",
    "powlines_woodl.p3d",
    "flush_light_green_f.p3d",
    "flush_light_yellow_f.p3d",
    "flush_light_red_f.p3d"
];

{
    private _object = _x;
    private _modelInfo = getModelInfo _object select 0;

    [_object] call FUNC(damageLights);

    {
        _x params ["_buildingClass", ["_replacementBuilding", ""]];

        if (typeOf _object isEqualTo _buildingClass) then {
            _object hideObjectGlobal true;

            if (_replacementBuilding isNotEqualTo "") then {
                private _position = getPosATL _object;
                private _direction = getDir _object;
                private _vectorUp = vectorUp _object;

                private _directReplacement = createVehicle [_replacementBuilding, _position, [], 0, "CAN_COLLIDE"];
                _directReplacement setDir _direction;
                _directReplacement setVectorUp _vectorUp;

                [_directReplacement] call FUNC(damageLights);

                _replacementBuildings pushBack _directReplacement;
            };
        };
    } forEach _blackoutStructureRemove;

    if ((typeOf _object) in _terminateSource) then {
        _object hideObjectGlobal true;
        _object setDamage 1;
    };

    if (_modelInfo in _modelSource) then {
        _object hideObjectGlobal true;
    };
} forEach _terrainObjects;

// Extra - for house terrain objects since some fuel sign objects are stubborn & not detected by nearObjects
{
    private _houseObject = _x;
    private _houseModelInfo = getModelInfo _houseObject select 0;

    if (_houseModelInfo isEqualTo "fs_price_f.p3d") then {
        _houseObject hideObjectGlobal true;

        private _housePosition = getPosATL _houseObject;
        private _houseDirection = getDir _houseObject;
        private _houseVectorUp = vectorUp _houseObject;
        private _houseDirectReplacement = createVehicle ["Land_FuelStation_Sign_F", _housePosition, [], 0, "CAN_COLLIDE"];

        _houseDirectReplacement setDir _houseDirection;
        _houseDirectReplacement setVectorUp _houseVectorUp;
        _replacementBuildings pushBack _houseDirectReplacement;
    };

    if (_houseModelInfo isEqualTo "fs_sign_f.p3d") then {
        _houseObject hideObjectGlobal true;
    };
} forEach _terrainHouses;

if (!isNil "grad_persistence_blacklist") then {
    {
        [typeOf _x] call grad_persistence_fnc_blackListClasses;
    } forEach _replacementBuildings;
};
