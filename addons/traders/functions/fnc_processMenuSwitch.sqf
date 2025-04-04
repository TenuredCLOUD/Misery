#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop Sell / Buy Switching processor
 * Processes Buying or Selling (Changes UI)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_traders_fnc_processMenuSwitch;
 *
 * Public: No
*/

private _dialog = findDisplay 982390;
private _list = _dialog displayCtrl 1500;
private _switchModeButton = _dialog displayCtrl 1600;
private _IconCtrl = _dialog displayCtrl 1200;
private _IconTxt = _dialog displayCtrl 1004;

if (currentAction isEqualTo "buy") then {
    currentAction = "sell";
_switchModeButton ctrlSetText "Buy Menu";
_IconCtrl ctrlSetText nil;
_IconTxt ctrlSetText nil;
ctrlSetText [1001, nil];
if (lbSize _list > 0) then {
_list lbSetCurSel 0;
};
} else {
    currentAction = "buy";
_switchModeButton ctrlSetText "Sell Menu";
_IconCtrl ctrlSetText nil;
_IconTxt ctrlSetText nil;
ctrlSetText [1001, nil];
if (lbSize _list > 0) then {
_list lbSetCurSel 0;
};
};

[] call FUNC(shopVAL);

