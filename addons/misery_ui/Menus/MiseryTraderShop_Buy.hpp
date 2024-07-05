/* -----------------------------------
Misery Trader / Shop UI
Processes Buying of items... 
Designed specifically for Misery mod 
-------------------------------------- */

class Misery_TraderShop_Buy_GUI
{
	idd = 982390;
	onLoad = "_trader = player getVariable 'currentTrader'; _trader setVariable ['Misery_TraderIsBusy', true, true]; _trader setVariable ['Misery_TradingWith', profileName, true]; currentAction = 'buy'; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf'; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ProcessCategory.sqf'; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ProcessMenuSwitch.sqf';"; 
	onUnload = "_trader = player getVariable 'currentTrader'; _trader setVariable ['Misery_TraderIsBusy', false, true]; _trader setVariable ['Misery_TradingWith', nil, true]; _queue = _trader getVariable 'Misery_TradingQue'; _index = _queue find (getPlayerUID player); if (_index != -1) then {_queue deleteAt _index;_trader setVariable ['Misery_TradingQue', _queue, true];};";

class ControlsBackground
{
class Misery_TraderShop_Buy_BG: Misery_RscText
{
	idc = 1800;
	x = PASS_STR(-6 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(-5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(52 * GUI_GRID_W);
	h = PASS_STR(32 * GUI_GRID_H);
	colorBackground[]={0.2,0.2,0.2,.7};
};
class Misery_TraderShop_Buy_Prompt: RscText
{
	idc = 1000;
	x = PASS_STR(-5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(-4.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(21 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
};
class Misery_TraderShop_Buy_PlayerFunds_Info: RscText
{
	idc = 1003;
	x = PASS_STR(30.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(-1.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(17.5 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_TraderShop_Buy_ShopFunds_Info: RscText
{
	idc = 1002;
	x = PASS_STR(30.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(-3 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(17.5 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_TraderShop_Buy_icon: RscPicture
{
	idc = 1200;
	x = PASS_STR(27.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(1.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(8.5 * GUI_GRID_W);
	h = PASS_STR(5 * GUI_GRID_H);
};
};
class Controls
	{
class Misery_TraderShop_Buy_DropList: RscCombo
{
	idc = 2100;
	x = PASS_STR(0.04 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(-0.75 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(20.5 * GUI_GRID_W);
	h = PASS_STR(1 * GUI_GRID_H);
	sizeEx = 0.7 * GUI_GRID_H;
	onLBSelChanged = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf';";
};
class Misery_TraderShop_Buy_Shop_List: RscListBox
{
	idc = 1500;
	x = PASS_STR(0 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(0.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(20.5 * GUI_GRID_W);
	h = PASS_STR(18.5 * GUI_GRID_H);
	sizeEx = 0.7 * GUI_GRID_H;
	onLBSelChanged = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ProcessIcon.sqf';";
};
class Misery_TraderShop_Buy_InfoBox: RscText
{
	idc = 1001;
	x = PASS_STR(0 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(19.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(21.5 * GUI_GRID_W);
	h = PASS_STR(7 * GUI_GRID_H);
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_TraderShop_Buy_Icon_infoBox: Misery_StructuredText 
{
	idc = 1004;
	x = PASS_STR(23 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(7 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(19.5 * GUI_GRID_W);
	h = PASS_STR(5.5 * GUI_GRID_H);
	sizeEx = 0.65 * GUI_GRID_H;
};
class Misery_TraderShop_Sell_Sell: RscButton
{
	idc = 1602;
	text = "Buy"; //--- ToDo: Localize;
	x = PASS_STR(22.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(13.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ProcessBuy_Sell.sqf';";
};
class Misery_TraderShop_Sell_Gift: RscButton
{
	idc = 1603;
	text = "Gift Item"; //--- ToDo: Localize;
	x = PASS_STR(22.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(16 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ProcessGift.sqf';";
};
class Misery_TraderShop_Sell_BuyMenu: RscButton
{
	idc = 1600;
	text = "Sell Menu"; //--- ToDo: Localize;
	x = PASS_STR(22.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(18.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ProcessMenuSwitch.sqf';";
};
class Misery_TraderShop_Buy_Exit: RscButton
{
	idc = 1601;
	text = "Exit"; //--- ToDo: Localize;
	x = PASS_STR(38 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(23.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "currentAction = nil; closeDialog 2;";
};
class Misery_TraderShop_ShowCompats: Misery_Checkbox
{
	idc = 2800;
	tooltip = "Only show compatible weapon items";
	x = PASS_STR(21.21 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(-0.82 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(1.5 * GUI_GRID_W);
	h = PASS_STR(1 * GUI_GRID_H);
	onCheckedChanged = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf';";
};
	};
		};

//$[1.063,["Misery_TraderShop_Buy_UI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_TraderShop_Sell_BG",[2,"",["-6 * GUI_GRID_W + GUI_GRID_X","-5 * GUI_GRID_H + GUI_GRID_Y","52 * GUI_GRID_W","32 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_TraderShop_Sell_Prompt",[2,"Store Name",["-5 * GUI_GRID_W + GUI_GRID_X","-4.5 * GUI_GRID_H + GUI_GRID_Y","21 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"Misery_TraderShop_Sell_Shop_List",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","18.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,"Misery_TraderShop_Sell_icon",[2,"\Misery\Scripts\Survival\Data\Mappack\medical.paa",["27.5 * GUI_GRID_W + GUI_GRID_X","1.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"Misery_TraderShop_Sell_Exit",[2,"Exit",["38 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_TraderShop_Sell_InfoBox",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","21.5 * GUI_GRID_W","7 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,"Misery_TraderShop_Sell_PlayerFunds_Info",[2,"Your funds:",["30.5 * GUI_GRID_W + GUI_GRID_X","-1.5 * GUI_GRID_H + GUI_GRID_Y","17.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1602,"Misery_TraderShop_Sell_Sell",[2,"Sell",["22.5 * GUI_GRID_W + GUI_GRID_X","13.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"Misery_TraderShop_Sell_Icon_infoBox",[2,"",["23 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","19.5 * GUI_GRID_W","5.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1603,"Misery_TraderShop_Sell_Gift",[2,"Gift Item",["22.5 * GUI_GRID_W + GUI_GRID_X","16 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"Misery_TraderShop_Sell_ShopFunds_Info",[2,"Shop funds:",["30.5 * GUI_GRID_W + GUI_GRID_X","-3 * GUI_GRID_H + GUI_GRID_Y","17.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,"Misery_TraderShop_Sell_BuyMenu",[2,"Buy Menu",["22.5 * GUI_GRID_W + GUI_GRID_X","18.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2100,"Misery_TraderShop_Buy_DropList",[2,"",["0.04 * GUI_GRID_W + GUI_GRID_X","-0.75 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1801,"Misery_Trader_Buy_Icon_Frame",[2,"",["27.5 * GUI_GRID_W + GUI_GRID_X","1.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

