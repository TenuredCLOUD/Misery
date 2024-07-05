 /* -----------------------------------
Misery Near tree check fnc (Axe wood collection)
Returns all nearby tree terrain objects + checks if they are damaged
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private ["_found", "_axeType","_WBKIMSAXETYPE"];    

_found = FALSE;  
_WBKIMSAXETYPE = [];

if (MiseryWBKIMS == FALSE) then { 
    _axeType = "Misery_Woodaxe";
} else {
    _WBKIMSAXETYPE = ["WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe"];
    _axeType = currentWeapon player;
};

if (vehicle player == player && ((_axeType in items player) || (_WBKIMSAXETYPE find _axeType > -1))) then {     
    //List nearby trees
    if (count (nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true]) > 0) then {      
        _found = TRUE;
    };  
    //Check if nearby trees are damaged:
    private _nearbyTrees = nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true];
    {
        if (damage _x == 1) then {
            _found = FALSE;
            if (MiseryDebug) then {systemChat format["[Wood collection (Axe)]: The tree at position %1 is fallen, and doesn't offer any more wood...",getPosATL _x];};
        };
    } forEach _nearbyTrees;     
};

_found

