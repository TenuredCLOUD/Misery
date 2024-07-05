/* -----------------------------------
Misery Trader Shop Sell / Buy Switching processor
Processes Buying or Selling (Changes UI)
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private _dialog = findDisplay 982390;
private _list = _dialog displayCtrl 1500;
private _switchModeButton = _dialog displayCtrl 1600;
private _IconCtrl = _dialog displayCtrl 1200;
private _IconTxt = _dialog displayCtrl 1004;

if (currentAction == "buy") then {
    currentAction = "sell";
_switchModeButton ctrlSetText "Buy Menu";
_IconCtrl ctrlSetText nil;
_IconTxt ctrlSetText nil;
ctrlSetText [1001, nil];
if (lbSize _list > 0) then {
_list lbSetCurSel 0;
};
}else{
    currentAction = "buy";
_switchModeButton ctrlSetText "Sell Menu";
_IconCtrl ctrlSetText nil;
_IconTxt ctrlSetText nil;
ctrlSetText [1001, nil];
if (lbSize _list > 0) then { 
_list lbSetCurSel 0;
};
};

[] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf';

