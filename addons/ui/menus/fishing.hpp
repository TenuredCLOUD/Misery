class CLASS(fishing_ui)
{
    idd = 982387;
    onLoad = QUOTE([982387] call EFUNC(common,menuBlurEffect));

    class ControlsBackground
    {
        class CLASS(fishing_background): CLASS(RscText)
        {
            idc = -1;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(fishing_prompt): RscText
        {
            idc = -1;
            text = "Fishing";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fishing_icon): RscPicture
        {
            idc = -1;
            text = "\z\misery\addons\icons\data\fish_ca.paa";
            x = 31 * GUI_GRID_W + GUI_GRID_X;
            y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class CLASS(fishing_lineTension_prompt): RscText
        {
            idc = 1010;
            text = "Line tension:";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fishing_lineOut_prompt): RscText
        {
            idc = 1012;
            text = "Line out:";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls
    {
        class CLASS(fishing_castLine_Button): RscButton
        {
            idc = 1600;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(fishing,castLine));
            text = "Cast line";
            x = 31 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onLoad = QUOTE(_this call EFUNC(fishing,castLineCheck));
        };
        class CLASS(fishing_exit): RscButton
        {
            idc = 1602;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Exit";
            x = 31.5 * GUI_GRID_W + GUI_GRID_X;
            y = 18 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(fishing,exit));
        };
        class CLASS(fishing_noteBox): RscText
        {
            idc = 1001;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(fishing_progressBar_tension): CLASS(RscProgress
        {
            idc = 1011;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 27.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            onLoad = QUOTE(findDisplay 982387 displayCtrl 1010 ctrlShow false);
        };
        class CLASS(fishing_progressBar_lineOut): CLASS(RscProgress
        {
            idc = 1013;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 12 * GUI_GRID_H + GUI_GRID_Y;
            w = 27.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            onLoad = QUOTE(findDisplay 982387 displayCtrl 1011 ctrlShow false);
        };
    };
};

