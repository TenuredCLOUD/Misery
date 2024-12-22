class CLASS(sleepMenu_ui)
{
    idd = 982374;
    //onUnload = "MisSleep_selectedHour = 0;"; // Reset sleep selection variable on unload
    onLoad = QUOTE(player setVariable [ARR_2(QUOTE(QGVAR(sleepDataVal)),0)]); //Set player var to 0 on start of GUI to ensure no errors
class ControlsBackground
    {
class CLASS(sleepMenu_background): CLASS(RscText)
{
    idc = -1;
    x = 6.5 * GUI_GRID_W + GUI_GRID_X;
    y = 2 * GUI_GRID_H + GUI_GRID_Y;
    w = 26 * GUI_GRID_W;
    h = 13 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class CLASS(sleepMenu_prompt): RscText
{
    idc = -1;
    text = "$STR_MISERY_SLEEPPROMT";
    x = 6.81 * GUI_GRID_W + GUI_GRID_X;
    y = 2.22 * GUI_GRID_H + GUI_GRID_Y;
    w = 16.5 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(sleepMenu_warningTip): RscText
{
    idc = -1;
    text = "$STR_MISERY_SLEEPTIP";
    x = 6.75 * GUI_GRID_W + GUI_GRID_X;
    y = 12.33 * GUI_GRID_H + GUI_GRID_Y;
    w = 26 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = .7 * GUI_GRID_H;
};
    };
class Controls
    {
class CLASS(sleepMenu_button): RscButton
{
    idc = -1;
    x = 16.41 * GUI_GRID_W + GUI_GRID_X;
    y = 10.63 * GUI_GRID_H + GUI_GRID_Y;
    w = 6.5 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
    text = "$STR_MISERY_SLEEPBUTTON";
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE([player] call EFUNC(sleep,processSleep); closeDialog 2);

};
class CLASS(sleepMenu_list_1): RscCombo
{
    idc = 982375;
    x = 13.74 * GUI_GRID_W + GUI_GRID_X;
    y = 7.03 * GUI_GRID_H + GUI_GRID_Y;
    w = 12 * GUI_GRID_W;
    h = 1 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
    onLBSelChanged = QUOTE(_this call EFUNC(sleep,hourSelected));
class Items
    {
    class CLASS(1hour)
    {
    text = "$STR_MISERY_SLEEP1HOUR";
    color[] = {1,1,1,1};
    value = 1;
    };
    class CLASS(2hour)
    {
    text = "$STR_MISERY_SLEEP2HOURS";
    color[] = {1,1,1,1};
    value = 2;
    };
    class CLASS(3hour)
    {
    text = "$STR_MISERY_SLEEP3HOURS";
    color[] = {1,1,1,1};
    value = 3;
    };
    class CLASS(4hour)
    {
    text = "$STR_MISERY_SLEEP4HOURS";
    color[] = {1,1,1,1};
    value = 4;
    };
    class CLASS(5hour)
    {
    text = "$STR_MISERY_SLEEP5HOURS";
    color[] = {1,1,1,1};
    value = 5;
    };
    class CLASS(6hour)
    {
    text = "$STR_MISERY_SLEEP6HOURS";
    color[] = {1,1,1,1};
    value = 6;
    };
    class CLASS(7hour)
    {
    text = "$STR_MISERY_SLEEP7HOURS";
    color[] = {1,1,1,1};
    value = 7;
    };
    class CLASS(8hour)
    {
    text = "$STR_MISERY_SLEEP8HOURS";
    color[] = {1,1,1,1};
    value = 8;
    };
    class CLASS(9hour)
    {
    text = "$STR_MISERY_SLEEP9HOURS";
    color[] = {1,1,1,1};
    value = 9;
    };
    class CLASS(10hour)
    {
    text = "$STR_MISERY_SLEEP10HOURS";
    color[] = {1,1,1,1};
    value = 10;
    };
    class CLASS(11hour)
    {
    text = "$STR_MISERY_SLEEP11HOURS";
    color[] = {1,1,1,1};
    value = 11;
    };
    class CLASS(12hour)
    {
    text = "$STR_MISERY_SLEEP12HOURS";
    color[] = {1,1,1,1};
    value = 12;
    };
            };
        };
    };
};

//$[1.063,["MiserySleepGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1000,"MiserySleepMenu_BG: Misery_RscText",[2,"",["6.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","26 * GUI_GRID_W","13 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],[1001,"Misery_SleepGUIPrompt",[2,"How long do you want to sleep?",["6.81 * GUI_GRID_W + GUI_GRID_X","2.22 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1002,"MiserySleepGUI_WarningTip",[2,"Care should be taken when sleeping in excessive amounts...",["6.75 * GUI_GRID_W + GUI_GRID_X","12.33 * GUI_GRID_H + GUI_GRID_Y","26 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"",".7"],[]],[1600,"MiserySleepGUI_Button",[2,"Sleep...",["16.41 * GUI_GRID_W + GUI_GRID_X","10.63 * GUI_GRID_H + GUI_GRID_Y","6.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.7882,0.1961,0.5137,0],[-1,-1,-1,-1],"","0.7"],["colorBackgroundActive[] = {0.8392,0.4941,0.2078,0};","colorBackgroundDisabled[] = {0.2,0.2,0.2,1};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,1};","colorFocused[] = {0.2,0.2,0.2,1};","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","onButtonClick = |[player] call ^Sleep\hours\Sleep.sqf^; closeDialog 2;|;"]],[2100,"MiserySleepMenu_List_1",[2,"",["13.74 * GUI_GRID_W + GUI_GRID_X","7.03 * GUI_GRID_H + GUI_GRID_Y","12 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]
