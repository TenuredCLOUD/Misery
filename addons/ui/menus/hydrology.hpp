class CLASS(hydrology_ui)
{
    idd = 982380;
    onLoad = QUOTE([] call EFUNC(hydrology,containersListed); [] call EFUNC(hydrology,icon));

class ControlsBackground
{
class CLASS(hydrology_background): CLASS(RscText)
{
    idc = -1;
    colorBackground[]={0.2,0.2,0.2,.7};
    x = 4.5 * GUI_GRID_W + GUI_GRID_X;
    y = 1 * GUI_GRID_H + GUI_GRID_Y;
    w = 33 * GUI_GRID_W;
    h = 23.5 * GUI_GRID_H;
};
class CLASS(hydrology_itemSelectionTip): RscText
{
    idc = -1;
    text = "Containers:"; //--- ToDo: Localize;
    x = 6.5 * GUI_GRID_W + GUI_GRID_X;
    y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 6 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    sizeEx = 0.8 * GUI_GRID_H;
};
class CLASS(hydrology_prompt): RscText
{
    idc = -1;
    text = "What container would you like to fill?"; //--- ToDo: Localize;
    x = 6.5 * GUI_GRID_W + GUI_GRID_X;
    y = 1 * GUI_GRID_H + GUI_GRID_Y;
    w = 22 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
};
class CLASS(hydrology_icon): RscPicture
{
    idc = 1200;
    text = QPATHTOEF(icons,data\well_ca.paa);
    x = 28.5 * GUI_GRID_W + GUI_GRID_X;
    y = 3 * GUI_GRID_H + GUI_GRID_Y;
    w = 5.5 * GUI_GRID_W;
    h = 3.5 * GUI_GRID_H;
};
};
class Controls
    {
class CLASS(hydrology_list_1): RscListBox
{
    idc = 1500;
    x = 7 * GUI_GRID_W + GUI_GRID_X;
    y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 16.5 * GUI_GRID_W;
    h = 14 * GUI_GRID_H;
};
class CLASS(hydrology_FillContainer_Button): RscButton
{
    idc = 1600;
    text = "Fill container"; //--- ToDo: Localize;
    x = 27.5 * GUI_GRID_W + GUI_GRID_X;
    y = 12 * GUI_GRID_H + GUI_GRID_Y;
    w = 7.5 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE([] call EFUNC(hydrology,processFill));
};
class CLASS(hydrology_drinkFromSource_Button): RscButton
{
    idc = 1601;
    text = "Drink from source"; //--- ToDo: Localize;
    x = 27.05 * GUI_GRID_W + GUI_GRID_X;
    y = 14.53 * GUI_GRID_H + GUI_GRID_Y;
    w = 8.5 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE([] call EFUNC(hydrology,drinkFromSource));
};
class CLASS(hydrology_exit): RscButton
{
    idc = 1602;
    text = "Exit";
    x = 27.5 * GUI_GRID_W + GUI_GRID_X;
    y = 17 * GUI_GRID_H + GUI_GRID_Y;
    w = 7.5 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
    sizeEx = QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1));
    font = "PuristaMedium";
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = QUOTE(closeDialog 2);
};
class CLASS(hydrology_noteBox): RscText
{
    idc = 1001;
    x = 6 * GUI_GRID_W + GUI_GRID_X;
    y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
    w = 30 * GUI_GRID_W;
    h = 4 * GUI_GRID_H;
    sizeEx = 0.75 * GUI_GRID_H;
};
    };
        };

//$[1.063,["Misery_hydrologyGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_hydrologyBG",[2,"",["4.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","33 * GUI_GRID_W","23.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"Miseryhydrology_List_1",[2,"",["7 * GUI_GRID_W + GUI_GRID_X","4.5 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","14 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_hydrologyPrompt",[2,"What container would you like to fill?",["6.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"MiseryFillContainer_Button",[2,"Fill container",["27.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"Miseryhydrology_ItemSelectionTip",[2,"Containers:",["6.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]],[1601,"MiseryDrinkFromSource_Button",[2,"Drink from source",["27.05 * GUI_GRID_W + GUI_GRID_X","14.53 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"Miseryhydrology_ExitButton",[2,"Exit",["27.5 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check Known Recipes","-1"],[]],[1001,"Miseryhydrology_NoteBox",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1200,"Misery_hydrology_Icon",[2,"\Use\icons\well.paa",["28.5 * GUI_GRID_W + GUI_GRID_X","3 * GUI_GRID_H + GUI_GRID_Y","5.5 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
