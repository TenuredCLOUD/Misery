class CLASS(eru_ui)
{
    idd = 482917;
    duration = 10000000000;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(eru_ui)),_this select 0)]);
    fadein = 0;
    fadeout = 0;

class ControlsBackground
{
class CLASS(eru_background): RscPicture
{
    idc = -1;
    text = "\z\misery\addons\ui\menus\ui\ERU.paa";
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
    sizeEx = 0.6 * GUI_GRID_H;
};
class CLASS(eru_timeDate): RscText
{
    idc = 1000;
    x = 51 * GUI_GRID_W + GUI_GRID_X;
    y = 31 * GUI_GRID_H + GUI_GRID_Y;
    w = 9.5 * GUI_GRID_W;
    h = 1 * GUI_GRID_H;
    colorText[] = {0,0,0,0.8};
    sizeEx = 0.6 * GUI_GRID_H;
};
    };
        };
//$[1.063,["Misery_ERUGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,"Misery_ERUBG",[2,"\z\misery\addons\ui\menus\ui\ERU.paa",["48.5 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","13 * GUI_GRID_W","6.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_ERU_TimeDate",[2,"07/24/24 07:00",["51 * GUI_GRID_W + GUI_GRID_X","31 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","1 * GUI_GRID_H"],[0,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.6"],[]],[1001,"Misery_ERU_Temperature",[2,"07/24/24 07:00",["50.96 * GUI_GRID_W + GUI_GRID_X","29.94 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","1 * GUI_GRID_H"],[0,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.6"],[]]]


