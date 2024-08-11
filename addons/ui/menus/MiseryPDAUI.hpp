/*
Misery PDA GUI
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

class MiseryPDA_BGFrame: RscPicture
{
	idc = 1200;
	text = "\z\misery\addons\ui\PDA.paa";
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 25 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
};
class MiseryPDA_BGScreen: RscPicture
{
	idc = 1201;
	text = "\z\misery\addons\ui\background.paa";
	x = 16.21 * GUI_GRID_W + GUI_GRID_X;
	y = 6.97 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 9 * GUI_GRID_H;
};
class Misery_ERUInfoBanner: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 16.2 * GUI_GRID_W + GUI_GRID_X;
	y = 6.97 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};
class MiseryPDA_Batteryicon: RscPicture
{
	idc = 1203;
	text = "\z\misery\addons\ui\batteryicon.paa";
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};

//$[1.063,["Misery_ERUGUI",[["0","0","1","1"],"0.025","0.04","GUI_GRID"],0,0,0],[-1200,"MiseryPDA_BGFrame",[2,"\z\misery\addons\ui\PDA.paa",["8 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","25 * GUI_GRID_W","14.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[-1201,"MiseryPDA_BGScreen",[2,"\z\misery\addons\ui\background.paa",["16.21 * GUI_GRID_W + GUI_GRID_X","6.97 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","9 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[-1202,"Misery_ERUInfoBanner",[2,"#(argb,8,8,3)color(1,1,1,1)",["16.2 * GUI_GRID_W + GUI_GRID_X","6.97 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","0.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[-1203,"MiseryPDA_Batteryicon",[2,"\z\misery\addons\ui\batteryicon.paa",["17 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","1 * GUI_GRID_W","0.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]