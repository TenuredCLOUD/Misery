/* -----------------------------------
Misery BlackOut 
This code removes all light sources from most maps bringing that "Post-Apoc" feel...
Concept Utilizes directed light hitpoint damage & Advanced Map object filtering
No performance loss is notice-able due to processing before scenario loading, and running completely on the server...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (isServer) then {
    private _axis = worldSize / 2;   
    private _center = [_axis, _axis , 0];   
    private _radius = sqrt 2 * _axis;   

    //Sources that will not return from Map / World scan (do not return "light" points)
    private _StructureOverride = [
    //CUP Terrains
    ["Land_Mil_House","Land_Mil_House_ruins"],
    ["Land_Ind_MalyKomin","Land_Ind_MalyKomin_ruins"],
    ["Land_NavigLight"],
    ["Land_NavigLight_3_F"],
    ["Land_Vez_Silo"],
    ["Land_D_Pec_Vez1"],
    ["Land_D_Pec_Vez2"],
    ["Land_Vez_Pec"],
    ["Land_D_Vez_Mlyn"],
    ["Land_LampAirport_F"],
    ["Land_Ind_Mlyn_04","Land_Ind_Mlyn_04_ruins"],
    ["Land_TTowerBig_2_F","Land_TTowerBig_2_ruins_F"],
    ["Land_WaterTower_02_F","Land_WaterTower_02_ruins_F"],
    ["Land_Ind_Vysypka","Land_Ind_Vysypka_ruins"],
    ["Land_LightHouse_F","Land_LightHouse_ruins_F"],
    ["Land_NAV_Lighthouse2","Land_NAV_Lighthouse_ruins"],
    ["Land_NAV_Lighthouse","Land_NAV_Lighthouse_ruins"],
    ["Land_Lighthouse_small_F","Land_Lighthouse_small_ruins_F"],
    ["Land_Lighthouse_03_green_F"],
    ["Land_Lighthouse_03_red_F"],
    ["Land_Majak","Land_NAV_Lighthouse_ruins"],
    ["Land_Majak2","Land_NAV_Lighthouse_ruins"],
    ["Land_Majak_v_celku"],
    ["Land_Majak_podesta"],
    //Vanilla
    ["Land_Plank_01_4m_F"],
    ["Land_Plank_01_8m_F"],
    ["Land_PowerCable_submarine_F"],
    ["Land_LampAirport_off_F"],
    ["Land_Airport_Tower_F","Land_Airport_Tower_ruins_F"],
    ["Land_runway_edgelight"],
    ["Land_runway_edgelight_blue_F"],
    ["Land_Flush_Light_green_F"],
    ["Land_Flush_Light_yellow_F"],
    ["Land_Flush_Light_red_F"],
    ["Land_fs_roof_F"],
    ["Land_spp_Tower_F","Land_spp_Tower_ruins_F"],
    ["Land_dp_smallFactory_F"],
    //Contact DLC
    ["Land_Rail_Crossing_Barrier_F"],
    ["Land_Smokestack_02_F","Land_Smokestack_02_ruins_F"],
    ["Land_Smokestack_03_F","Land_Smokestack_03_ruins_F"],
    ["Land_Smokestack_01_factory_F","Land_Smokestack_01_ruins_F"],
    ["Land_Smokestack_01_F","Land_Smokestack_01_factory_ruins_F"]
    ];

    //Sources that won't stop producing light unless destroyed:
    private _TerminateSource = [
    "Land_Runway_PAPI",
    "Land_Runway_PAPI_2",
    "Land_Runway_PAPI_3",
    "Land_Runway_PAPI_4"
    ];

    private _DirectModelSource = ["fs_sign_f.p3d"];

    private _buildingTypes = _StructureOverride apply {_x select 0};

    private _replacementBuildings = [];

    {  
        private _object = _x;  
        private _modelInfo = getModelInfo _x;
        private _type = typeOf _object;

        private _hitpoints = getAllHitPointsDamage _object select 0;

        _x switchLight "OFF";

        if (!isNil "_hitpoints") then {
            {  
                if ((_x find "light" > -1) || (_x find "Light" > -1)) then {  
                    _object setHitPointDamage [_x, 1]; 
                };  
            } forEach _hitpoints;  
        };

        if (_type in _buildingTypes) then {
            private _replacementType = "";
            {
                if (_x select 0 == _type) then {
                    _replacementType = if (count _x > 1) then {_x select 1} else {""};
                };
            } forEach _StructureOverride;

            if (_replacementType != "") then {
                private _pos = getPosATL _object;
                private _dir = getDir _object;
                private _up = vectorUp _object;

                _object hideObjectGlobal true;

                private _newObject = _replacementType createVehicle _pos;
                _newObject setDir _dir;
                _newObject setVectorUp _up;

                private _hitpointNewObject = getAllHitPointsDamage _newObject select 0;

                if (!isNil "_hitpointNewObject") then {
                    {
                        if ((_x find "light" > -1) || (_x find "Light" > -1)) then {  
                            _newObject setHitPointDamage [_x, 1];  
                        };  
                    } forEach _hitpointNewObject;
                };

                _replacementBuildings pushBack _newObject;
            } else {
                _object hideObjectGlobal true;
            };
        };

            if ((typeOf _object) in _TerminateSource) then { 
            _object hideObjectGlobal true;
            _object setDamage 1;  
        }; 

        if (_modelInfo select 0 in _DirectModelSource) then {            
            _object hideObjectGlobal true;  
        }; 

    } forEach (nearestTerrainObjects [_center, [], _radius * 2, false]);  

waitUntil {sleep 1; diag_tickTime > 1};

 if (!isNil "grad_persistence_blacklist") then {
        {
            private _type = typeOf _x;
            if ((grad_persistence_blacklist find (toLower _type) == -1) && (grad_persistence_blacklist find (toUpper _type) == -1)) then {
                [_type] call grad_persistence_fnc_blacklistClasses;
              //  systemChat format ["%1 added to GRAD blacklist...",_type];
            };
        } forEach _replacementBuildings;
    };
};
