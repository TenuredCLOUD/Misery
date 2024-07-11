/* -----------------------------------
Misery Inventory handle [Final code iteration]
Utilizes vanilla Inventory EH's without the need for a 'While do' loop - Optimized* 
Some concepts used from Ravage mod -LBDblClick snippet- (with permission from Haleks)
Function help from Salbei from GRAD team - conversion to CBA waituntil + PFH handle 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

player addEventHandler ["InventoryOpened", {
    [{
        !(isnull (finddisplay 602))
    },{
        {
            ((findDisplay 602) displayCtrl _x) ctrlSetEventHandler ["LBDblClick", "_this call Misery_fnc_InventoryClick"]; 
        } count [633, 638, 619];

        private _display = findDisplay 46 createDisplay "MiseryINVACT_GUI";
        MiseryActionsMode = "";
        execVM "Misery\Scripts\Inventory\DisplayActions.sqf";

        private _handle = [{
            params ["_display", "_handle"];

            if ((isnull (findDisplay 602))) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler; 
            };

            if (vehicle player isEqualTo player && {vectorMagnitude velocity player > 1}) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler; 
                _display closeDisplay 1;

                hintSilent "";
                private _position = getPos player;
                private _vehicles = [];
                {
                _vehicles append (nearestObjects [_position, [_x], 5]);
                } forEach ["Car", "Tank", "Air", "Ship"];
                MiseryTarget_Veh = if (count _vehicles > 0) then { _vehicles select 0 }else{ objNull };
                MiseryTarget_VehName = typeOf MiseryTarget_Veh;

                private _generators = [];
                {
                _generators append (nearestObjects [_position, [_x], 2.5]);
                } forEach ["Misery_HeavilyUsedGen_Diesel", "Misery_HeavilyUsedGen_Gas","Misery_100KVA_Gen"];
                MiseryTarget_Gen = if (count _generators > 0) then { _generators select 0 }else{ objNull };
                MiseryTarget_GenName = typeOf MiseryTarget_Gen;

                closeDialog 602;
            };

        }, 0, _display] call CBA_fnc_addPerFrameHandler;

        player setVariable ["Misery_inventoryPFH",_handle,false];
        player setVariable ["Misery_inventoryDisplay",_display,false];
    }, []] call CBA_fnc_waitUntilAndExecute;
}];

//Inv Closed:
player addEventHandler ["InventoryClosed", {
    params ["_unit", "_container","_display"];

    private _handle = player getVariable ["Misery_inventoryPFH",_handle];
    private _display = player getVariable ["Misery_inventoryDisplay",_display];
    
    hintSilent "";
    private _position = getPos player;
    private _vehicles = [];
    {
    _vehicles append (nearestObjects [_position, [_x], 5]);
    } forEach ["Car", "Tank", "Air", "Ship"];
    MiseryTarget_Veh = if (count _vehicles > 0) then { _vehicles select 0 }else{ objNull };
    MiseryTarget_VehName = typeOf MiseryTarget_Veh;

    private _generators = [];
    {
    _generators append (nearestObjects [_position, [_x], 2.5]);
    } forEach ["Misery_HeavilyUsedGen_Diesel", "Misery_HeavilyUsedGen_Gas","Misery_100KVA_Gen"];
    MiseryTarget_Gen = if (count _generators > 0) then { _generators select 0 }else{ objNull };
    MiseryTarget_GenName = typeOf MiseryTarget_Gen;

    _display closeDisplay 1;
}];
