class CLASS(craftingFramework_ui)
{
    idd = 982376;
    onLoad = "[] execVM '\z\misery\addons\crafting\functions\fnc_RecipesListed.sqf'; [] execVM '\z\misery\addons\crafting\functions\fnc_Showicon.sqf';";

class ControlsBackground
{
class CLASS(crafting_background): CLASS(RscText)
{
    idc = -1;
    colorBackground[]={0.2,0.2,0.2,.7};
    x = QUOTE(-4.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(0.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(49 * GUI_GRID_W);
    h = QUOTE(24 * GUI_GRID_H);
};
class CLASS(crafting_prompt): RscText
{
    idc = -1;
    text = "What would you like to craft?";
    x = QUOTE(-4 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(0.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(22 * GUI_GRID_W);
    h = QUOTE(2.5 * GUI_GRID_H);
};
class CLASS(crafting_itemSelectionTip): RscText
{
    idc = -1;
    text = "Blueprints:";
    x = QUOTE(16.66 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(2.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(6 * GUI_GRID_W);
    h = QUOTE(2.5 * GUI_GRID_H);
    sizeEx = 0.8 * GUI_GRID_H;
};
class CLASS(crafting_recipeTip): RscText
{
    idc = -1;
    text = "Recipe for Blueprint:";
    x = QUOTE(-1.82 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(2.72 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(9.5 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    sizeEx = 0.8 * GUI_GRID_H;
};
class CLASS(crafting_noteBox): RscText
{
    idc = 1001;
    x = QUOTE(-3.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(19 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(46.5 * GUI_GRID_W);
    h = QUOTE(4 * GUI_GRID_H);
    sizeEx = 0.75 * GUI_GRID_H;
};
class CLASS(crafting_icon): RscPicture
{
    idc = 1501;
    text = QPATHTOEF(icons,data\crafting_ca.paa);
    x = QUOTE(36.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(2 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(5.5 * GUI_GRID_W);
    h = QUOTE(3.5 * GUI_GRID_H);
};
};
class Controls
    {
class CLASS(crafting_list_1): RscListBox
{
    idc = 1500;
    x = QUOTE(17 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(4.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(16.5 * GUI_GRID_W);
    h = QUOTE(14 * GUI_GRID_H);
};
class CLASS(crafting_list_2): RscListBox
{
    idc = 1502;
    x = QUOTE(-1.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(4.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(16.5 * GUI_GRID_W);
    h = QUOTE(14 * GUI_GRID_H);
};
class CLASS(crafting_button): RscButton
{
    idc = 1600;
    text = "Craft";
    x = QUOTE(35 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(12 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(7.5 * GUI_GRID_W);
    h = QUOTE(1.5 * GUI_GRID_H);
    sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "[] execVM '\z\misery\addons\crafting\functions\fnc_ProcessItems.sqf';";
};
class CLASS(crafting_knownRecipes): RscButton
{
    idc = 1601;
    text = "Show Recipe";
    x = QUOTE(35 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(14.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(7.5 * GUI_GRID_W);
    h = QUOTE(1.5 * GUI_GRID_H);
    sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "[] execVM '\z\misery\addons\crafting\functions\fnc_ShowRecipe.sqf';";
};
class CLASS(crafting_exitButton): RscButton
{
    idc = 1602;
    text = "Exit";
    x = QUOTE(35 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(17 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(7.5 * GUI_GRID_W);
    h = QUOTE(1.5 * GUI_GRID_H);
    sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "closeDialog 2;";
};
    };
        };

//$[1.063,["Misery_CraftingGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_CraftingBG",[2,"",["-4.5 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","49 * GUI_GRID_W","24 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"MiseryCrafting_List_1",[2,"",["17 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_CraftingPrompt",[2,"What would you like to craft?",["-4 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryCrafting_Button",[2,"Craft",["35 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"MiseryCrafting_ItemSelectionTip",[2,"Blueprints:",["16.66 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryCrafting_KnownRecipes",[2,"Show Recipe",["35 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1602,"MiseryCrafting_ExitButton",[2,"Exit",["35 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"MiseryCrafting_NoteBox",[2,"",["-3.5 * GUI_GRID_W + GUI_GRID_X","19 * GUI_GRID_H + GUI_GRID_Y","46.5 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_Crafting_Icon",[2,"\Use\icons\crafting.paa",["36.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1003,"MiseryCrafting_RecipeTip",[2,"Recipe for Blueprint:",["-1.82 * GUI_GRID_W + GUI_GRID_X","2.72 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1502,"MiseryCrafting_List_2",[2,"",["-1.5 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

