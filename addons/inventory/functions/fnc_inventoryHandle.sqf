#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD, Salbei
 * Inventory handle
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_inventoryHandle
 *
*/

player addEventHandler ["InventoryOpened", {
    [{
        !(isNull (findDisplay 602))
    },{
        {
            ((findDisplay 602) displayCtrl _x) ctrlSetEventHandler ["LBDblClick", "_this call FUNC(click)"];
        } count [633, 638, 619];

        private _display = findDisplay 46 createDisplay "MiseryINVACT_GUI";
        EGVAR(actions,guiActionsMode) = "";
        [] call FUNC(displayActions);

        private _handle = [{
            params ["_display", "_handle"];

            if ((isNull (findDisplay 602))) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

            if (isNull objectParent player && {vectorMagnitude velocity player > 1}) exitWith {
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
