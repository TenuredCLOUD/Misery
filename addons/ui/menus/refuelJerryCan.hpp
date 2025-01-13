class CLASS(refuelJerryCan_ui)
{
    idd = 982385;
    onLoad = QUOTE([] call EFUNC(fuel,refuelListed));

class ControlsBackground
{
class CLASS(refuelJerryCan_background): CLASS(RscText)
{
    idc = -1;
    x = 0 * GUI_GRID_W + GUI_GRID_X;
    y = 0 * GUI_GRID_H + GUI_GRID_Y;
    w = 40 * GUI_GRID_W;
    h = 25 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class CLASS(refuelJerryCan_prompt): RscText
{
    idc = -1;
    text = "Refuel Vehicle"; //--- ToDo: Localize;
    x = 1.6 * GUI_GRID_W + GUI_GRID_X;
    y = 0.24 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
class CLASS(refuelJerryCan_icon): RscPicture
{
    idc = 1602;
    x = 30.5 * GUI_GRID_W + GUI_GRID_X;
    y = 1 * GUI_GRID_H + GUI_GRID_Y;
    w = 5 * GUI_GRID_W;
    h = 3.5 * GUI_GRID_H;
};
class CLASS(refuelJerryCan_name): RscText
{
    idc = 1603;
    x = 28.5 * GUI_GRID_W + GUI_GRID_X;
    y = 4.59 * GUI_GRID_H + GUI_GRID_Y;
    w = 9.5 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = 0.75 * GUI_GRID_H;
};
class CLASS(refuelJerryCan_icon_2): RscPicture
{
    idc = 1604;
    x = 30.5 * GUI_GRID_W + GUI_GRID_X;
    y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 5 * GUI_GRID_W;
    h = 3.5 * GUI_GRID_H;
};
};
class Controls
    {
class CLASS(refuelJerryCan_list): RscListBox
{
    idc = 1500;
    x = 1.5 * GUI_GRID_W + GUI_GRID_X;
    y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 12.5 * GUI_GRID_H;
};
class CLASS(refuelJerryCan_refill): RscButton
{
    idc = 1600;
    text = "Refill"; //--- ToDo: Localize;
    x = 29.5 * GUI_GRID_W + GUI_GRID_X;
    y = 12 * GUI_GRID_H + GUI_GRID_Y;
    w = 7 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick =QUOTE([] call EFUNC(fuel,processRefuel));
};
class CLASS(refuelJerryCan_exit): RscButton
{
    idc = 1601;
    text = "Exit"; //--- ToDo: Localize;
    x = 29.5 * GUI_GRID_W + GUI_GRID_X;
    y = 15 * GUI_GRID_H + GUI_GRID_Y;
    w = 7 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE(closeDialog 2);
};
class CLASS(refuelJerryCan_infoBox): RscText
{
    idc = 1001;
    x = 1.46 * GUI_GRID_W + GUI_GRID_X;
    y = 18.28 * GUI_GRID_H + GUI_GRID_Y;
    w = 37.5 * GUI_GRID_W;
    h = 6 * GUI_GRID_H;
    sizeEx = 0.75 * GUI_GRID_H;
};
    };
        };


//$[1.063,[QCLASS(VehRefuel",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(VehShopRefuel_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(Refuel_Prompt",[2,"Refuel Vehicle",["1.6 * GUI_GRID_W + GUI_GRID_X","0.24 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,QCLASS(VehShopRefuel_List",[2,"",["1.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,QCLASS(VehShopRefuel_icon",[2,"\Data\Mappack\medical.paa",["30.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,QCLASS(Refuel_Button",[2,"Refill",["29.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,QCLASS(VehShopRefuel_Exit",[2,"Exit",["29.5 * GUI_GRID_W + GUI_GRID_X","15 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,QCLASS(VehShopRefuel_InfoBox",[2,"",["1.46 * GUI_GRID_W + GUI_GRID_X","18.28 * GUI_GRID_H + GUI_GRID_Y","37.5 * GUI_GRID_W","6 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"",[2,"",["28.5 * GUI_GRID_W + GUI_GRID_X","4.59 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.75"],[]],[1201,"",[2,"\Data\Mappack\medical.paa",["30.5 * GUI_GRID_W + GUI_GRID_X","7.5 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
