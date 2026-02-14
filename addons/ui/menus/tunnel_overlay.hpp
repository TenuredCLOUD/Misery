class CLASS(tunnel_ui)
{
    idd = 886635;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QEGVAR(tunnel,ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

    class ControlsBackground
    {
        class CLASS(tunnel_background): RscPicture
        {
            idc = -1;
            text = QPATHTOEF(ui,menus\ui\overlaytunnel_ca.paa);
            x = -28.5 * GUI_GRID_W + GUI_GRID_X;
            y = -10.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 97 * GUI_GRID_W;
            h = 45.5 * GUI_GRID_H;
        };
    };
};
