class CLASS(cache_ui) {
    idd = 483730;
    onLoad = QUOTE([483730] call EFUNC(common,menuBlurEffect));
    onUnload = QUOTE(call EFUNC(currency,exitCache));

    class ControlsBackground {
        class CLASS(cache_background): CLASS(RscText) {
            idc = -1;
            x = -0.04 * GUI_GRID_W + GUI_GRID_X;
            y = 4.83 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 15.5 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(cache_prompt): RscText {
            idc = -1;
            text = ECSTRING(currency,MoneyCache);
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls {
        class CLASS(cache_playerWallet): RscText {
            idc = 1001;
            x = 26 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cache_playerBank): RscText {
            idc = 1002;
            x = 26 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cache_inputBox_funds): RscText {
            idc = 1004;
            x = 21.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 14 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cache_stash): RscButton {
            idc = 1600;
            onButtonClick = QUOTE([] call EFUNC(currency,cacheStore));
            text = "Store";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cache_take): RscButton {
            idc = 1601;
            onButtonClick = QUOTE([] call EFUNC(currency,cacheTake));
            text = "Take";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cache_remove): RscButton
        {
            idc = 1602;
            onButtonClick = QUOTE([] call EFUNC(currency,removeCache));
            text = "Remove";
            x = 31.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorFocused[] = {0.5,0.5,0.5,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(cache_inputBox): RscEdit {
            idc = 1400;
            x = 10.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
