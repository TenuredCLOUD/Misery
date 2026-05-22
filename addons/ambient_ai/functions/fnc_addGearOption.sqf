#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI gear option
 * Adds gear interaction to spawned units matching players side SP only
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_addGearOption;
 *
 * Public: No
*/

params ["_unit"];

if (side _unit isEqualTo side player) then {

    private _gearAction = [
        QGVAR(gear_menu),
        localize LSTRING(OpenInventory),
        QUOTE(a3\ui_f_curator\data\rsccommon\rscattributeinventory\filter_10_ca.paa),
        {
            params ["_target", "_player"];
            _target action ["Gear", objNull];
        },
        {
            params ["_target", "_player"];
            alive _target && (group _target isEqualTo group _player) && !(isPlayer _target);
        },
        {},
        [],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    [_unit, 0, [QUOTE(ACE_MainActions)], _gearAction] call ACEFUNC(interact_menu,addActionToObject);
};
