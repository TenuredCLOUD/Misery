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

    private _display = findDisplay 46 createDisplay QCLASS(inventoryFramework_ui);
    [] call EFUNC(actions,displayActions);

    //Vehicle data parsing:
    private _position = getPos player;
    private _vehicles = [];
    {
        _vehicles append (nearestObjects [_position, [_x], 5]);
    } forEach ["Car", "Tank", "Air", "Ship"];
    EGVAR(common,targetVehicle) = if (count _vehicles > 0) then { _vehicles select 0 } else { objNull };
    EGVAR(common,targetVehicleType) = typeOf EGVAR(common,targetVehicle);

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

        player setVariable [QGVAR(inventoryPFH),_handle,false];
        player setVariable [QGVAR(inventoryDisplay),_display,false];
    }, []] call CBA_fnc_waitUntilAndExecute;
}];

//Inv Closed:
player addEventHandler ["InventoryClosed", {
    params ["_unit", "_container","_display"];

    private _handle = player getVariable [QGVAR(inventoryPFH),_handle];
    private _display = player getVariable [QGVAR(inventoryDisplay),_display];

    hintSilent "";

    _display closeDisplay 1;
}];
