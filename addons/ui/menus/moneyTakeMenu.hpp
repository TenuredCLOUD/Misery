class CLASS(moneyTake_ui)
{
    idd = 358492;
    onLoad = QUOTE([358492] call EFUNC(common,menuBlurEffect); [] call EFUNC(currency,takeMoneyRefresh));
    onUnload = QUOTE(player playAction '');

    class ControlsBackground
    {
        class CLASS(moneyTakeMenu_background): CLASS(RscText)
        {
            idc = -1;
            x = 3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 33 * GUI_GRID_W;
            h = 8 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(moneyTakeMenu_prompt): RscText
        {
            idc = 1000;
            text = "Take funds"; //--- ToDo: Localize;
            x = 4 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls
    {
        class CLASS(moneyTakeMenu_inputBox): RscEdit
        {
            idc = 1400;
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 8 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(moneyTakeMenu_take): RscButton
        {
            idc = 1600;
            onButtonClick = QUOTE([] call EFUNC(currency,takeMoney));
            text = "Take"; //--- ToDo: Localize;
            x = 14.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(moneyTakeMenu_objectsFunds): RscText
        {
            idc = 1001;
            x = 22.65 * GUI_GRID_W + GUI_GRID_X;
            y = 7.59 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(moneyTakeMenu_playersFunds): RscText
        {
            idc = 1002;
            x = 23.23 * GUI_GRID_W + GUI_GRID_X;
            y = 5.75 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};

