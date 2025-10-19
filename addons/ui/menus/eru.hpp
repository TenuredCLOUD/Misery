class CLASS(eru_ui)
{
    idd = 482917;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QEGVAR(eru,ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

    class ControlsBackground
    {
        class CLASS(eru_background): RscPicture
        {
            idc = -1;
            text = QPATHTOEF(ui,menus\ui\eru_ca.paa);
            x = 48.5 * GUI_GRID_W + GUI_GRID_X;
            y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13 * GUI_GRID_W;
            h = 6.5 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class CLASS(eru_readings): RscText
        {
            idc = 1001;
            x = 50.96 * GUI_GRID_W + GUI_GRID_X;
            y = 29.94 * GUI_GRID_H + GUI_GRID_Y;
            w = 9.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorText[] = {0,0,0,0.8};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(eru_timeDate): RscText
        {
            idc = 1000;
            x = 51 * GUI_GRID_W + GUI_GRID_X;
            y = 31 * GUI_GRID_H + GUI_GRID_Y;
            w = 9.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorText[] = {0,0,0,0.8};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};



