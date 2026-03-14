class CLASS(furniture_ui) {
    idd = 982389;
    onLoad = QUOTE([982389] call EFUNC(common,menuBlurEffect));
    movingEnable = 1;
    enableSimulation = 1;

    class ControlsBackground {
        class CLASS(furniture_background): CLASS(RscText) {
            idc = -1;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(furniture_itemSelectionTip): RscText {
            idc = -1;
            text = "Inventory:"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(furniture_prompt): RscText {
            idc = -1;
            text = "Furniture placement"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(furniture_icon): RscPicture
        {
            idc = 1200;
            x = 28.5 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
    };
    class Controls {
        class CLASS(furniture_list): RscListBox {
            idc = 1500;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 14 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onLBSelChanged = QUOTE([ARR_2(_this select 0,_this select 1)] call EFUNC(furniture,selected));
        };
        class CLASS(furniture_placeObject): RscButton {
            idc = 1600;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([] call EFUNC(furniture,placeFromMenu));
            text = "Place object"; //--- ToDo: Localize;
            x = 20.5 * GUI_GRID_W + GUI_GRID_X;
            y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(furniture_exit): RscButton {
            idc = 1602;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(closeDialog 2);
            text = "Exit"; //--- ToDo: Localize;
            x = 20.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(furniture_noteBox): RscText {
            idc = 1001;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 21 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(furniture_weightTip): RscText {
            idc = 1005;
            text = "Encumberance:"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(furniture_weight_progressBar): CLASS(RscProgress) {
            idc = 1800;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
    };
};
