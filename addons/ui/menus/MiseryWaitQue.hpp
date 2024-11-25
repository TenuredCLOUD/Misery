/*
Misery Trader / Shop UI Wait Que
Processes players being in a waiting Que as well as their spot in line...
Designed specifically for Misery mod
*/
class Misery_TraderShop_WaitQue_UI
{
    idd = 270586;
    onLoad = QUOTE([] call EFUNC(traders,waitQueue));

class ControlsBackground
{
class Misery_TradingQue_BG: Misery_RscText
{
    idc = 1800;
    x = 0 * GUI_GRID_W + GUI_GRID_X;
    y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 40 * GUI_GRID_W;
    h = 14.5 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class Misery_TradingQueNotif: RscText
{
    idc = 1000;
    x = 4.5 * GUI_GRID_W + GUI_GRID_X;
    y = 8 * GUI_GRID_H + GUI_GRID_Y;
    w = 41 * GUI_GRID_W;
    h = 3.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_TradingQuePrompt: RscText
{
    idc = 1001;
    text = "You are in a waiting que..."; //--- ToDo: Localize;
    x = 0.5 * GUI_GRID_W + GUI_GRID_X;
    y = 4 * GUI_GRID_H + GUI_GRID_Y;
    w = 35.5 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
};
};
class Controls
    {
class Misery_TradingQue_Cancel: RscButton
{
    idc = 1600;
    text = "Leave Que"; //--- ToDo: Localize;
    x = 15 * GUI_GRID_W + GUI_GRID_X;
    y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 8 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE(_trader = player getVariable 'currentTrader'; _queue = _trader getVariable 'queue'; _index = _queue find (getPlayerUID player); if (_index != -1) then {_queue deleteAt _index;}; closeDialog 2);
};
    };
        };

//$[1.063,["Misery_WaitQueUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_TradingQue_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","3.5 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","14.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_TradingQueNotif",[2,"Merchant is currently busy trading with %2, your spot in the wait que is: %3. Please wait...",["4.5 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","41 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1001,"Misery_TradingQuePrompt",[2,"You are in a waiting que...",["0.5 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","35.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"Misery_TradingQue_Cancel",[2,"Leave Que",["15 * GUI_GRID_W + GUI_GRID_X","13.5 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
