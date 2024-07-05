 /* -----------------------------------
Misery Map optimizer (Craters removal)
Filters through the active map and actively hides and disables simulation on specific object models (specifically Craters)
Can in some instances increase framerate, especially useful on maps that are densly populated with trash objects, Chernarus Redux especially
Runs on Client when CBA option is checked (BOOL)
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if (isServer) then {   
    private _modelNames = [
        "craterlong.p3d",
        "craterlong_small.p3d",
        "krater.p3d",
        "shellcrater_02_debris_f.p3d",
        "shellcrater_02_decal_f.p3d",
        "shellcrater_01_decal_f.p3d",
        "shellcrater_02_extralarge_f.p3d",
        "shellcrater_02_large_f.p3d",
        "shellcrater_02_small_f.p3d",
        "shellcrater_01_f.p3d",
        "craterlong_02_f.p3d",
        "craterlong_02_small_f.p3d"
    ]; 
    
    private _center = [worldSize / 2, worldSize / 2, 0]; 
    private _radius = worldSize; 
  
    private _objects = nearestTerrainObjects [_center, ["HIDE"], _radius]; 
  
    { 
        private _modelInfo = getModelInfo _x; 
        if (_modelInfo select 0 in _modelNames) then {             
           _x hideObjectGlobal true;
            _x enableSimulationGlobal false;
        }; 
    } forEach _objects; 
};


