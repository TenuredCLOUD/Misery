class CLASS(cookingFramework_ui) {
    idd = 982379;
    onLoad = QUOTE([] call EFUNC(cooking,recipesListed); [] call EFUNC(cooking,showicon));

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

//$[1.063,[QCLASS(CookingGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(CookingBG",[2,"",["4.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","33 * GUI_GRID_W","23.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"MiseryCooking_List_1",[2,"",["7 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(CookingPrompt",[2,"What would you like to craft?",["6.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryCooking_Button",[2,"Craft",["27.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"MiseryCooking_ItemSelectionTip",[2,"Blueprints:",["6.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryCooking_KnownRecipes",[2,"Show Recipe",["27.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1602,"MiseryCooking_ExitButton",[2,"Exit",["27.5 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"MiseryCooking_NoteBox",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,QCLASS(Cooking_Icon",[2,"\Use\icons\Cooking.paa",["28.5 * GUI_GRID_W + GUI_GRID_X","3 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
