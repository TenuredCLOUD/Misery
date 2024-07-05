 /* -----------------------------------
Misery Cooking Framework GUI
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

class MiseryCookingFramework_GUI
{
	idd = 982379;
	onLoad = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Cooking\RecipesListed.sqf'; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Cooking\Showicon.sqf';";

class ControlsBackground
{
class Misery_CookingBG: Misery_RscText
{
	idc = -1;
	colorBackground[]={0.2,0.2,0.2,.7};
	x = PASS_STR(-4.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(0.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(49 * GUI_GRID_W);
	h = PASS_STR(24 * GUI_GRID_H);
};
class Misery_CookingPrompt: RscText
{
	idc = -1;
	text = "What would you like to cook?";
	x = PASS_STR(-4 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(0.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(22 * GUI_GRID_W);
	h = PASS_STR(2.5 * GUI_GRID_H);
};
class MiseryCooking_ItemSelectionTip: RscText
{
	idc = -1;
	text = "Recipes:"; 
	x = PASS_STR(16.66 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(2.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(6 * GUI_GRID_W);
	h = PASS_STR(2.5 * GUI_GRID_H);
	sizeEx = 0.8 * GUI_GRID_H;
};
class MiseryCooking_RecipeTip: RscText
{
	idc = -1;
	text = "Requirements for Recipe:";
	x = PASS_STR(-1.82 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(2.72 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(9.5 * GUI_GRID_W);
	h = PASS_STR(2 * GUI_GRID_H);
	sizeEx = 0.8 * GUI_GRID_H;
};
class MiseryCooking_NoteBox: RscText
{
	idc = 1001;
	x = PASS_STR(-3.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(19 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(46.5 * GUI_GRID_W);
	h = PASS_STR(4 * GUI_GRID_H);
	sizeEx = 0.75 * GUI_GRID_H;
};
class Misery_Cooking_Icon: RscPicture
{
	idc = 1501;
	text = "\Misery\Scripts\Survival\Use\icons\boilwater.paa";
	x = PASS_STR(36.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(2 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(5.5 * GUI_GRID_W);
	h = PASS_STR(3.5 * GUI_GRID_H);
};
};
class Controls
	{
class MiseryCooking_List_1: RscListBox
{
	idc = 1500;
	x = PASS_STR(17 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(4.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(16.5 * GUI_GRID_W);
	h = PASS_STR(14 * GUI_GRID_H);
};
class MiseryCooking_List_2: RscListBox
{
	idc = 1502;
	x = PASS_STR(-1.5 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(4.5 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(16.5 * GUI_GRID_W);
	h = PASS_STR(14 * GUI_GRID_H);
};
class MiseryCooking_Button: RscButton
{
	idc = 1600;
	text = "Cook"; 
	x = PASS_STR(35 * GUI_GRID_W + GUI_GRID_X);
	y = PASS_STR(12 * GUI_GRID_H + GUI_GRID_Y);
	w = PASS_STR(7.5 * GUI_GRID_W);
	h = PASS_STR(1.5 * GUI_GRID_H);
	sizeEx = PASS_STR((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
	font = "PuristaMedium";
	colorBackground[] = {0.2, 0.2, 0.2, 0.7};
	colorFocused[] = {0.5, 0.5, 0.5, 0.7};
	colorActive[] = {0.5, 0.5, 0.5, 0.7};
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Cooking\ProcessRecipe.sqf';";
};
class MiseryCooking_KnownRecipes: RscButton
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
	onButtonClick = "[] execVM 'Misery\Scripts\Survival\Functions\Menus\Cooking\ShowRecipe.sqf';";
};
class MiseryCooking_ExitButton: RscButton
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

//$[1.063,["Misery_CookingGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_CookingBG",[2,"",["4.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","33 * GUI_GRID_W","23.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"MiseryCooking_List_1",[2,"",["7 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_CookingPrompt",[2,"What would you like to craft?",["6.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryCooking_Button",[2,"Craft",["27.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"MiseryCooking_ItemSelectionTip",[2,"Blueprints:",["6.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryCooking_KnownRecipes",[2,"Show Recipe",["27.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1602,"MiseryCooking_ExitButton",[2,"Exit",["27.5 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"MiseryCooking_NoteBox",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_Cooking_Icon",[2,"\Misery\Scripts\Survival\Use\icons\Cooking.paa",["28.5 * GUI_GRID_W + GUI_GRID_X","3 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
