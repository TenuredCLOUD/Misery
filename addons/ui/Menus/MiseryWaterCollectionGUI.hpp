/*
Misery Water Collection GUI
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

class MiseryWaterCollection_GUI
{
	idd = 982380;
	onLoad = "[] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\WaterCollect\ContainersListed.sqf'; [] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\WaterCollect\Showicon.sqf';";

class ControlsBackground
{
class Misery_WaterCollectionBG: Misery_RscText
{
	idc = -1;
	colorBackground[]={0.2,0.2,0.2,.7};
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 33 * GUI_GRID_W;
	h = 23.5 * GUI_GRID_H;
};
class MiseryWaterCollection_ItemSelectionTip: RscText
{
	idc = -1;
	text = "Containers:"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	sizeEx = 0.8 * GUI_GRID_H;
};
class Misery_WaterCollectionPrompt: RscText
{
	idc = -1;
	text = "What container would you like to fill?"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 22 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class Misery_WaterCollect_Icon: RscPicture
{
	idc = 1200;
	text = "\z\misery\addons\framework\scripts\survival\Use\icons\well.paa";
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
};
class Controls
	{
class MiseryWaterCollect_List_1: RscListBox
{
	idc = 1500;
	x = 7 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 16.5 * GUI_GRID_W;
	h = 14 * GUI_GRID_H;
};
class MiseryFillContainer_Button: RscButton
{
	idc = 1600;
	text = "Fill container"; //--- ToDo: Localize;
	x = 27.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = PASS_STR((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
	font = "PuristaMedium";
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\WaterCollect\ProcessFill.sqf';";
};
class MiseryDrinkFromSource_Button: RscButton
{
	idc = 1601;
	text = "Drink from source"; //--- ToDo: Localize;
	x = 27.05 * GUI_GRID_W + GUI_GRID_X;
	y = 14.53 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = PASS_STR((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
	font = "PuristaMedium";
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\WaterCollect\DrinkFromSource.sqf';";
};
class MiseryWaterCollection_ExitButton: RscButton
{
	idc = 1602;
	text = "Exit";
	x = 27.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = PASS_STR((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
	font = "PuristaMedium";
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "closeDialog 2;";
};
class MiseryWaterCollection_NoteBox: RscText
{
	idc = 1001;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 30 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
	sizeEx = 0.75 * GUI_GRID_H;
};
	};
		};

//$[1.063,["Misery_WaterCollectionGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_WaterCollectionBG",[2,"",["4.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","33 * GUI_GRID_W","23.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"MiseryWaterCollect_List_1",[2,"",["7 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_WaterCollectionPrompt",[2,"What container would you like to fill?",["6.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryFillContainer_Button",[2,"Fill container",["27.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"MiseryWaterCollection_ItemSelectionTip",[2,"Containers:",["6.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryDrinkFromSource_Button",[2,"Drink from source",["27.05 * GUI_GRID_W + GUI_GRID_X","14.53 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"MiseryWaterCollection_ExitButton",[2,"Exit",["27.5 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"MiseryWaterCollection_NoteBox",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_WaterCollect_Icon",[2,"\\z\misery\addons\framework\scripts\survival\Use\icons\well.paa",["28.5 * GUI_GRID_W + GUI_GRID_X","3 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]