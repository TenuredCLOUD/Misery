class CLASS(medicalTreatment_ui)
{
    idd = 982381;
    onLoad = QUOTE([982381] call EFUNC(common,menuBlurEffect); [] call EFUNC(treatment,treatListed); call EFUNC(treatment,loadTreatment));
    onUnload = QUOTE(call EFUNC(treatment,unloadTreatment));

    class ControlsBackground
    {
        class CLASS(medicalTreatment_background): CLASS(RscText)
        {
            idc = -1;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 20.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(medicalTreatment_prompt): RscText
        {
            idc = -1;
            text = "Medical Treatment"; //--- ToDo: Localize;
            x = 1.6 * GUI_GRID_W + GUI_GRID_X;
            y = 0.24 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(medicalTreatment_icon): RscPicture
        {
            idc = -1;
            text = QPATHTOEF(icons,data\pillbottle_ca.paa);
            x = 31.5 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class CLASS(medicalTreatment_playerFunds): RscText
        {
            idc = 1002;
            x = 25 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls
    {
        class CLASS(medicalTreatment_list): RscListBox
        {
            idc = 1500;
            x = 1.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 12.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(medicalTreatment_purchase): RscButton
        {
            idc = 1600;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Purchase"; //--- ToDo: Localize;
            x = 25 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(treatment,processPurchase));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(medicalTreatment_exit): RscButton
        {
            idc = 1601;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Exit"; //--- ToDo: Localize;
            x = 25 * GUI_GRID_W + GUI_GRID_X;
            y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(closeDialog 2);
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(medicalTreatment_infoBox): RscText
        {
            idc = 1001;
            x = 1.5 * GUI_GRID_W + GUI_GRID_X;
            y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 37 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};

