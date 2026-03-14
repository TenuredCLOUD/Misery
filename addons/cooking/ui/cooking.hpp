class CLASS(cookingFramework_ui) {
    idd = 982379;
    onLoad = QUOTE([982379] call EFUNC(common,menuBlurEffect); [] call EFUNC(cooking,recipesListed); [] call EFUNC(cooking,showIcon));

    class ControlsBackground {
        class CLASS(crafting_background): CLASS(RscText) {
            idc = -1;
            x = -4 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 47.5 * GUI_GRID_W;
            h = 26 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(cooking_prompt): RscText {
            idc = -1;
            text = "What would you like to cook?"; //--- ToDo: Localize;
            x = -3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cooking_itemSelectionTip): RscText {
            idc = -1;
            text = "Recipes:"; //--- ToDo: Localize;
            x = -3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cooking_noteBox): RscText {
            idc = 1001;
            x = -3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 20 * GUI_GRID_H + GUI_GRID_Y;
            w = 46.5 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cooking_icon): RscPicture {
            idc = 1501;
            text = QPATHTOEF(icons,data\cooking_ca.paa);
            x = 29 * GUI_GRID_W + GUI_GRID_X;
            y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
    };
    class Controls {
        class CLASS(cooking_list_1): RscListBox {
            idc = 1500;
            x = -3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 14 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cooking_button): RscButton {
            idc = 1600;
            text = "Cook";
            x = 16.5 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(cooking,processRecipe));
        };
        class CLASS(cooking_knownRecipes): RscButton {
            idc = 1601;
            text = "Show Recipe";
            x = 16.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(cooking,showRecipe));
        };
        class CLASS(cooking_exitButton): RscButton {
            idc = 1602;
            text = "Exit";
            x = 16.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE(closeDialog 2);
        };
        class CLASS(cooking_progressBar): CLASS(RscProgress) {
            idc = 1010;
            x = -3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 46.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
    };
};
