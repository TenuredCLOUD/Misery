class CLASS(bloodshot_ui)
{
    idd = 256637468;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QEGVAR(bloodshot,ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

    class ControlsBackground
    {
        class CLASS(bloodshot_background): RscPicture
        {
            idc = -1;
            text = QPATHTOEF(ui,menus\ui\overlaybloodshot_ca.paa);
            x = -28.5 * GUI_GRID_W + GUI_GRID_X;
            y = -10.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 97 * GUI_GRID_W;
            h = 46 * GUI_GRID_H;
        };
    };
};

