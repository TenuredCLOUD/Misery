class CLASS(vehicleStats_ui)
{
    idd = 982400;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QEGVAR(maintenance,vehicleStats_ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

    class ControlsBackground
    {
        class CLASS(vehicle_background): CLASS(RscText)
        {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 45 * GUI_GRID_W + GUI_GRID_X;
            y = 29.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 18.5 * GUI_GRID_W;
            h = 4.5 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class CLASS(vehicle_name): RscText
        {
            idc = 1000;
            text = ""; //--- ToDo: Localize;
            x = 45 * GUI_GRID_W + GUI_GRID_X;
            y = 27.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 10.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vehicle_fuelIcon): RscPicture
        {
            idc = 2000;
            text = QUOTE(a3\ui_f\data\igui\cfg\cursors\iconrefuelat_ca.paa);
            x = 45.5 * GUI_GRID_W + GUI_GRID_X;
            y = 32 * GUI_GRID_H + GUI_GRID_Y;
            w = 2.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class CLASS(vehicle_powerIcon): RscPicture
        {
            idc = 2001;
            text = QUOTE(a3\modules_f_curator\data\portraitlightning_ca.paa);
            x = 48.26 * GUI_GRID_W + GUI_GRID_X;
            y = 32.33 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class CLASS(vehicle_oilIcon): RscPicture
        {
            idc = 2002;
            text = QPATHTOEF(icons,data\engineOil_ca.paa);
            x = 50.51 * GUI_GRID_W + GUI_GRID_X;
            y = 31.85 * GUI_GRID_H + GUI_GRID_Y;
            w = 2 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class CLASS(vehicle_waterIcon): RscPicture
        {
            idc = 2003;
            text = QPATHTOEF(icons,data\waterDrop_ca.paa);
            x = 53.6 * GUI_GRID_W + GUI_GRID_X;
            y = 32.26 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class CLASS(vehicle_fuelProgressBar): CLASS(RscProgress_V)
        {
            idc = 1801;
            x = 47.5 * GUI_GRID_W + GUI_GRID_X;
            y = 29.82 * GUI_GRID_H + GUI_GRID_Y;
            w = 0.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class CLASS(vehicle_powerProgressBar): CLASS(RscProgress_V)
        {
            idc = 1802;
            x = 49.95 * GUI_GRID_W + GUI_GRID_X;
            y = 29.82 * GUI_GRID_H + GUI_GRID_Y;
            w = 0.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class CLASS(vehicle_oilProgressBar): CLASS(RscProgress_V)
        {
            idc = 1803;
            x = 52.55 * GUI_GRID_W + GUI_GRID_X;
            y = 29.83 * GUI_GRID_H + GUI_GRID_Y;
            w = 0.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class CLASS(vehicle_waterProgressBar): CLASS(RscProgress_V)
        {
            idc = 1804;
            x = 55.19 * GUI_GRID_W + GUI_GRID_X;
            y = 29.83 * GUI_GRID_H + GUI_GRID_Y;
            w = 0.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class CLASS(vehicle_speed): RscText
        {
            idc = 1001;
            text = ""; //--- ToDo: Localize;
            x = 57.5 * GUI_GRID_W + GUI_GRID_X;
            y = 31.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vehicle_batteries): RscText
        {
            idc = 1002;
            text = ""; //--- ToDo: Localize;
            x = 56.5 * GUI_GRID_W + GUI_GRID_X;
            y = 29.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
