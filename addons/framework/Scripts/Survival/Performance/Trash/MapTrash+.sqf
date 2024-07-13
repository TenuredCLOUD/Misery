/*
Misery Map optimizer (garbage readd)
Filters through the active map and actively hides and disables simulation on specific object models (specifically trash)
Can in some instances increase framerate, especially useful on maps that are densly populated with trash objects, Chernarus Redux especially
Runs on Client when CBA option is checked (BOOL)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (isServer) then {   
private _modelNames = ["garbage_square3_f.p3d",    
"garbage_square5_f.p3d",    
"garbagebags_f.p3d",    
"garbage_line_f.p3d",    
"garbagepallet_f.p3d",    
"garbagewashingmachine_f.p3d",    
"garbageheap_01_f.p3d",    
"garbageheap_02_f.p3d",    
"garbageheap_03_f.p3d",    
"garbageheap_04_f.p3d",    
"medicalgarbage_01_1x1_v1_f.p3d",    
"medicalgarbage_01_1x1_v2_f.p3d",    
"medicalgarbage_01_1x1_v3_f.p3d",    
"medicalgarbage_01_3x3_v1_f.p3d",    
"medicalgarbage_01_3x3_v2_f.p3d",    
"medicalgarbage_01_5x5_v1_f.p3d",    
"medicalgarbage_01_bandage_f.p3d",    
"medicalgarbage_01_firstaidkit_f.p3d",    
"medicalgarbage_01_gloves_f.p3d",    
"medicalgarbage_01_injector_f.p3d",    
"medicalgarbage_01_packaging_f.p3d",    
"misc_garb_heap_ep1.p3d",    
"misc_garb_3_ep1.p3d",    
"misc_garb_4_ep1.p3d",    
"misc_garb_square_ep1.p3d",
"mrtvola_army1.p3d",
"junkpile_f.p3d",
"ground_garbage_long.p3d",
"garbage_misc.p3d",
"ground_garbage_square5.p3d",
"luggageheap_04_f.p3d",
"luggageheap_03_f.p3d",
"luggageheap_01_f.p3d",
"luggageheap_02_f.p3d"
]; 
    
private _center = [worldSize / 2, worldSize / 2, 0]; 
private _radius = worldSize; 
  
private _objects = nearestTerrainObjects [_center, ["HIDE"], _radius]; 
  
    { 
        private _modelInfo = getModelInfo _x; 
        if (_modelInfo select 0 in _modelNames) then {             
           _x hideObjectGlobal false;
            _x enableSimulationGlobal true;
        }; 
    } forEach _objects; 
};