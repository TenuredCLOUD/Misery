class CLASS(maintenance_ui)
{
    idd = 274839;
    onLoad = QUOTE([274839] call EFUNC(common,menuBlurEffect); [] call EFUNC(maintenance,listed); [] call EFUNC(maintenance,updateIcon));

    class ControlsBackground
    {
        class CLASS(maintenance_background): CLASS(RscText)
        {
            idc = 1800;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(maintenance_prompt): RscText
        {
            idc = 1000;
            text = "Vehicle Maintenance"; //--- ToDo: Localize;
            x = 0.19 * GUI_GRID_W + GUI_GRID_X;
            y = 0.22 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_name): RscText
        {
            idc = 1002;
            x = 28.19 * GUI_GRID_W + GUI_GRID_X;
            y = 4.88 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_icon): RscPicture
        {
            idc = 1200;
            x = 28.5 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
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
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_addBattery): RscButton
        {
	        idc = 1607;
	        colorFocused[] = {0.5,0.5,0.5,0.7};
	        text = "Add battery"; //--- ToDo: Localize;
	        x = 22 * GUI_GRID_W + GUI_GRID_X;
	        y = 14 * GUI_GRID_H + GUI_GRID_Y;
	        w = 7 * GUI_GRID_W;
	        h = 2 * GUI_GRID_H;
	        colorBackground[] = {0.2,0.2,0.2,0.7};
	        colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_removeBattery): RscButton
        {
	        idc = 1606;
	        colorFocused[] = {0.5,0.5,0.5,0.7};
	        text = "Remove battery"; //--- ToDo: Localize;
	        x = 22 * GUI_GRID_W + GUI_GRID_X;
	        y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 7 * GUI_GRID_W;
	        h = 2 * GUI_GRID_H;
	        colorBackground[] = {0.2,0.2,0.2,0.7};
	        colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_addOil): RscButton
        {
            idc = 1604;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Add oil"; //--- ToDo: Localize;
            x = 22 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_addCoolant): RscButton
        {
            idc = 1605;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Add coolant"; //--- ToDo: Localize;
            x = 22 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_repair): RscButton
        {
            idc = 1600;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Repair"; //--- ToDo: Localize;
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_refuel): RscButton
        {
            idc = 1601;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = "";
            text = "Refuel"; //--- ToDo: Localize;
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_scavenge): RscButton
        {
            idc = 1602;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Scavenge"; //--- ToDo: Localize;
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_exit): RscButton
        {
            idc = 1603;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Exit"; //--- ToDo: Localize;
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(closeDialog 2);
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_battery_info): RscText
        {
	        idc = 1003;
	        x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 15 * GUI_GRID_H + GUI_GRID_Y;
	        w = 12.5 * GUI_GRID_W;
	        h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_infoBox): RscText
        {
            idc = 1001;
            x = 0.81 * GUI_GRID_W + GUI_GRID_X;
            y = 20.65 * GUI_GRID_H + GUI_GRID_Y;
            w = 38.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_fuel_progressBar): CLASS(RscProgress)
        {
            idc = 2000;
            x = 2.5 * GUI_GRID_W + GUI_GRID_X;
            y = 15.69 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_power_progressBar): CLASS(RscProgress)
        {
            idc = 2001;
            x = 2.46 * GUI_GRID_W + GUI_GRID_X;
            y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_oil_progressBar): CLASS(RscProgress)
        {
            idc = 2002;
            x = 2.46 * GUI_GRID_W + GUI_GRID_X;
            y = 17.93 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_coolant_progressBar): CLASS(RscProgress)
        {
            idc = 2003;
            x = 2.5 * GUI_GRID_W + GUI_GRID_X;
            y = 19 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_fuelicon): RscPicture
        {
            idc = 2010;
            text = QUOTE(a3\ui_f\data\igui\cfg\cursors\iconrefuelat_ca.paa);
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 15 * GUI_GRID_H + GUI_GRID_Y;
            w = 2.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class CLASS(maintenance_powerIcon): RscPicture
        {
            idc = 2011;
            text = QUOTE(a3\modules_f_curator\data\portraitlightning_ca.paa);
            x = 0.39 * GUI_GRID_W + GUI_GRID_X;
            y = 16.72 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class CLASS(maintenance_oilIcon): RscPicture
        {
            idc = 2012;
            text = QPATHTOEF(icons,data\engineOil_ca.paa);
            x = 0.24 * GUI_GRID_W + GUI_GRID_X;
            y = 17.34 * GUI_GRID_H + GUI_GRID_Y;
            w = 2 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class CLASS(maintenance_waterIcon): RscPicture
        {
            idc = 2013;
            text = QPATHTOEF(icons,data\waterDrop_ca.paa);
            x = 0.39 * GUI_GRID_W + GUI_GRID_X;
            y = 18.78 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
    };
};
