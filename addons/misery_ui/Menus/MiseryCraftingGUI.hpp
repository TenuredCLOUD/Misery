 /* -----------------------------------
Misery Crafting Framework GUI
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

class MiseryCraftingFramework_GUI
{
	idd = 982376;
	onLoad = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Crafting\RecipesListed.sqf'; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Crafting\Showicon.sqf';";

class ControlsBackground
{
class Misery_CraftingBG: Misery_RscText
{
	idc = -1;
	colorBackground[]={0.2,0.2,0.2,.7};
	x = PASS_STR(-4.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(0.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(49 * GUI_GRID_W);
	h = PASS_STR(24 * GUI_GRID_H);
};
class Misery_CraftingPrompt: RscText
{
	idc = -1;
	text = "What would you like to craft?";
	x = PASS_STR(-4 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(0.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(22 * GUI_GRID_W);
	h = PASS_STR(2.5 * GUI_GRID_H);
};
class MiseryCrafting_ItemSelectionTip: RscText
{
	idc = -1;
	text = "Blueprints:"; 
	x = PASS_STR(16.66 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(2.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(6 * GUI_GRID_W);
	h = PASS_STR(2.5 * GUI_GRID_H);
	sizeEx = 0.8 * GUI_GRID_H;
};
class MiseryCrafting_RecipeTip: RscText
{
	idc = -1;
	text = "Recipe for Blueprint:";
	x = PASS_STR(-1.82 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(2.72 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(9.5 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	sizeEx = 0.8 * GUI_GRID_H;
};
class MiseryCrafting_NoteBox: RscText
{
	idc = 1001;
	x = PASS_STR(-3.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(19 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(46.5 * GUI_GRID_W);
	h = PASS_STR(4 * GUI_GRID_H);
	sizeEx = 0.75 * GUI_GRID_H;
};
class Misery_Crafting_Icon: RscPicture
{
	idc = 1501;
	text = "\Misery\Scripts\Survival\Use\icons\crafting.paa";
	x = PASS_STR(36.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(2 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(5.5 * GUI_GRID_W);
	h = PASS_STR(3.5 * GUI_GRID_H);
};
};
class Controls
	{
class MiseryCrafting_List_1: RscListBox
{
	idc = 1500;
	x = PASS_STR(17 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(4.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(16.5 * GUI_GRID_W);
	h = PASS_STR(14 * GUI_GRID_H);
};
class MiseryCrafting_List_2: RscListBox
{
	idc = 1502;
	x = PASS_STR(-1.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(4.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(16.5 * GUI_GRID_W);
	h = PASS_STR(14 * GUI_GRID_H);
};
class MiseryCrafting_Button: RscButton
{
	idc = 1600;
	text = "Craft"; 
	x = PASS_STR(35 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(12 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7.5 * GUI_GRID_W);
	h = PASS_STR(1.5 * GUI_GRID_H);
	sizeEx = PASS_STR((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
	font = "PuristaMedium";
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Crafting\ProcessItems.sqf';";
};
class MiseryCrafting_KnownRecipes: RscButton
{
	idc = 1601;
	text = "Show Recipe"; 
	x = PASS_STR(35 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(14.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7.5 * GUI_GRID_W);
	h = PASS_STR(1.5 * GUI_GRID_H);
	sizeEx = PASS_STR((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
	font = "PuristaMedium";
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Crafting\ShowRecipe.sqf';";
};
class MiseryCrafting_ExitButton: RscButton
{
	idc = 1602;
	text = "Exit"; 
	x = PASS_STR(35 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(17 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7.5 * GUI_GRID_W);
	h = PASS_STR(1.5 * GUI_GRID_H);
	sizeEx = PASS_STR((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
	font = "PuristaMedium";
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "closeDialog 2;";
};
	};
		};

//$[1.063,["Misery_CraftingGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_CraftingBG",[2,"",["-4.5 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","49 * GUI_GRID_W","24 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"MiseryCrafting_List_1",[2,"",["17 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_CraftingPrompt",[2,"What would you like to craft?",["-4 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryCrafting_Button",[2,"Craft",["35 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"MiseryCrafting_ItemSelectionTip",[2,"Blueprints:",["16.66 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryCrafting_KnownRecipes",[2,"Show Recipe",["35 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1602,"MiseryCrafting_ExitButton",[2,"Exit",["35 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"MiseryCrafting_NoteBox",[2,"",["-3.5 * GUI_GRID_W + GUI_GRID_X","19 * GUI_GRID_H + GUI_GRID_Y","46.5 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_Crafting_Icon",[2,"\Misery\Scripts\Survival\Use\icons\crafting.paa",["36.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1003,"MiseryCrafting_RecipeTip",[2,"Recipe for Blueprint:",["-1.82 * GUI_GRID_W + GUI_GRID_X","2.72 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1502,"MiseryCrafting_List_2",[2,"",["-1.5 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

