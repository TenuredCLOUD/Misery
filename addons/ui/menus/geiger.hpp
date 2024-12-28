class CLASS(geiger_ui)
{
    idd = 982344;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(geiger_ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

class ControlsBackground
{
class CLASS(geiger_background): RscPicture
{
    idc = -1;
    text = QPATHTOEF(ui,menus\ui\Geiger.paa);
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
    sizeEx = 0.7 * GUI_GRID_H;
    colorText[] = {0,0,0,0.5};
};
    };
        };

//$[1.063,[QCLASS(CraftingGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,QCLASS(GeigerBG",[2,"\Data\Geiger.paa",["39.5 * GUI_GRID_W + GUI_GRID_X","20.5 * GUI_GRID_H + GUI_GRID_Y","10.5 * GUI_GRID_W","14.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(GeigerReading",[2,"",["43.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]
