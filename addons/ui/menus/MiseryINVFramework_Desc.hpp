/*
Misery Action / Inventory Framework Buffs & Ailments Description UI
Processes Buffs & Ailments to separate UI
Designed specifically for Misery mod 
*/

/*
OBSOLETE
*/

// class MiseryINVACT_DESCRIPT_GUI
// {
// 	idd = 982378;
// 	duration = 10000000000;
// 	onLoad = "uiNamespace setVariable ['MiseryINVACT_DESCRIPT_GUI', _this select 0];";
// 	fadein = 0;
// 	fadeout = 0;

// class ControlsBackground
// {
// class Misery_ActionFWDescription_BG: Misery_RscText
// {
// 	idc = -1;
// 	x = 40 * GUI_GRID_W + GUI_GRID_X;
// 	y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 11.5 * GUI_GRID_W;
// 	h = 11.5 * GUI_GRID_H;
// 	colorBackground[]={0.2,0.2,0.2,.7};
// };
// class Misery_ActionFWDescription_BG_SPLIT: RscFrame
// {
// 	idc = -1;
// 	x = 40 * GUI_GRID_W + GUI_GRID_X;
// 	y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 0.4 * GUI_GRID_W;
// 	h = 11.5 * GUI_GRID_H;
// };
// };
// class Controls
// {
// class Misery_ActionFWDescription_icon: RscPicture
// {
// 	idc = 1200;
// 	x = 44.5 * GUI_GRID_W + GUI_GRID_X;
// 	y = 24.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 2.5 * GUI_GRID_W;
// 	h = 1.5 * GUI_GRID_H;
// };
// class Misery_ActionFWDescription_Name: RscText
// {
// 	idc = 1015;
// 	x = 40.65 * GUI_GRID_W + GUI_GRID_X;
// 	y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 10.5 * GUI_GRID_W;
// 	h = 2 * GUI_GRID_H;
// 	sizeEx = 0.7 * GUI_GRID_H;
// };
// class Misery_ActionFWDescription_DescriptionText: RscText
// {
// 	idc = 1016;
// 	x = 40.73 * GUI_GRID_W + GUI_GRID_X;
// 	y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 10.5 * GUI_GRID_W;
// 	h = 6 * GUI_GRID_H;
// 	sizeEx = 0.7 * GUI_GRID_H;
// };
// 	};
// 		};

//$[1.063,["Misery_ActionFWDescription",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1801,"Misery_ActionFWDescription_BG",[2,"",["40 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","11.5 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_ActionFWDescription_icon",[2,"",["44.5 * GUI_GRID_W + GUI_GRID_X","24.5 * GUI_GRID_H + GUI_GRID_Y","2.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1015,"Misery_ActionFWDescription_Name",[2,"",["40.65 * GUI_GRID_W + GUI_GRID_X","26.5 * GUI_GRID_H + GUI_GRID_Y","10.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1016,"Misery_ActionFWDescription_DescriptionText",[2,"",["40.73 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","10.5 * GUI_GRID_W","6 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1800,"Misery_ActionFWDescription_BG_SPLIT",[2,"",["40 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","0.4 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]



