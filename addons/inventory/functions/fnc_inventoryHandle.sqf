/*
Misery Inventory handle [Final code iteration]
Utilizes vanilla Inventory EH's without the need for a 'While do' loop - Optimized* 
Some concepts used from Ravage mod -LBDblClick snippet- (with permission from Haleks)
Function help from Salbei from GRAD team - conversion to CBA waituntil + PFH handle 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\main\script_macros.hpp"

player addEventHandler ["InventoryOpened", {
    [{
        !(isnull (finddisplay 602))
    },{
        {
            ((findDisplay 602) displayCtrl _x) ctrlSetEventHandler ["LBDblClick", "_this call FUNC(Click)"]; 
        } count [633, 638, 619];

        private _display = findDisplay 46 createDisplay "MiseryINVACT_GUI";
        MiseryActionsMode = "";
        [] call FUNC(DisplayActions);

        private _handle = [{
            params ["_display", "_handle"];

            if ((isnull (findDisplay 602))) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler; 
            };

            if (vehicle player isEqualTo player && {vectorMagnitude velocity player > 1}) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler; 
                _display closeDisplay 1;

                hintSilent "";
            
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
    
    _display closeDisplay 1;
}];
