class CLASS(craftingFramework_ui) {
    idd = 982376;
    onLoad = QUOTE([] call EFUNC(crafting,recipesListed); [] call EFUNC(crafting,showicon));

    class ControlsBackground {
        class CLASS(crafting_background): CLASS(RscText) {
            idc = -1;
            colorBackground[]={0.2,0.2,0.2,.7};
            x = -0.1125;
            y = 0.02;
            w = 0.02;
            h = 0.96;
        };
        class CLASS(crafting_prompt): RscText {
            idc = -1;
            text = "What would you like to craft?";
            x = -0.1;
            y = 0.02;
            w = 0.55;
            h = 0.1;
        };
        class CLASS(crafting_itemSelectionTip): RscText {
            idc = -1;
            text = "Blueprints:";
            x = 0.4165;
            y = 0.1;
            w = 0.15;
            h = 0.1;
            sizeEx = 0.8 * GUI_GRID_H;
        };
        class CLASS(crafting_recipeTip): RscText {
            idc = -1;
            text = "Recipe for Blueprint:";
            x = -0.0455;
            y = 0.1088;
            w = 0.2375;
            h = 0.08;
            sizeEx = 0.8 * GUI_GRID_H;
        };
        class CLASS(crafting_noteBox): RscText {
            idc = 1001;
            x = -0.0875;
            y = 0.76;
            w = 1.1625;
            h = 0.16;
            sizeEx = 0.75 * GUI_GRID_H;
        };
        class CLASS(crafting_icon): RscPicture {
            idc = 1501;
            text = QPATHTOEF(icons,data\crafting_ca.paa);
            x = 0.9125;
            y = 0.08;
            w = 0.1375;
            h = 0.14;
        };
    };
    class Controls {
        class CLASS(crafting_list_1): RscListBox {
            idc = 1500;
            x = 0.425;
            y = 0.18;
            w = 0.4125;
            h = 0.56;
        };
        class CLASS(crafting_list_2): RscListBox {
            idc = 1502;
            x = -0.0375;
            y = 0.18;
            w = 0.4125;
            h = 0.56;
        };
        class CLASS(crafting_button): RscButton {
            idc = 1600;
            text = "Craft";
            x = 0.875;
            y = 0.48;
            w = 0.1875;
            h = 0.06;
            sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
            font = "PuristaMedium";
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(crafting,processItems));
        };
        class CLASS(crafting_knownRecipes): RscButton {
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
            onButtonClick = QUOTE([] call EFUNC(crafting,showRecipe));
        };
        class CLASS(crafting_exitButton): RscButton {
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

//$[1.063,[QCLASS(CraftingGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(CraftingBG",[2,"",["-4.5 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","49 * GUI_GRID_W","24 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"MiseryCrafting_List_1",[2,"",["17 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(CraftingPrompt",[2,"What would you like to craft?",["-4 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryCrafting_Button",[2,"Craft",["35 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"MiseryCrafting_ItemSelectionTip",[2,"Blueprints:",["16.66 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryCrafting_KnownRecipes",[2,"Show Recipe",["35 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1602,"MiseryCrafting_ExitButton",[2,"Exit",["35 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"MiseryCrafting_NoteBox",[2,"",["-3.5 * GUI_GRID_W + GUI_GRID_X","19 * GUI_GRID_H + GUI_GRID_Y","46.5 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,QCLASS(Crafting_Icon",[2,"\Use\icons\crafting.paa",["36.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1003,"MiseryCrafting_RecipeTip",[2,"Recipe for Blueprint:",["-1.82 * GUI_GRID_W + GUI_GRID_X","2.72 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1502,"MiseryCrafting_List_2",[2,"",["-1.5 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

