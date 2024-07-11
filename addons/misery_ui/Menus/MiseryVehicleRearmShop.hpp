/* -----------------------------------
Misery rearming Shop UI
Processes rearming purchases for vehicles... 
Designed specifically for Misery mod 
*/

class MiseryRearmShop_GUI
{
	idd = 982383;
	onLoad = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\VehicleRearm\RearmListed.sqf'; [] execVM 'Misery\Scripts\Survival\Functions\Menus\VehicleRearm\Veh_icon.sqf';";

class ControlsBackground
{
class Misery_VehShopRearm_BG: Misery_RscText
{
	idc = -1;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
	colorBackground[]={0.2,0.2,0.2,.7};
};
class Misery_VehShopRearm_Prompt: RscText
{
	idc = -1;
	text = "Vehicle Resupply"; 
	x = 1.6 * GUI_GRID_W + GUI_GRID_X;
	y = 0.24 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
class Misery_VehShopRearm_icon: RscPicture
{
	idc = 1602;
	x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class Misery_VehShopRearm_Vehname: RscText
{
	idc = 1603;
	x = 29.52 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = 0.75 * GUI_GRID_H;
};
};
class Controls
	{
class Misery_VehShopRearm_List: RscListBox
{
	idc = 1500;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
};
class Misery_VehShopRearm_Purchase: RscButton
{
	idc = 1600;
	text = "Purchase"; 
	x = 29.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick ="[] execVM 'Misery\Scripts\Survival\Functions\Menus\VehicleRearm\ProcessPurchase.sqf';";
};
class Misery_VehShopRearm_Exit: RscButton
{
	idc = 1601;
	text = "Exit"; 
	x = 29.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "closeDialog 2;";
};
class Misery_VehShopRearm_InfoBox: RscText
{
	idc = 1001;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 37.5 * GUI_GRID_W;
	sizeEx = 0.75 * GUI_GRID_H;
};
	};	
		};

//$[1.063,["Misery_VehShopRearm",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_VehShopRearm_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_VehShopRearm_Prompt",[2,"Medical Treatment",["1.6 * GUI_GRID_W + GUI_GRID_X","0.24 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"Misery_VehShopRearm_List",[2,"",["1.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,"Misery_VehShopRearm_icon",[2,"\Misery\Scripts\Survival\Data\Mappack\medical.paa",["31.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"Misery_VehShopRearm_Purchase",[2,"Purchase",["29.5 * GUI_GRID_W + GUI_GRID_X","9.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"Misery_VehShopRearm_Exit",[2,"Exit",["29.5 * GUI_GRID_W + GUI_GRID_X","12.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_VehShopRearm_InfoBox",[2,"",["1.5 * GUI_GRID_W + GUI_GRID_X","16.5 * GUI_GRID_H + GUI_GRID_Y","37.5 * GUI_GRID_W","7.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

