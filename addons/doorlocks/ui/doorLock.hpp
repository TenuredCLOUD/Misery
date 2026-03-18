class CLASS(doorLock_ui) {
    idd = 696677;
    onLoad = QUOTE([696677] call EFUNC(common,menuBlurEffect));

    class ControlsBackground {
        class misery_doorLock_background: misery_RscText
        {
            idc = -1;
            x = 12 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 16 * GUI_GRID_W;
            h = 8 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class misery_doorLock_prompt: RscText
        {
            idc = 1000;
            text = "PIN Entry:"; //--- ToDo: Localize;
            x = 12.5 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls {
        class misery_doorLock_inputBox: RscEdit
        {
            idc = 1400;
            x = 16 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class misery_doorLock_enter: RscButton
        {
            idc = 1600;
            text = "Enter"; //--- ToDo: Localize;
            x = 16 * GUI_GRID_W + GUI_GRID_X;
            y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
        };
    };
};

