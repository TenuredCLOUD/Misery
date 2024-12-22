class CLASS(cookingFramework_ui)
{
    idd = 982379;
    onLoad = "[] execVM '\z\misery\addons\cooking\functions\fnc_RecipesListed.sqf'; [] execVM '\z\misery\addons\cooking\functions\fnc_Showicon.sqf';";

class ControlsBackground
{
class CLASS(cooking_background): CLASS(RscText)
{
    idc = -1;
    colorBackground[]={0.2,0.2,0.2,.7};
    x = QUOTE(-4.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(0.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(49 * GUI_GRID_W);
    h = QUOTE(24 * GUI_GRID_H);
};
class CLASS(cooking_prompt): RscText
{
    idc = -1;
    text = "What would you like to cook?";
    x = QUOTE(-4 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(0.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(22 * GUI_GRID_W);
    h = QUOTE(2.5 * GUI_GRID_H);
};
class CLASS(cooking_itemSelectionTip): RscText
{
    idc = -1;
    text = "Recipes:";
    x = QUOTE(16.66 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(2.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(6 * GUI_GRID_W);
    h = QUOTE(2.5 * GUI_GRID_H);
    sizeEx = 0.8 * GUI_GRID_H;
};
class CLASS(cooking_recipeTip): RscText
{
    idc = -1;
    text = "Requirements for Recipe:";
    x = QUOTE(-1.82 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(2.72 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(9.5 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    sizeEx = 0.8 * GUI_GRID_H;
};
class CLASS(cooking_noteBox): RscText
{
    idc = 1001;
    x = QUOTE(-3.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(19 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(46.5 * GUI_GRID_W);
    h = QUOTE(4 * GUI_GRID_H);
    sizeEx = 0.75 * GUI_GRID_H;
};
class CLASS(cooking_icon): RscPicture
{
    idc = 1501;
    text = QPATHTOEF(icons,data\boilwater_ca.paa);
    x = QUOTE(36.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(2 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(5.5 * GUI_GRID_W);
    h = QUOTE(3.5 * GUI_GRID_H);
};
};
class Controls
    {
class CLASS(cooking_list_1): RscListBox
{
    idc = 1500;
    x = QUOTE(17 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(4.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(16.5 * GUI_GRID_W);
    h = QUOTE(14 * GUI_GRID_H);
};
class CLASS(cooking_list_2): RscListBox
{
    idc = 1502;
    x = QUOTE(-1.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(4.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(16.5 * GUI_GRID_W);
    h = QUOTE(14 * GUI_GRID_H);
};
class CLASS(cooking_button): RscButton
{
    idc = 1600;
    text = "Cook";
    x = QUOTE(35 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(12 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(7.5 * GUI_GRID_W);
    h = QUOTE(1.5 * GUI_GRID_H);
    sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "[] execVM '\z\misery\addons\cooking\functions\fnc_ProcessRecipe.sqf';";
};
class CLASS(cooking_knownRecipes): RscButton
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
    onButtonClick = "[] execVM '\z\misery\addons\cooking\functions\fnc_ShowRecipe.sqf';";
};
class CLASS(cooking_exitButton): RscButton
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

//$[1.063,["Misery_CookingGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_CookingBG",[2,"",["4.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","33 * GUI_GRID_W","23.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"MiseryCooking_List_1",[2,"",["7 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_CookingPrompt",[2,"What would you like to craft?",["6.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryCooking_Button",[2,"Craft",["27.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"MiseryCooking_ItemSelectionTip",[2,"Blueprints:",["6.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryCooking_KnownRecipes",[2,"Show Recipe",["27.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1602,"MiseryCooking_ExitButton",[2,"Exit",["27.5 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"MiseryCooking_NoteBox",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_Cooking_Icon",[2,"\Use\icons\Cooking.paa",["28.5 * GUI_GRID_W + GUI_GRID_X","3 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
