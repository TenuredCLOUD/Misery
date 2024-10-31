/*
Misery Vehicle Maintenance UI
Processes Repairs and Scavenging of parts for vehicles...
Designed specifically for Misery mod
*/

class MiseryVehicleMaint_GUI
{
    idd = 274839;
    onLoad = "[] call '\z\misery\addons\vehiclemaint\functions\fnc_MaintListed.sqf'; [] call '\z\misery\addons\vehiclemaint\functions\fnc_Veh_icon.sqf';";

class ControlsBackground
{
class Misery_VehMaint_BG: Misery_RscText
{
    idc = 1800;
    x = 0 * GUI_GRID_W + GUI_GRID_X;
    y = 0 * GUI_GRID_H + GUI_GRID_Y;
    w = 40 * GUI_GRID_W;
    h = 25 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class Misery_VehMaint_Prompt: RscText
{
    idc = 1000;
    text = "Vehicle Maintenance"; //--- ToDo: Localize;
    x = 0.19 * GUI_GRID_W + GUI_GRID_X;
    y = 0.22 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
class Misery_VehMaint_Vehname: RscText
{
    idc = 1002;
    x = 28.19 * GUI_GRID_W + GUI_GRID_X;
    y = 4.88 * GUI_GRID_H + GUI_GRID_Y;
    w = 11 * GUI_GRID_W;
    h = 3 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_VehMaint_icon: RscPicture
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
class Misery_VehMaint_List: RscListBox
{
    idc = 1500;
    x = 0.5 * GUI_GRID_W + GUI_GRID_X;
    y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 20.5 * GUI_GRID_W;
    h = 12.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_VehMaint_Repair: RscButton
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
class Misery_VehMaint_Scavenge: RscButton
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
class Misery_VehMaint_InfoBox: RscText
{
    idc = 1001;
    x = 0.31 * GUI_GRID_W + GUI_GRID_X;
    y = 17.15 * GUI_GRID_H + GUI_GRID_Y;
    w = 39 * GUI_GRID_W;
    h = 7 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
    };
        };

//$[1.063,["Misery_VehMaint_GUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_VehMaint_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_VehMaint_Prompt",[2,"Vehicle Maintenance",["0.19 * GUI_GRID_W + GUI_GRID_X","0.22 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"Misery_VehMaint_List",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,"Misery_VehMaint_icon",[2,"\Data\Mappack\medical.paa",["31.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"Misery_VehMaint_Repair",[2,"Repair",["29.5 * GUI_GRID_W + GUI_GRID_X","9.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"Misery_VehMaint_Scavenge",[2,"Scavenge Menu",["28.88 * GUI_GRID_W + GUI_GRID_X","12.47 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_VehMaint_InfoBox",[2,"",["0.31 * GUI_GRID_W + GUI_GRID_X","17.15 * GUI_GRID_H + GUI_GRID_Y","39 * GUI_GRID_W","7 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1002,"Misery_VehMaint_Vehname",[2,"",["28.19 * GUI_GRID_W + GUI_GRID_X","4.88 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","3 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]
