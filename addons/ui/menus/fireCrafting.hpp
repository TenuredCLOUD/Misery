class CLASS(fireCrafting_ui)
{
    idd = 982388;
    onLoad = QUOTE([982388] call EFUNC(common,menuBlurEffect); call EFUNC(fire,populate); [] call EFUNC(fire,burnMonitor));

    class ControlsBackground
    {
        class CLASS(fireCrafting_background): CLASS(RscText)
        {
            idc = -1;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(fireCrafting_prompt): RscText
        {
            idc = -1;
            text = "Fire crafting";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_icon): RscPicture
        {
            idc = -1;
            text = QPATHTOEF(icons,data\nearfire_ca.paa);
            x = 31 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class CLASS(fireCrafting_ignite_Button): RscButton
        {
            idc = 1600;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(fire,craft));
            text = "Craft";
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
        };
        class CLASS(fireCrafting_extinguish_Button): RscButton
        {
            idc = 1601;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(fire,extinguish));
            text = "Extinguish";
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 12 * GUI_GRID_H + GUI_GRID_Y;
            w = 8.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
        };
        class CLASS(fireCrafting_exit): RscButton
        {
            idc = 1602;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = "closeDialog 2";
            text = "Exit";
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
        };
        class CLASS(fireCrafting_noteBox): RscText
        {
            idc = 1001;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_progressBar): CLASS(RscProgress)
        {
            idc = 1010;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class CLASS(fireCrafting_tinder_combo): RscCombo
        {
            idc = 2100;
            x = 3 * GUI_GRID_W + GUI_GRID_X;
            y = 7 * GUI_GRID_H + GUI_GRID_Y;
            w = 16 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_fuel_combo): RscCombo
        {
            idc = 2101;
            x = 3 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 16 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_ignition_combo): RscCombo
        {
            idc = 2102;
            x = 3 * GUI_GRID_W + GUI_GRID_X;
            y = 13 * GUI_GRID_H + GUI_GRID_Y;
            w = 16 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_tinder_prompt): RscText
        {
            idc = 1002;
            text = "Tinder:";
            x = 3 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_fuel_prompt): RscText
        {
            idc = 1003;
            text = "Fuel source:";
            x = 3 * GUI_GRID_W + GUI_GRID_X;
            y = 8 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_ignitionSource_prompt): RscText
        {
            idc = 1006;
            text = "Ignition source:";
            x = 3 * GUI_GRID_W + GUI_GRID_X;
            y = 11 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fireCrafting_fuel_progressBar): CLASS(RscProgress)
        {
            idc = 1009;
            x = 28 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 10 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(fireCrafting_fuelTime_prompt): RscText
        {
            idc = 1008;
            text = "Burn time:";
            x = 28 * GUI_GRID_W + GUI_GRID_X;
            y = 6 * GUI_GRID_H + GUI_GRID_Y;
            w = 11.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
