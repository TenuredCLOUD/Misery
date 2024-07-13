/*
Misery Money taking UI
Processes Money taking from corpses
Designed specifically for Misery mod 
*/

class Misery_MoneyTake_UI
{
	idd = 358492;

	onLoad = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Money\TakeMoney.sqf';";

class ControlsBackground
{
class Misery_MoneyTakeMenu_BG: Misery_RscText
{
	idc = 1800;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 29.5 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	colorBackground[]={0.2,0.2,0.2,.7};
};
class Misery_MoneyTakeMenu_Prompt: RscText
{
	idc = 1000;
	text = "Take funds"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
};
class Controls
	{
class Misery_MoneyTakeMenu_InputBox: RscEdit
{
	idc = 1400;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_MoneyTakeMenu_Take: RscButton
{
	idc = 1600;
	text = "Take"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Money\TakeMoney_Act.sqf';";
};
class Misery_MoneyTakeMenu_ObjectsFunds: RscText
{
	idc = 1001;
	x = 22.65 * GUI_GRID_W + GUI_GRID_X;
	y = 7.59 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_MoneyTakeMenu_PlayersFunds: RscText
{
	idc = 1002;
	x = 23.23 * GUI_GRID_W + GUI_GRID_X;
	y = 5.75 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = 0.7 * GUI_GRID_H;
};
	};
		};

//$[1.063,["Misery_MoneyTakeMenu",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_MoneyTakeMenu_BG",[2,"",["5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","29.5 * GUI_GRID_W","8 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_MoneyTakeMenu_Prompt",[2,"Take funds",["5.5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1400,"Misery_MoneyTakeMenu_InputBox",[2,"",["15 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"Misery_MoneyTakeMenu_Take",[2,"Take",["14.5 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_MoneyTakeMenu_ObjectsFunds",[2,"0 funds",["22.65 * GUI_GRID_W + GUI_GRID_X","7.59 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1002,"Misery_MoneyTakeMenu_PlayersFunds",[2,"Player: 1% 2%",["23.23 * GUI_GRID_W + GUI_GRID_X","5.75 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]

