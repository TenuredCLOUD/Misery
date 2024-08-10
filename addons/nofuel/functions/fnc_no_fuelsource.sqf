/*
Misery No Fuel resources
This code removes all fuel sources from maps unless using Misery's Refueling framework
Concept Utilizes Advanced Map object filtering
No performance loss is notice-able due to processing before scenario loading, and running completely on the server...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (isServer) then {
    
    private _axis = worldSize / 2;   
    private _center = [_axis, _axis , 0];   
    private _radius = sqrt 2 * _axis;  

    private _allObjects = nearestTerrainObjects [_center, [], _radius * 2];

    private _fuelObjects = _allObjects select {(toLower (typeOf _x) find "fuel" > -1) || (toLower (typeOf _x) find "tank" > -1) || (toLower (typeOf _x) find "feed" > -1)};

    {
        _x setFuelCargo -1; 
        _x setVariable ["ace_refuel_currentFuelCargo", 0, true];
    } forEach _fuelObjects;
};

