class CLASS(moneyGiveMenu_background): RscFrame
{
    idc = 1800;
    x = 5 * GUI_GRID_W + GUI_GRID_X;
    y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 29.5 * GUI_GRID_W;
    h = 8 * GUI_GRID_H;
};
class CLASS(moneyGiveMenu_prompt): RscText
{
    idc = 1000;
    text = "Give funds"; //--- ToDo: Localize;
    x = 5.5 * GUI_GRID_W + GUI_GRID_X;
    y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 11 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
class CLASS(moneyGiveMenu_inputBox): RscEdit
{
    idc = 1400;
    x = 15 * GUI_GRID_W + GUI_GRID_X;
    y = 8 * GUI_GRID_H + GUI_GRID_Y;
    w = 7 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
};
class CLASS(moneyGiveMenu_give): RscButton
{
    idc = 1600;
    text = "Give"; //--- ToDo: Localize;
    x = 14.5 * GUI_GRID_W + GUI_GRID_X;
    y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 8 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
class CLASS(moneyGiveMenu_objectsFunds): RscText
{
    idc = 1001;
    text = "0 funds"; //--- ToDo: Localize;
    x = 22.65 * GUI_GRID_W + GUI_GRID_X;
    y = 7.59 * GUI_GRID_H + GUI_GRID_Y;
    w = 11 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(moneyGiveMenu_playersFunds): RscText
{
    idc = 1002;
    text = "Player: 1% 2%"; //--- ToDo: Localize;
    x = 23.23 * GUI_GRID_W + GUI_GRID_X;
    y = 5.75 * GUI_GRID_H + GUI_GRID_Y;
    w = 11 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};

//$[1.063,[QCLASS(MoneyGiveMenu",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(MoneyGiveMenu_BG",[2,"",["5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","29.5 * GUI_GRID_W","8 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(MoneyGiveMenu_Prompt",[2,"Give funds",["5.5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1400,QCLASS(MoneyGiveMenu_InputBox",[2,"",["15 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,QCLASS(MoneyGiveMenu_Give",[2,"Give",["14.5 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,QCLASS(MoneyGiveMenu_ObjectsFunds",[2,"0 funds",["22.65 * GUI_GRID_W + GUI_GRID_X","7.59 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1002,QCLASS(MoneyGiveMenu_PlayersFunds",[2,"Player: 1% 2%",["23.23 * GUI_GRID_W + GUI_GRID_X","5.75 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]
