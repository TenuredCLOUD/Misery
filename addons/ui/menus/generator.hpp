class CLASS(generator_ui)
{
    idd = 573849;
    onLoad = QUOTE([573849] call EFUNC(common,menuBlurEffect); [] call EFUNC(generator,refresh); [] call EFUNC(generator,icon));

    class ControlsBackground
    {
        class CLASS(generator_background): CLASS(RscText)
        {
            idc = 1800;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
	        y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 40 * GUI_GRID_W;
	        h = 16.5 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(generator_prompt): RscText
        {
            idc = 1000;
            text = "Power Generator"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(generator_name): RscText
        {
            idc = 1002;
            x = 27.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 11 * GUI_GRID_W;
	        h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(generator_fuellvl): RscText
        {
            idc = 1003;
            text = "Fuel:"; //--- ToDo: Localize;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
	        y = 10 * GUI_GRID_H + GUI_GRID_Y;
	        w = 9.5 * GUI_GRID_W;
	        h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(generator_fuelProgressBar): CLASS(RscProgress)
        {
	        idc = 1004;
	        x = 3.84 * GUI_GRID_W + GUI_GRID_X;
	        y = 10.83 * GUI_GRID_H + GUI_GRID_Y;
	        w = 8 * GUI_GRID_W;
	        h = 0.5 * GUI_GRID_H;
        };
        class CLASS(generator_powerState): RscText
        {
            idc = 1001;
            text = "'On / Off'"; //--- ToDo: Localize;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 8 * GUI_GRID_H + GUI_GRID_Y;
            w = 9.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };

    class Controls
    {
        class CLASS(generator_startStop_button): RscButton
        {
            idc = 1600;
            x = 1.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(generator,powerButton));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(generator_refuel_button): RscButton
        {
            idc = 1601;
            text = "Refuel"; //--- ToDo: Localize;
            x = 1.5 * GUI_GRID_W + GUI_GRID_X;
            y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(generator,refuel));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(generator_exitButton): RscButton
        {
	        idc = 1602;
	        text = "Exit"; //--- ToDo: Localize;
	        x = 30 * GUI_GRID_W + GUI_GRID_X;
	        y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 8 * GUI_GRID_W;
	        h = 2 * GUI_GRID_H;
	        colorBackground[] = {0.2,0.2,0.2,0.7};
	        colorActive[] = {0.5,0.5,0.5,0.7};
            colorFocused[] = {0.5,0.5,0.5,0.7};
	        onButtonClick = QUOTE(closeDialog 2);
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
