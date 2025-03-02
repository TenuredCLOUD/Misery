class CLASS(craftingFramework_ui)
{
    idd = 982376;
    onLoad = QUOTE([] call EFUNC(crafting,recipesListed); [] call EFUNC(crafting,showIcon));

    class ControlsBackground
    {
        class CLASS(crafting_background): CLASS(RscText)
        {
            idc = -1;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            x = QUOTE(-0.12 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(0 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(41.5 * GUI_GRID_W);
            h = QUOTE(25 * GUI_GRID_H);
        };
        class CLASS(crafting_prompt): RscText
        {
            idc = -1;
            text = "What would you like to craft?";
            x = QUOTE(0.08 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(0.25 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(22 * GUI_GRID_W);
            h = QUOTE(2.5 * GUI_GRID_H);
        };
        class CLASS(crafting_itemSelectionTip): RscText
        {
            idc = -1;
            text = "Blueprints:";
            x = QUOTE(1 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(2.5 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(9.5 * GUI_GRID_W);
            h = QUOTE(2.5 * GUI_GRID_H);
        };
        class CLASS(crafting_noteBox): RscText
        {
            idc = 1001;
            x = QUOTE(0.5 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(19.5 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(40 * GUI_GRID_W);
            h = QUOTE(4 * GUI_GRID_H);
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(crafting_icon): RscPicture
        {
            idc = 1501;
            text = QPATHTOEF(icons,data\crafting_ca.paa);
            x = QUOTE(27 * GUI_GRID_W + GUI_GRID_X);
	        y = QUOTE(3 * GUI_GRID_H + GUI_GRID_Y);
	        w = QUOTE(5.5 * GUI_GRID_W);
	        h = QUOTE(4 * GUI_GRID_H);
        };
    };
    class Controls
    {
        class CLASS(crafting_list_1): RscListBox
        {
            idc = 1500;
            x = QUOTE(1 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(5 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(16.5 * GUI_GRID_W);
            h = QUOTE(14 * GUI_GRID_H);
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(crafting_button): RscButton
        {
            idc = 1600;
            text = "Craft";
            x = QUOTE(20.5 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(10.5 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(7.5 * GUI_GRID_W);
            h = QUOTE(1.5 * GUI_GRID_H);
            sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
            font = UI_MACRO_FONT;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(crafting,processItems));
        };
        class CLASS(crafting_knownRecipes): RscButton
        {
            idc = 1601;
            text = "Show Recipe";
            x = QUOTE(20.5 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(13 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(7.5 * GUI_GRID_W);
            h = QUOTE(1.5 * GUI_GRID_H);
            sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
            font = UI_MACRO_FONT;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(crafting,showRecipe));
        };
        class CLASS(crafting_exitButton): RscButton
        {
            idc = 1602;
            text = "Exit";
            x = QUOTE(20.5 * GUI_GRID_W + GUI_GRID_X);
            y = QUOTE(15.5 * GUI_GRID_H + GUI_GRID_Y);
            w = QUOTE(7.5 * GUI_GRID_W);
            h = QUOTE(1.5 * GUI_GRID_H);
            sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
            font = UI_MACRO_FONT;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE(closeDialog 2);
        };
    };
};

//$[1.063,["Misery_crafting_ui",[[0,0,1,1],0.025,0.04,"GUI_GRID"],4,0,0],[1000,"misery_crafting_background: misery_RscText",[2,"",["-0.12 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","41.5 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],[1001,"misery_crafting_prompt",[2,"What would you like to craft?",["0.08 * GUI_GRID_W + GUI_GRID_X","0.25 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"misery_crafting_itemSelectionTip",[2,"Blueprints:",["1 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"misery_crafting_noteBox",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1001;"]],[1200,"misery_crafting_icon",[2,"\z\misery\addons\icons\data\crafting_ca.paa",["29.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","6.5 * GUI_GRID_W","5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1501;"]],[1005,"misery_crafting_list_1: RscListBox",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1500;"]],[1600,"misery_crafting_button",[2,"Craft",["20.5 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[0.5,0.5,0.5,0.7],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 1600;","colorFocused[] = {0.5,0.5,0.5,0.7};","onButtonClick = |[] call misery_crafting_fnc_processItems|;"]],[1601,"misery_crafting_knownRecipes",[2,"Show Recipe",["20.5 * GUI_GRID_W + GUI_GRID_X","13 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[0.5,0.5,0.5,0.7],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 1601;","colorFocused[] = {0.5,0.5,0.5,0.7};","onButtonClick = |[] call misery_crafting_fnc_showRecipe|;"]],[1602,"misery_crafting_exitButton",[2,"Exit",["20.5 * GUI_GRID_W + GUI_GRID_X","15.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[0.5,0.5,0.5,0.7],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 1602;","colorFocused[] = {0.5,0.5,0.5,0.7};","onButtonClick = |closeDialog 2|;"]]]
