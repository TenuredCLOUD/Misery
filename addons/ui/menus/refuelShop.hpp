class CLASS(refuelShop_ui)
{
    idd = 982384;
    onLoad = QUOTE([982384] call EFUNC(common,menuBlurEffect); [] call EFUNC(refuel,listed); [] call EFUNC(refuel,icon));

    class ControlsBackground
    {
        class CLASS(refuelShop_background): CLASS(RscText)
        {
            idc = -1;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(refuelShop_prompt): RscText
        {
            idc = -1;
            text = "Vehicle Refuel";
            x = 1.6 * GUI_GRID_W + GUI_GRID_X;
            y = 0.24 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(refuelShop_icon): RscPicture
        {
            idc = 1602;
            x = 31.5 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class CLASS(refuelShop_name): RscText
        {
            idc = 1603;
            x = 29.52 * GUI_GRID_W + GUI_GRID_X;
            y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };

    class Controls
    {
        class CLASS(refuelShop_list): RscListBox
        {
            idc = 1500;
            x = 1.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 12.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(refuelShop_purchase): RscButton
        {
            idc = 1600;
            text = "Purchase";
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(refuel,process));
        };
        class CLASS(refuelShop_exit): RscButton
        {
            idc = 1601;
            text = "Exit";
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(refuel,exit));
        };
        class CLASS(refuelShop_infoBox): RscText
        {
            idc = 1001;
            x = 1.5 * GUI_GRID_W + GUI_GRID_X;
            y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 37.5 * GUI_GRID_W;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
