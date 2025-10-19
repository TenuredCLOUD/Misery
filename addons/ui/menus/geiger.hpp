class CLASS(geiger_ui)
{
    idd = 982344;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QEGVAR(geiger,ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

    class ControlsBackground
    {
        class CLASS(geiger_background): RscPicture
        {
            idc = -1;
            text = QPATHTOEF(ui,menus\ui\geiger_ca.paa);
            x = 39.5 * GUI_GRID_W + GUI_GRID_X;
            y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 10.5 * GUI_GRID_W;
            h = 14.5 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class CLASS(geiger_readings): RscText
        {
            idc = 1000;
            x = 43.5 * GUI_GRID_W + GUI_GRID_X;
            y = 23 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorText[] = {0,0,0,0.5};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};


