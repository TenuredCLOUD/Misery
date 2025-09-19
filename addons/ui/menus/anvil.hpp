class CLASS(anvil_ui)
{
    idd = 274840;
    onLoad = QUOTE([274840] call EFUNC(common,menuBlurEffect); [] call EFUNC(anvil,outputsListed));

    class ControlsBackground
    {
        class CLASS(anvil_background): CLASS(RscText)
        {
	        idc = -1;
	        x = 0 * GUI_GRID_W + GUI_GRID_X;
	        y = 0 * GUI_GRID_H + GUI_GRID_Y;
	        w = 40 * GUI_GRID_W;
	        h = 25 * GUI_GRID_H;
	        colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(forge_itemSelectionTip): RscText
        {
	        idc = -1;
	        text = "Recipes:"; //--- ToDo: Localize;
	        x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 2 * GUI_GRID_H + GUI_GRID_Y;
	        w = 11 * GUI_GRID_W;
	        h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(anvil_prompt): RscText
        {
	        idc = -1;
	        text = "Smithing Anvil"; //--- ToDo: Localize;
	        x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 0 * GUI_GRID_H + GUI_GRID_Y;
	        w = 22 * GUI_GRID_W;
	        h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(anvil_icon): RscPicture
        {
	        idc = -1;
	        text = QPATHTOEF(icons,data\ingot_ca.paa);
	        x = 31 * GUI_GRID_W + GUI_GRID_X;
	        y = 2 * GUI_GRID_H + GUI_GRID_Y;
	        w = 5.5 * GUI_GRID_W;
	        h = 3.5 * GUI_GRID_H;
        };
    };

    class Controls
    {
        class CLASS(anvil_list_1): RscListBox
        {
	        idc = 1500;
	        x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 4 * GUI_GRID_H + GUI_GRID_Y;
	        w = 16.5 * GUI_GRID_W;
	        h = 14 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(anvil_craft_Button): RscButton
        {
	        idc = 1600;
	        colorFocused[] = {0.5,0.5,0.5,0.7};
	        onButtonClick = QUOTE([] call EFUNC(anvil,process));
	        text = "Craft"; //--- ToDo: Localize;
	        x = 19 * GUI_GRID_W + GUI_GRID_X;
	        y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 7.5 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
	        colorBackground[] = {0.2,0.2,0.2,0.7};
	        colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(anvil_showRecipe): RscButton
        {
	        idc = 1603;
	        colorFocused[] = {0.5,0.5,0.5,0.7};
	        onButtonClick = QUOTE([] call EFUNC(anvil,showRecipe));
	        text = "Show Recipe"; //--- ToDo: Localize;
	        x = 19 * GUI_GRID_W + GUI_GRID_X;
	        y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 7.5 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
	        colorBackground[] = {0.2,0.2,0.2,0.7};
	        colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(anvil_exit): RscButton
        {
	        idc = 1602;
	        colorFocused[] = {0.5,0.5,0.5,0.7};
	        onButtonClick = QUOTE(closeDialog 2);
	        text = "Exit"; //--- ToDo: Localize;
	        x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 7.5 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
	        colorBackground[] = {0.2,0.2,0.2,0.7};
	        colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(anvil_noteBox): RscText
        {
	        idc = 1001;
	        x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 39 * GUI_GRID_W;
	        h = 4 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(anvil_progressBar): CLASS(RscProgress
        {
	        idc = 1010;
	        x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 39 * GUI_GRID_W;
	        h = 1 * GUI_GRID_H;
        };
    };
};
