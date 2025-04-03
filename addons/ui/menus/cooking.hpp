class CLASS(cookingFramework_ui) {
    idd = 982379;
    onLoad = QUOTE([] call EFUNC(cooking,recipesListed); [] call EFUNC(cooking,showIcon));

    class ControlsBackground {
        class CLASS(cooking_background): CLASS(RscText) {
            idc = -1;
            colorBackground[]={0.2,0.2,0.2,.7};
            x = -0.1125;
            y = 0.02;
            w = 0.02;
            h = 0.96;
        };
        class CLASS(cooking_prompt): RscText {
            idc = -1;
            text = "What would you like to cook?";
            x = -0.1;
            y = 0.02;
            w = 0.55;
            h = 0.1;
        };
        class CLASS(cooking_itemSelectionTip): RscText {
            idc = -1;
            text = "Recipes:";
            x = 0.4165;
            y = 0.1;
            w = 0.15;
            h = 0.1;
            sizeEx = 0.8 * GUI_GRID_H;
        };
        class CLASS(cooking_recipeTip): RscText {
            idc = -1;
            text = "Requirements for Recipe:";
            x = -0.0455;
            y = 0.1088;
            w = 0.2375;
            h = 0.08;
            sizeEx = 0.8 * GUI_GRID_H;
        };
        class CLASS(cooking_noteBox): RscText {
            idc = 1001;
            x = -0.0875;
            y = 0.76;
            w = 1.1625;
            h = 0.16;
            sizeEx = 0.75 * GUI_GRID_H;
        };
        class CLASS(cooking_icon): RscPicture {
            idc = 1501;
            text = QPATHTOEF(icons,data\boilwater_ca.paa);
            x = 0.9125;
            y = 0.08;
            w = 0.1375;
            h = 0.14;
        };
    };
    class Controls {
        class CLASS(cooking_list_1): RscListBox {
            idc = 1500;
            x = 0.425;
            y = 0.18;
            w = 0.4125;
            h = 0.56;
        };
        class CLASS(cooking_list_2): RscListBox {
            idc = 1502;
            x = -0.0375;
            y = 0.18;
            w = 0.4125;
            h = 0.56;
        };
        class CLASS(cooking_button): RscButton {
            idc = 1600;
            text = "Cook";
            x = 0.875;
            y = 0.48;
            w = 0.1875;
            h = 0.06;
            sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
            font = "PuristaMedium";
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(cooking,processRecipe));
        };
        class CLASS(cooking_knownRecipes): RscButton {
            idc = 1601;
            text = "Show Recipe";
            x = 0.875;
            y = 0.58;
            w = 0.1875;
            h = 0.06;
            sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
            font = "PuristaMedium";
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(cooking,showRecipe));
        };
        class CLASS(cooking_exitButton): RscButton {
            idc = 1602;
            text = "Exit";
            x = 0.875;
            y = 0.68;
            w = 0.1875;
            h = 0.06;
            sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
            font = "PuristaMedium";
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE(closeDialog 2);
        };
    };
};

//$[1.063,["Misery_cooking_ui",[[0,0,1,1],0.025,0.04,"GUI_GRID"],4,0,0],[1000,"misery_cooking_background: misery_RscText",[2,"",["-0.12 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","41.5 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],[1001,"misery_cooking_prompt",[2,"What would you like to cook?",["0.08 * GUI_GRID_W + GUI_GRID_X","0.25 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"misery_cooking_itemSelectionTip",[2,"Blueprints:",["1 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"misery_cooking_noteBox",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1001;"]],[1200,"misery_cooking_icon",[2,"\z\misery\addons\icons\data\cooking_ca.paa",["29.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","6.5 * GUI_GRID_W","5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1501;"]],[1005,"misery_cooking_list_1: RscListBox",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1500;"]],[1600,"misery_cooking_button",[2,"cook",["20.5 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[0.5,0.5,0.5,0.7],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 1600;","colorFocused[] = {0.5,0.5,0.5,0.7};","onButtonClick = |[] call misery_cooking_fnc_processItems|;"]],[1601,"misery_cooking_knownRecipes",[2,"Show Recipe",["20.5 * GUI_GRID_W + GUI_GRID_X","13 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[0.5,0.5,0.5,0.7],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 1601;","colorFocused[] = {0.5,0.5,0.5,0.7};","onButtonClick = |[] call misery_cooking_fnc_showRecipe|;"]],[1602,"misery_cooking_exitButton",[2,"Exit",["20.5 * GUI_GRID_W + GUI_GRID_X","15.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[0.5,0.5,0.5,0.7],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 1602;","colorFocused[] = {0.5,0.5,0.5,0.7};","onButtonClick = |closeDialog 2|;"]]]
