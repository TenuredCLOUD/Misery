class CLASS(maintenance_ui)
{
    idd = 274839;
    onLoad = QUOTE([] call EFUNC(maintenance,listed); [] call EFUNC(maintenance,icon));

class ControlsBackground
{
class CLASS(maintenance_background): CLASS(RscText)
{
    idc = 1800;
    x = 0 * GUI_GRID_W + GUI_GRID_X;
    y = 0 * GUI_GRID_H + GUI_GRID_Y;
    w = 40 * GUI_GRID_W;
    h = 25 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class CLASS(maintenance_prompt): RscText
{
    idc = 1000;
    text = "Vehicle Maintenance"; //--- ToDo: Localize;
    x = 0.19 * GUI_GRID_W + GUI_GRID_X;
    y = 0.22 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
class CLASS(maintenance_name): RscText
{
    idc = 1002;
    x = 28.19 * GUI_GRID_W + GUI_GRID_X;
    y = 4.88 * GUI_GRID_H + GUI_GRID_Y;
    w = 11 * GUI_GRID_W;
    h = 3 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
};
class CLASS(maintenance_icon): RscPicture
{
    idc = 1200;
    x = 31.5 * GUI_GRID_W + GUI_GRID_X;
    y = 1 * GUI_GRID_H + GUI_GRID_Y;
    w = 5 * GUI_GRID_W;
    h = 3.5 * GUI_GRID_H;
};
    };
class Controls
{
class CLASS(maintenance_list): RscListBox
{
    idc = 1500;
    x = 0.5 * GUI_GRID_W + GUI_GRID_X;
    y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 12.5 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
};
class CLASS(maintenance_repair): RscButton
{
    idc = 1600;
    text = "Repair"; //--- ToDo: Localize;
    x = 29.5 * GUI_GRID_W + GUI_GRID_X;
    y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 7 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick ="";
};
class CLASS(maintenance_scavenge): RscButton
{
    idc = 1601;
    text = "Scavenge"; //--- ToDo: Localize;
    x = 28.88 * GUI_GRID_W + GUI_GRID_X;
    y = 12.47 * GUI_GRID_H + GUI_GRID_Y;
    w = 8.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick ="";
};
class CLASS(maintenance_infoBox): RscText
{
    idc = 1001;
    x = 0.31 * GUI_GRID_W + GUI_GRID_X;
    y = 17.15 * GUI_GRID_H + GUI_GRID_Y;
    w = 39 * GUI_GRID_W;
    h = 7 * GUI_GRID_H;
    sizeEx = UI_MACRO_TEXTSIZE;
};
    };
        };

//$[1.063,[QCLASS(maintenance_GUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(maintenance_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(maintenance_Prompt",[2,"Vehicle Maintenance",["0.19 * GUI_GRID_W + GUI_GRID_X","0.22 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,QCLASS(maintenance_List",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,QCLASS(maintenance_icon",[2,"\Data\Mappack\medical.paa",["31.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,QCLASS(maintenance_Repair",[2,"Repair",["29.5 * GUI_GRID_W + GUI_GRID_X","9.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,QCLASS(maintenance_Scavenge",[2,"Scavenge Menu",["28.88 * GUI_GRID_W + GUI_GRID_X","12.47 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,QCLASS(maintenance_InfoBox",[2,"",["0.31 * GUI_GRID_W + GUI_GRID_X","17.15 * GUI_GRID_H + GUI_GRID_Y","39 * GUI_GRID_W","7 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1002,QCLASS(maintenance_Vehname",[2,"",["28.19 * GUI_GRID_W + GUI_GRID_X","4.88 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","3 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]
