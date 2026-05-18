class CLASS(sleepMenu_ui) {
    idd = 982374;
    onLoad = QUOTE([982374] call EFUNC(common,menuBlurEffect); player setVariable [ARR_2(QUOTE(QGVAR(sleepDataVal)),0)]);

    class ControlsBackground {
        class CLASS(sleepMenu_background): CLASS(RscText) {
            idc = -1;
            x = 6.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 26 * GUI_GRID_W;
            h = 13 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(sleepMenu_prompt): RscText {
            idc = -1;
            text = ECSTRING(sleep,Prompt);
            x = 6.81 * GUI_GRID_W + GUI_GRID_X;
            y = 2.22 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(sleepMenu_warningTip): RscText {
            idc = -1;
            text = ECSTRING(sleep,Tip);
            x = 6.75 * GUI_GRID_W + GUI_GRID_X;
            y = 12.33 * GUI_GRID_H + GUI_GRID_Y;
            w = 26 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };

    class Controls {
        class CLASS(sleepMenu_button): RscButton {
            idc = -1;
            x = 16.41 * GUI_GRID_W + GUI_GRID_X;
            y = 10.63 * GUI_GRID_H + GUI_GRID_Y;
            w = 6.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            text = ECSTRING(sleep,Button);
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([player] call EFUNC(sleep,processSleep); closeDialog 2);
        };
        class CLASS(sleepMenu_list_1): RscCombo {
            idc = 982375;
            x = 13.74 * GUI_GRID_W + GUI_GRID_X;
            y = 7.03 * GUI_GRID_H + GUI_GRID_Y;
            w = 12 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onLBSelChanged = QUOTE(_this call EFUNC(sleep,hourSelected));

            class Items {
                class CLASS(1hour) {
                    text = ECSTRING(sleep,1Hour);
                    color[] = {1, 1, 1, 1};
                    value = 1;
                };
                class CLASS(2hour) {
                    text = ECSTRING(sleep,2Hours);
                    color[] = {1, 1, 1, 1};
                    value = 2;
                };
                class CLASS(3hour) {
                    text = ECSTRING(sleep,3Hours);
                    color[] = {1, 1, 1, 1};
                    value = 3;
                };
                class CLASS(4hour) {
                    text = ECSTRING(sleep,4Hours);
                    color[] = {1, 1, 1, 1};
                    value = 4;
                };
                class CLASS(5hour) {
                    text = ECSTRING(sleep,5Hours);
                    color[] = {1, 1, 1, 1};
                    value = 5;
                };
                class CLASS(6hour) {
                    text = ECSTRING(sleep,6Hours);
                    color[] = {1, 1, 1, 1};
                    value = 6;
                };
                class CLASS(7hour) {
                    text = ECSTRING(sleep,7Hours);
                    color[] = {1, 1, 1, 1};
                    value = 7;
                };
                class CLASS(8hour) {
                    text = ECSTRING(sleep,8Hours);
                    color[] = {1, 1, 1, 1};
                    value = 8;
                };
                class CLASS(9hour) {
                    text = ECSTRING(sleep,9Hours);
                    color[] = {1, 1, 1, 1};
                    value = 9;
                };
                class CLASS(10hour) {
                    text = ECSTRING(sleep,10Hours);
                    color[] = {1, 1, 1, 1};
                    value = 10;
                };
                class CLASS(11hour) {
                    text = ECSTRING(sleep,11Hours);
                    color[] = {1, 1, 1, 1};
                    value = 11;
                };
                class CLASS(12hour) {
                    text = ECSTRING(sleep,12Hours);
                    color[] = {1, 1, 1, 1};
                    value = 12;
                };
            };
        };
    };
};
