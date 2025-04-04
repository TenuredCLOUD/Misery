class CLASS(hydrology_ui)
{
    idd = 982380;
    onLoad = QUOTE([] call EFUNC(hydrology,containersListed); [] call EFUNC(hydrology,icon));

    class ControlsBackground
    {
        class CLASS(hydrology_background): CLASS(RscText)
        {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
        };
        class CLASS(hydrology_itemSelectionTip): RscText
        {
            idc = -1;
            text = "Containers:"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            font = UI_MACRO_FONT;
        };
        class CLASS(hydrology_prompt): RscText
        {
            idc = -1;
            text = "What container would you like to fill?"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            font = UI_MACRO_FONT;
        };
        class CLASS(hydrology_icon): RscPicture
        {
            idc = 1200;
            text = QPATHTOEF(icons,data\well_ca.paa);
            x = 28.5 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
    };

    class Controls
    {
        class CLASS(hydrology_list_1): RscListBox
        {
            idc = 1500;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 14 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            font = UI_MACRO_FONT;
        };
        class CLASS(hydrology_FillContainer_Button): RscButton
        {
            idc = 1600;
            text = "Fill container"; //--- ToDo: Localize;
            x = 19 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(hydrology,processFill));
            sizeEx = 0.7 * GUI_GRID_H;
            font = UI_MACRO_FONT;
        };
        class CLASS(hydrology_drinkFromSource_Button): RscButton
        {
            idc = 1601;
            text = "Drink from source"; //--- ToDo: Localize;
            x = 18.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(hydrology,drinkFromSource));
            sizeEx = 0.7 * GUI_GRID_H;
            font = UI_MACRO_FONT;
        };
        class CLASS(hydrology_exit): RscButton
        {
            idc = 1602;
            text = "Exit";
            x = 19 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE(closeDialog 2);
            sizeEx = 0.7 * GUI_GRID_H;
            font = UI_MACRO_FONT;
        };
        class CLASS(hydrology_noteBox): RscText
        {
            idc = 1001;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            font = UI_MACRO_FONT;
        };
        class CLASS(hydrology_progressBar): CLASS(RscProgress)
        {
            idc = 1010;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
    };
};
