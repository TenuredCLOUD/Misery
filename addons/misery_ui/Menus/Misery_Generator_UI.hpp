/* -----------------------------------
Misery Generator UI
Processes usage of generators, shows fuel levels, etc...
Designed specifically for Misery mod 
-------------------------------------- */
class MiseryGenerator_GUI
{
	idd = 573849;
	onLoad = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Generator\Gen_PREP.sqf'; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Generator\Gen_icon.sqf';";
	onUnload = "player setVariable ['Misery_Current_Generator', nil]";

class ControlsBackground
{
class Misery_Generator_BG: Misery_RscText
{
	idc = 1800;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
	colorBackground[]={0.2,0.2,0.2,.7};
};
class Misery_Generator_Prompt: RscText
{
	idc = 1000;
	text = "Power Generator"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
class Misery_Generator_icon: RscPicture
{
	idc = 1200;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class Misery_Generator_name: RscText
{
	idc = 1002;
	x = 27.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_Generator_Fuellvl: RscText
{
	idc = 1003;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_Generator_PowerState: RscText
{
	idc = 1001;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_Generator_PoweredObjects: RscText
{
	idc = 1004;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = 0.7 * GUI_GRID_H;
};
	};	
		};

//$[1.063,["Misery_Generator_GUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_Generator_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_Generator_Prompt",[2,"Power Generator",["0.5 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_Generator_icon",[2,"\Misery\Scripts\Survival\Data\Mappack\medical.paa",["28.5 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"Misery_Generator_name",[2,"",["27.5 * GUI_GRID_W + GUI_GRID_X","9.5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","3 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,"Misery_Generator_Fuellvl",[2,"100% --------------------",["1 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1001,"Misery_Generator_PowerState",[2,"""On / Off""",["1 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,"Misery_Generator_PoweredObjects",[2,"Powered Objects:",["1 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]