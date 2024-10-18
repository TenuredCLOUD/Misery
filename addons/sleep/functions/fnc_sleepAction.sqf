#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * show Sleep interaction (asset model based)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_sleep_fnc_sleepAction;
 *
*/

    [
    player,
    "Sleep",
    QPATHTOEF(icons,data\sleepy_ca.paa),
    QPATHTOEF(icons,data\sleepy_ca.paa),
    "private _object = cursorObject;
    private _model = getModelInfo _object select 0;
    _model in ['woodenbed_01_f.p3d',
        'bed_big_a.p3d',
        'bed_husbands.p3d',
        'vojenska_palanda.p3d',
        'postel_manz_kov.p3d',
        'sofa_01_f.p3d',
        'Land_ArmChair_01_F',
        'armchair.p3d',
        'armchair_big.p3d',
        'postel_panelak1.p3d',
        'postel_panelak2.p3d',
        'sleeping_bag_f.p3d',
        'sleeping_bag_blue_f.p3d',
        'sleeping_bag_brown_f.p3d',
        'ground_sheet_f.p3d',
        'ground_sheet_blue_f.p3d',
        'ground_sheet_khaki_f.p3d',
        'ground_sheet_opfor_f.p3d',
        'ground_sheet_yellow_f.p3d'
        ]",
    "private _object = cursorObject;
    private _model = getModelInfo _object select 0;
    _model in ['woodenbed_01_f.p3d',
        'bed_big_a.p3d',
        'bed_husbands.p3d',
        'vojenska_palanda.p3d',
        'postel_manz_kov.p3d',
        'sofa_01_f.p3d',
        'Land_ArmChair_01_F',
        'armchair.p3d',
        'armchair_big.p3d',
        'postel_panelak1.p3d',
        'postel_panelak2.p3d',
        'sleeping_bag_f.p3d',
        'sleeping_bag_blue_f.p3d',
        'sleeping_bag_brown_f.p3d',
        'ground_sheet_f.p3d',
        'ground_sheet_blue_f.p3d',
        'ground_sheet_khaki_f.p3d',
        'ground_sheet_opfor_f.p3d',
        'ground_sheet_yellow_f.p3d'
        ]",
    {},
    {},
    {
    private _actionID = (_this select 2);
    createDialog "MiserySleepMenuGUI";
    [player,_actionID] call BIS_fnc_holdActionRemove;
    },
    {
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    },
    [],
    0,
    nil,
    true,
    false
    ] call BIS_fnc_holdActionAdd;

