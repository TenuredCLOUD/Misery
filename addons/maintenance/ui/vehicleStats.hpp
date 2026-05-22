class CLASS(vehicleStats_ui) {
    idd = 982400;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QEGVAR(maintenance,vehicleStats_ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

    class ControlsBackground {
        class CLASS(vehicle_background): CLASS(RscText) {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 42.5 * GUI_GRID_W + GUI_GRID_X;
            y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 24.5 * GUI_GRID_W;
            h = 5.5 * GUI_GRID_H;
        };
    };
    class Controls {
        class CLASS(vehicle_powerIcon): RscText {
            idc = 2001;
            text = ECSTRING(maintenance,PowerLabel);
            x = 42.5 * GUI_GRID_W + GUI_GRID_X;
            y = 30 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vehicle_oilIcon): RscText {
            idc = 2002;
            text = ECSTRING(maintenance,OilLabel);
            x = 42.5 * GUI_GRID_W + GUI_GRID_X;
            y = 31 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vehicle_waterIcon): RscText {
            idc = 2003;
            text = ECSTRING(maintenance,CoolantLabel);
            x = 42.5 * GUI_GRID_W + GUI_GRID_X;
            y = 32 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vehicle_powerProgressBar): CLASS(RscProgress) {
            idc = 1802;
            x = 47 * GUI_GRID_W + GUI_GRID_X;
            y = 30.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vehicle_oilProgressBar): CLASS(RscProgress) {
            idc = 1803;
            x = 47 * GUI_GRID_W + GUI_GRID_X;
            y = 31.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vehicle_waterProgressBar): CLASS(RscProgress) {
            idc = 1804;
            x = 47 * GUI_GRID_W + GUI_GRID_X;
            y = 32.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vehicle_batteries): RscText {
            idc = 1002;
            x = 57 * GUI_GRID_W + GUI_GRID_X;
            y = 29 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};


