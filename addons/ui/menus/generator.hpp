class CLASS(generator_ui)
{
    idd = 573849;
    onLoad = QUOTE([] call EFUNC(generator,uiPrep); [] call EFUNC(generator,icon));
    onUnload = QUOTE(player setVariable [ARR_2(QUOTE(QGVAR(currentGenerator)),nil)]);

class ControlsBackground
{
class CLASS(generator_background): CLASS(RscText)
{
    idc = 1800;
    x = 0 * GUI_GRID_W + GUI_GRID_X;
    y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 40 * GUI_GRID_W;
    h = 16.5 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class CLASS(generator_prompt): RscText
{
    idc = 1000;
    text = "Power Generator"; //--- ToDo: Localize;
    x = 0.5 * GUI_GRID_W + GUI_GRID_X;
    y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
class CLASS(generator_name): RscText
{
    idc = 1002;
    x = 27.5 * GUI_GRID_W + GUI_GRID_X;
    y = 5 * GUI_GRID_H + GUI_GRID_Y;
    w = 11 * GUI_GRID_W;
    h = 3 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
};
class CLASS(generator_fuellvl): RscText
{
    idc = 1003;
    text = "100% --------------------"; //--- ToDo: Localize;
    x = 1 * GUI_GRID_W + GUI_GRID_X;
    y = 10 * GUI_GRID_H + GUI_GRID_Y;
    w = 9.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
};
class CLASS(generator_powerState): RscText
{
    idc = 1001;
    text = "'On / Off'"; //--- ToDo: Localize;
    x = 1 * GUI_GRID_W + GUI_GRID_X;
    y = 8 * GUI_GRID_H + GUI_GRID_Y;
    w = 9.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
};
};
class Controls
{
class CLASS(generator_startStop_button): RscButton
{
    idc = 1600;
    x = 1.5 * GUI_GRID_W + GUI_GRID_X;
    y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 8 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE([] call EFUNC(generator,powerButton));
};
class CLASS(generator_refuel_button): RscButton
{
    idc = 1601;
    text = "Refuel"; //--- ToDo: Localize;
    x = 1.5 * GUI_GRID_W + GUI_GRID_X;
    y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 8 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE([] call EFUNC(generator,refuel));
        };
    };
};

//$[1.063,[QCLASS(Generator_GUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(Generator_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","16.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(Generator_Prompt",[2,"Power Generator",["0.5 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,QCLASS(Generator_name",[2,"",["27.5 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","3 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,QCLASS(Generator_Fuellvl",[2,"100% --------------------",["1 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1001,QCLASS(Generator_PowerState",[2,"'On / Off'",["1 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,QCLASS(Generator_PoweredObjects",[2,"Powered Objects:",["1 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,QCLASS(Generator_Start_Stop_Button",[2,"",["1.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1601,QCLASS(Generator_Refuel_Button,[2,"Refuel",["1.5 * GUI_GRID_W + GUI_GRID_X","17.5 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]

