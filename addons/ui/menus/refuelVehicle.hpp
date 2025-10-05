class CLASS(refuelVehicle_ui)
{
    idd = 733835;
    onLoad = QUOTE([733835] call EFUNC(common,menuBlurEffect); [] call EFUNC(fuel,icon));

    class ControlsBackground
    {
        class CLASS(refuelVehicle_background): CLASS(RscText)
        {
            idc = -1;
            x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 0 * GUI_GRID_H + GUI_GRID_Y;
	        w = 35 * GUI_GRID_W;
	        h = 18 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(refuelVehicle_vehicleName): RscText
        {
            idc = 1200;
            text = ""; //--- ToDo: Localize;
            x = 3 * GUI_GRID_W + GUI_GRID_X;
	        y = 8 * GUI_GRID_H + GUI_GRID_Y;
	        w = 21 * GUI_GRID_W;
	        h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(refuelVehicle_icon): RscPicture
        {
            idc = 1201;
	        text = "";
	        x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 4 * GUI_GRID_H + GUI_GRID_Y;
	        w = 5.5 * GUI_GRID_W;
	        h = 3.5 * GUI_GRID_H;
        };
        class CLASS(refuelVehicle_prompt): RscText
        {
            idc = -1;
            text = "Refuel from pump"; //--- ToDo: Localize;
            x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 0 * GUI_GRID_H + GUI_GRID_Y;
	        w = 22 * GUI_GRID_W;
	        h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(refuelVehicle_fuel_icon): RscPicture
        {
            idc = -1;
            text = QPATHTOEF(markers,data\fuel.paa);
            x = 26.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 5.5 * GUI_GRID_W;
	        h = 3.5 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class CLASS(refuelVehicle_noteBox): RscText
        {
            idc = 1001;
            x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 33 * GUI_GRID_W;
	        h = 3.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(refuelVehicle_refuel): RscButton
        {
            idc = 1600;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(fuel,process));
            text = "Refuel"; //--- ToDo: Localize;
            x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 7.5 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(refuelVehicle_exit): RscButton
        {
            idc = 1601;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(closeDialog 2);
            text = "Exit"; //--- ToDo: Localize;
            x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 11 * GUI_GRID_H + GUI_GRID_Y;
	        w = 7.5 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
