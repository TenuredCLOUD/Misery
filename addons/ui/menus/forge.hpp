class CLASS(forge_ui)
{
    idd = 982388;
    onLoad = QUOTE([982388] call EFUNC(common,menuBlurEffect); [] call EFUNC(forge,outputsListed); [] call EFUNC(forge,showFuel));

    class ControlsBackground
    {
        class CLASS(forge_background): CLASS(RscText)
        {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
        };
        class CLASS(forge_itemSelectionTip): RscText
        {
            idc = -1;
            text = "Smelting recipes:"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(forge_prompt): RscText
        {
            idc = -1;
            text = "What would you like to smelt?"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(forge_icon): RscPicture
        {
            idc = 1200;
            text = QPATHTOEF(icons,data\ingot_ca.paa);
            x = 33 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
    };

    class Controls
    {
        class CLASS(forge_list_1): RscListBox
        {
            idc = 1500;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 14 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(forge_FillContainer_Button): RscButton
        {
            idc = 1600;
            text = "Smelt"; //--- ToDo: Localize;
            x = 19 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(forge,processSmelt));
        };
        class CLASS(forge_showOutput): RscButton
        {
            idc = 1603;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(forge,showRecipe));
            text = "Show Recipe"; //--- ToDo: Localize;
            x = 19 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
        };
        class CLASS(forge_refuel): RscButton
        {
            idc = 1604;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(forge,refuel));
            text = "Add fuel"; //--- ToDo: Localize;
            x = 19 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
        };
        class CLASS(forge_exit): RscButton
        {
            idc = 1602;
            text = "Exit";
            x = 31.5 * GUI_GRID_W + GUI_GRID_X;
            y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE(closeDialog 2);
        };
        class CLASS(forge_noteBox): RscText
        {
            idc = 1001;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(forge_progressBar): CLASS(RscProgress)
        {
            idc = 1010;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class CLASS(forge_fuelProgressBar): CLASS(RscProgress)
        {
            idc = 1011;
            x = 31.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(forge_fuelPrompt): RscText
        {
            idc = 1012;
            text = "Fuel:"; //--- ToDo: Localize;
            x = 28.69 * GUI_GRID_W + GUI_GRID_X;
            y = 6.16 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};

