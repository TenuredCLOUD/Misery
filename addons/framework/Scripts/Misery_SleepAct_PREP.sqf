/*
Misery Sleep interaction adding
This code processes all "sleep-able" objects on the map and adds an action to them...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (MiseryMP) exitWith {}; //If multiplayer environment terminate

if (isServer) then {
    private _useablebeds = ["woodenbed_01_f.p3d", "bed_big_a.p3d", "bed_husbands.p3d", "vojenska_palanda.p3d", "postel_manz_kov.p3d", "sofa_01_f.p3d", "Land_ArmChair_01_F", "armchair.p3d", "postel_panelak1.p3d", "postel_panelak2.p3d", "sleeping_bag_f.p3d", "sleeping_bag_blue_f.p3d", "sleeping_bag_brown_f.p3d", "ground_sheet_f.p3d", "ground_sheet_blue_f.p3d", "ground_sheet_khaki_f.p3d", "ground_sheet_opfor_f.p3d", "ground_sheet_yellow_f.p3d"];
    private _center = [worldSize / 2, worldSize / 2 , 0];   
    private _radius = sqrt 2 * (worldSize / 2);   

    {
        private _object = _x;
        private _modelInfo = getModelInfo _object;
        if (_modelInfo select 0 in _useablebeds) then {
            _object addAction ["Sleep", {createDialog "MiserySleepMenuGUI"}];
        };
    } forEach (nearestTerrainObjects [_center, [], _radius * 2, false]);
};
