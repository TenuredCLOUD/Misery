class CLASS(inventoryFramework_ui)
{
    idd = 982377;
    onLoad = QUOTE([] call EFUNC(invstat,status));

class ControlsBackground
{
class CLASS(inventoryFramework_background): CLASS(RscText)
{
    idc = -1;
    x = 0 * GUI_GRID_W + GUI_GRID_X;
    y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 40 * GUI_GRID_W;
    h = 11.5 * GUI_GRID_H;
    colorBackground[]={0.2,0.2,0.2,.7};
};
class CLASS(inventoryFramework_prompt): RscText
{
    idc = -1;
    text = "Actions:"; //--- ToDo: Localize;
    x = 0.5 * GUI_GRID_W + GUI_GRID_X;
    y = 23 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_prompt): RscText
{
    idc = -1;
    text = "Status:"; //--- ToDo: Localize;
    x = 23.5 * GUI_GRID_W + GUI_GRID_X;
    y = 23 * GUI_GRID_H + GUI_GRID_Y;
    w = 6 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_split): RscFrame
{
    idc = -1;
    x = 23 * GUI_GRID_W + GUI_GRID_X;
    y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 0.4 * GUI_GRID_W;
    h = 11.5 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_hunger): RscText
{
    idc = -1;
    text = "Hunger:"; //--- ToDo: Localize;
    x = 23.5 * GUI_GRID_W + GUI_GRID_X;
    y = 25.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_health): RscText
{
    idc = 1008;
    text = "Blood:"; //--- ToDo: Localize;
    x = 23.5 * GUI_GRID_W + GUI_GRID_X;
    y = 24.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_thirst): RscText
{
    idc = -1;
    text = "Thirst:"; //--- ToDo: Localize;
    x = 23.5 * GUI_GRID_W + GUI_GRID_X;
    y = 27 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_fatigue): RscText
{
    idc = -1;
    text = "Fatigue:"; //--- ToDo: Localize;
    x = 23.5 * GUI_GRID_W + GUI_GRID_X;
    y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_ailments): RscText
{
    idc = -1;
    text = "Ailments:"; //--- ToDo: Localize;
    x = 31.61 * GUI_GRID_W + GUI_GRID_X;
    y = 30.53 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_buffs): RscText
{
    idc = -1;
    text = "Buffs:"; //--- ToDo: Localize;
    x = 23.5 * GUI_GRID_W + GUI_GRID_X;
    y = 30.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_funds): RscText
{
    idc = 1009;
    text = "Funds"; //--- ToDo: Localize;
    x = 31.5 * GUI_GRID_W + GUI_GRID_X;
    y = 23 * GUI_GRID_H + GUI_GRID_Y;
    w = 8.5 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_temperature): RscText
{
    idc = 1015;
    text = "Temperature:"; //--- ToDo: Localize;
    x = 31.75 * GUI_GRID_W + GUI_GRID_X;
    y = 28.75 * GUI_GRID_H + GUI_GRID_Y;
    w = 5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_gasMask): RscText
{
    idc = 1016;
    text = "Gas Mask:"; //--- ToDo: Localize;
    x = 31.92 * GUI_GRID_W + GUI_GRID_X;
    y = 27.47 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_currentMag): RscPicture
{
    idc = 1111;
    x = 33 * GUI_GRID_W + GUI_GRID_X;
    y = 25.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 2.5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
};
    };
class Controls
    {
class CLASS(inventoryFramework_actionList): RscListBox
{
    idc = 1500;
    x = 0.5 * GUI_GRID_W + GUI_GRID_X;
    y = 25 * GUI_GRID_H + GUI_GRID_Y;
    w = 14.5 * GUI_GRID_W;
    h = 9.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_actionButton): RscButton
{
    idc = 1600;
    text = "Confirm Selection"; //--- ToDo: Localize;
    x = 15.5 * GUI_GRID_W + GUI_GRID_X;
    y = 33 * GUI_GRID_H + GUI_GRID_Y;
    w = 7 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE([true] call EFUNC(inventory,selectAction));
};
class CLASS(inventoryFramework_status_buffs_list): RscListBox
{
    idc = 1501;
    x = 23.88 * GUI_GRID_W + GUI_GRID_X;
    y = 32.22 * GUI_GRID_H + GUI_GRID_Y;
    w = 6 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
    onLBSelChanged = QUOTE(_this call EFUNC(invstat,processBuff));
};
class CLASS(inventoryFramework_status_ailments_list): RscListBox
{
    idc = 1502;
    x = 31.91 * GUI_GRID_W + GUI_GRID_X;
    y = 32.23 * GUI_GRID_H + GUI_GRID_Y;
    w = 6 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
    onLBSelChanged = QUOTE(_this call EFUNC(invstat,processAilment));
};
class CLASS(inventoryFramework_status_healthValue): RscText
{
    idc = 1011;
    x = 25.67 * GUI_GRID_W + GUI_GRID_X;
    y = 24.21 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_hungerValue): RscText
{
    idc = 1012;
    x = 26.04 * GUI_GRID_W + GUI_GRID_X;
    y = 25.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_thirstValue): RscText
{
    idc = 1013;
    x = 25.67 * GUI_GRID_W + GUI_GRID_X;
    y = 26.99 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_fatigueValue): RscText
{
    idc = 1014;
    x = 26 * GUI_GRID_W + GUI_GRID_X;
    y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_temperature_exposure): RscText
{
    idc = 1010;
    text = "No ERU"; //--- ToDo: Localize;
    x = 35.81 * GUI_GRID_W + GUI_GRID_X;
    y = 28.78 * GUI_GRID_H + GUI_GRID_Y;
    w = 5 * GUI_GRID_W;
    h = 2 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_gasMask_cartridge): RscText
{
    idc = 1017;
    text = "None";
    x = 35.84 * GUI_GRID_W + GUI_GRID_X;
    y = 27.45 * GUI_GRID_H + GUI_GRID_Y;
    w = 4.5 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
class CLASS(inventoryFramework_status_currentMagValue): RscText
{
    idc = 1112;
    x = 35.5 * GUI_GRID_W + GUI_GRID_X;
    y = 26 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = 0.7 * GUI_GRID_H;
};
    };
        };

//$[1.063,["Misery",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1400,"Misery_ActionFW_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_ActionFW_Promt",[2,"Actions:",["0.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1500,"Misery_ActionFW_ACTLIST",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","25 * GUI_GRID_H + GUI_GRID_Y","14.5 * GUI_GRID_W","9.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,"Misery_ActionFW_ACTBUTTON",[2,"Confirm Selection",["15.5 * GUI_GRID_W + GUI_GRID_X","33 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1000,"Misery_STATUSFW_Prompt",[2,"Status:",["23.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1800,"",[2,"",["23 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","0.4 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"Misery_STATUSFW_Hunger",[2,"Hunger:",["23.5 * GUI_GRID_W + GUI_GRID_X","25.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,"Misery_STATUSFW_Health",[2,"Blood:",["23.5 * GUI_GRID_W + GUI_GRID_X","24.5 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,"Misery_STATUSFW_Thirst",[2,"Thirst:",["23.5 * GUI_GRID_W + GUI_GRID_X","27 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1005,"Misery_STATUSFW_Fatigue",[2,"Fatigue:",["23.5 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1006,"Misery_STATUSFW_Ailments",[2,"Ailments:",["32.23 * GUI_GRID_W + GUI_GRID_X","30.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1008,"Misery_STATUSFW_Buffs",[2,"Buffs:",["23.5 * GUI_GRID_W + GUI_GRID_X","30.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1501,"Misery_STATUSFW_Buffs_List",[2,"",["23.88 * GUI_GRID_W + GUI_GRID_X","32.22 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1502,"Misery_STATUSFW_Ailments_List",[2,"",["32.51 * GUI_GRID_W + GUI_GRID_X","32.23 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1009,"Misery_STATUSFW_Funds",[2,"Funds",["31.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,"Misery_STATUSFW_Healthbar",[2,"\Data\loadbars\100.paa",["25.43 * GUI_GRID_W + GUI_GRID_X","24.56 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"Misery_STATUSFW_HungerBar",[2,"\Data\loadbars\100.paa",["25.82 * GUI_GRID_W + GUI_GRID_X","25.84 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1202,"Misery_STATUSFW_ThirstBar",[2,"\Data\loadbars\100.paa",["25.45 * GUI_GRID_W + GUI_GRID_X","27.3 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1203,"Misery_STATUSFW_FatigueBar",[2,"\Data\loadbars\100.paa",["25.79 * GUI_GRID_W + GUI_GRID_X","28.82 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1007,"Misery_STATUSFW_Temperature",[2,"Temperature:",["31.75 * GUI_GRID_W + GUI_GRID_X","28.75 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1010,"Misery_STATUSFW_Temperature_exposure",[2,"No PDA",["35.81 * GUI_GRID_W + GUI_GRID_X","28.78 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]

//$[1.063,["Misery",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1400,"Misery_ActionFW_BG",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_ActionFW_Promt",[2,"Actions:",["0.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1500,"Misery_ActionFW_ACTLIST",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","25 * GUI_GRID_H + GUI_GRID_Y","14.5 * GUI_GRID_W","9.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,"Misery_ActionFW_ACTBUTTON",[2,"Confirm Selection",["15.5 * GUI_GRID_W + GUI_GRID_X","33 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1000,"Misery_STATUSFW_Prompt",[2,"Status:",["23.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1800,"",[2,"",["23 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","0.4 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"Misery_STATUSFW_Hunger",[2,"Hunger:",["23.5 * GUI_GRID_W + GUI_GRID_X","25.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,"Misery_STATUSFW_Health",[2,"Blood:",["23.5 * GUI_GRID_W + GUI_GRID_X","24.5 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,"Misery_STATUSFW_Thirst",[2,"Thirst:",["23.5 * GUI_GRID_W + GUI_GRID_X","27 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1005,"Misery_STATUSFW_Fatigue",[2,"Fatigue:",["23.5 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1006,"Misery_STATUSFW_Ailments",[2,"Ailments:",["31.61 * GUI_GRID_W + GUI_GRID_X","30.53 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1008,"Misery_STATUSFW_Buffs",[2,"Buffs:",["23.5 * GUI_GRID_W + GUI_GRID_X","30.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1501,"Misery_STATUSFW_Buffs_List",[2,"",["23.88 * GUI_GRID_W + GUI_GRID_X","32.22 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1502,"Misery_STATUSFW_Ailments_List",[2,"",["31.91 * GUI_GRID_W + GUI_GRID_X","32.23 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1009,"Misery_STATUSFW_Funds",[2,"Funds",["31.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1007,"Misery_STATUSFW_Temperature",[2,"Temperature:",["31.75 * GUI_GRID_W + GUI_GRID_X","28.75 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1010,"Misery_STATUSFW_Temperature_exposure",[2,"No PDA",["35.81 * GUI_GRID_W + GUI_GRID_X","28.78 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1011,"Misery_STATUSFW_HealthVal",[2,"100",["25.67 * GUI_GRID_W + GUI_GRID_X","24.21 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1012,"Misery_STATUSFW_HungerVal",[2,"100",["26.04 * GUI_GRID_W + GUI_GRID_X","25.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1013,"Misery_STATUSFW_ThirstVal",[2,"100",["25.67 * GUI_GRID_W + GUI_GRID_X","26.99 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1014,"Misery_STATUSFW_FatigueVal",[2,"100",["26 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,"Misery_STATUSFW_Bookleticon_2",[2,"\z\misery\addons\ui\GuideBooklet.paa",["38.11 * GUI_GRID_W + GUI_GRID_X","33.69 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"Misery_STATUSFW_Bookleticon_1",[2,"\z\misery\addons\ui\GuideBooklet.paa",["30.06 * GUI_GRID_W + GUI_GRID_X","33.68 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"Misery_STATUSFW_BuffGuide",[2,"",["30.11 * GUI_GRID_W + GUI_GRID_X","33.68 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"Misery_STATUSFW_AilmentGuide",[2,"",["38.15 * GUI_GRID_W + GUI_GRID_X","33.74 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

//$[1.063,["Test",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1000,"Misery_ActionFW_BG: Misery_RscText",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],[1001,"Misery_ActionFW_Promt",[2,"Actions:",["0.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],[]],[1002,"Misery_STATUSFW_Prompt",[2,"Status:",["23.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],[]],[1800,"Misery_STATUSFW_SPLIT",[2,"",["23 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","0.4 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1003,"Misery_STATUSFW_Hunger",[2,"Hunger:",["23.5 * GUI_GRID_W + GUI_GRID_X","25.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],[]],[1004,"Misery_STATUSFW_Health",[2,"Blood:",["23.5 * GUI_GRID_W + GUI_GRID_X","24.5 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1008;"]],[1005,"Misery_STATUSFW_Thirst",[2,"Thirst:",["23.5 * GUI_GRID_W + GUI_GRID_X","27 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],[]],[1006,"Misery_STATUSFW_Fatigue",[2,"Fatigue:",["23.5 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],[]],[1007,"Misery_STATUSFW_Ailments",[2,"Ailments:",["31.61 * GUI_GRID_W + GUI_GRID_X","30.53 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],[]],[1008,"Misery_STATUSFW_Buffs",[2,"Buffs:",["23.5 * GUI_GRID_W + GUI_GRID_X","30.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],[]],[1009,"Misery_STATUSFW_Funds",[2,"Funds",["31.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1009;"]],[1010,"Misery_STATUSFW_Temperature",[2,"Temperature:",["31.75 * GUI_GRID_W + GUI_GRID_X","28.75 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1015;"]],[1011,"Misery_STATUSFW_GasMask",[2,"Gas Mask:",["31.92 * GUI_GRID_W + GUI_GRID_X","27.47 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1016;"]],[1012,"Misery_ActionFW_ACTLIST: RscListBox",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","25 * GUI_GRID_H + GUI_GRID_Y","14.5 * GUI_GRID_W","9.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1500;"]],[1600,"Misery_ActionFW_ACTBUTTON",[2,"Confirm Selection",["15.5 * GUI_GRID_W + GUI_GRID_X","33 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0.2,0.2,0.2,0.7],[0.5,0.5,0.5,0.7],"","0.7 *     (0.04)"],["idc = 1600;","colorFocused[] = {0.5,0.5,0.5,0.7};","onButtonClick = |true call^\z\misery\addons\framework\scripts\Inventory\SelectAction.sqf^|;"]],[1013,"Misery_STATUSFW_Buffs_List: RscListBox",[2,"",["23.88 * GUI_GRID_W + GUI_GRID_X","32.22 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1501;","onLBSelChanged = |_this call ^functions\menus\invstat\ProcessBuff.sqf^|;"]],[1014,"Misery_STATUSFW_Ailments_List: RscListBox",[2,"",["31.91 * GUI_GRID_W + GUI_GRID_X","32.23 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1502;","onLBSelChanged = |_this call ^functions\menus\invstat\ProcessAilment.sqf^|;"]],[1015,"Misery_STATUSFW_HealthVal",[2,"",["25.67 * GUI_GRID_W + GUI_GRID_X","24.21 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1011;"]],[1016,"Misery_STATUSFW_HungerVal",[2,"",["26.04 * GUI_GRID_W + GUI_GRID_X","25.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1012;"]],[1017,"Misery_STATUSFW_ThirstVal",[2,"",["25.67 * GUI_GRID_W + GUI_GRID_X","26.99 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1013;"]],[1018,"Misery_STATUSFW_FatigueVal",[2,"",["26 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1014;"]],[1019,"Misery_STATUSFW_Temperature_exposure",[2,"No PDA",["35.81 * GUI_GRID_W + GUI_GRID_X","28.78 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1010;"]],[1020,"Misery_STATUSFW_GasMask_Cartridge",[2,"None",["35.84 * GUI_GRID_W + GUI_GRID_X","27.45 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1017;"]],[1200,"Misery_STATUSFW_CurrentMag",[2,"",["31.58 * GUI_GRID_W + GUI_GRID_X","25.09 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1021,"Misery_STATUSFW_CurrentMagVal",[2,"(0/0)",["35.5 * GUI_GRID_W + GUI_GRID_X","26 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7 *     (0.04)"],["idc = 1016;"]]]
