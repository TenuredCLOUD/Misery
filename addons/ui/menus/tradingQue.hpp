class CLASS(tradingQue_ui) {
    idd = 270586;
    onLoad = QUOTE([] call EFUNC(traders,waitQueue));

    class ControlsBackground {
        class CLASS(tradingQue_background): CLASS(RscText) {
            idc = 1800;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 14.5 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(tradingQue_notif): RscText {
            idc = 1000;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 8 * GUI_GRID_H + GUI_GRID_Y;
            w = 41 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(tradingQue_prompt): RscText {
            idc = 1001;
            text = "You are in a waiting queue..."; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 35.5 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls {
        class CLASS(tradingQue_cancel): RscButton {
            idc = 1600;
            text = "Leave Queue"; //--- ToDo: Localize;
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE(call EFUNC(traders,leaveQue); closeDialog 2);
        };
    };
};
