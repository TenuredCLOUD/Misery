/*
Misery Vehicle Refueling UI
Processes Refueling via Jerry Cans for vehicles...
Designed specifically for Misery mod
*/

class MiseryRefuel_Vehicle_JCan_GUI
{
    idd = 982385;
    onLoad = "[] execVM '\z\misery\addons\fuel\functions\fnc_RefuelListed.sqf';";

class ControlsBackground
{
class MiseryRefuel_Vehicle_JCan_BG: Misery_RscText
{
    idc = -1;
    x = 0 * GUI_GRID_W + GUI_GRID_X;
    y = 0 * GUI_GRID_H + GUI_GRID_Y;
    w = 40 * GUI_GRID_W;
    h = 25 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class MiseryRefuel_Vehicle_JCan_Prompt: RscText
{
    idc = -1;
    text = "Refuel Vehicle"; //--- ToDo: Localize;
    x = 1.6 * GUI_GRID_W + GUI_GRID_X;
    y = 0.24 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
class MiseryRefuel_Vehicle_JCan_icon: RscPicture
{
    idc = 1602;
    x = 30.5 * GUI_GRID_W + GUI_GRID_X;
    y = 1 * GUI_GRID_H + GUI_GRID_Y;
    w = 5 * GUI_GRID_W;
    h = 3.5 * GUI_GRID_H;
};
class MiseryRefuel_Vehicle_JCan_VehicelText: RscText
{
    idc = 1603;
    x = 28.5 * GUI_GRID_W + GUI_GRID_X;
    y = 4.59 * GUI_GRID_H + GUI_GRID_Y;
    w = 9.5 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = 0.75 * GUI_GRID_H;
};
class MiseryRefuel_Vehicle_JCan_icon_2: RscPicture
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
class MiseryRefuel_Vehicle_JCan_List: RscListBox
{
    idc = 1500;
    x = 1.5 * GUI_GRID_W + GUI_GRID_X;
    y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 12.5 * GUI_GRID_H;
};
class MiseryRefuel_Vehicle_JCan_Start: RscButton
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
    onButtonClick ="[] execVM '\z\misery\addons\fuel\functions\fnc_ProcessRefuel.sqf';";
};
class MiseryRefuel_Vehicle_JCan_Exit: RscButton
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
    onButtonClick = "closeDialog 2;";
};
class MiseryRefuel_Vehicle_JCan_InfoBox: RscText
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


//$[1.063,["Misery_VehRefuel",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_VehShopRefuel_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_Refuel_Prompt",[2,"Refuel Vehicle",["1.6 * GUI_GRID_W + GUI_GRID_X","0.24 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"Misery_VehShopRefuel_List",[2,"",["1.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,"Misery_VehShopRefuel_icon",[2,"\Data\Mappack\medical.paa",["30.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"Misery_Refuel_Button",[2,"Refill",["29.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"Misery_VehShopRefuel_Exit",[2,"Exit",["29.5 * GUI_GRID_W + GUI_GRID_X","15 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_VehShopRefuel_InfoBox",[2,"",["1.46 * GUI_GRID_W + GUI_GRID_X","18.28 * GUI_GRID_H + GUI_GRID_Y","37.5 * GUI_GRID_W","6 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"",[2,"",["28.5 * GUI_GRID_W + GUI_GRID_X","4.59 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.75"],[]],[1201,"",[2,"\Data\Mappack\medical.paa",["30.5 * GUI_GRID_W + GUI_GRID_X","7.5 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
