#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process Buff/Ailment Selection
 *
 * Arguments:
 * 0: Control <NUMBER>
 * 1: selectedIndex <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_control, _selectedIndex] call misery_vitals_fnc_processStatus;
 */

params ["_control", "_selectedIndex"];
private _selectedItem = _control lbData _selectedIndex;
private _arrayName = ["ailments", "buffs"] select (_control isEqualTo (findDisplay 982377 displayCtrl 1501));
private _array = player getVariable [_arrayName, []];
private _selectedData = _array select {(_x select 0) isEqualTo _selectedItem} param [0, []];

if (count _selectedData > 0) then {
    _selectedData params ["_name", "", "_description"];
    [QEGVAR(common,inventoryTile), [format [_name, _description, 10]]] call CBA_fnc_localEvent;
};
