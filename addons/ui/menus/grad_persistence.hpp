
class CLASS(grad_persistence_compat_ui)
{
    idd = 47237377;
    onLoad = QUOTE([47237377] call EFUNC(common,menuBlurEffect));

    class ControlsBackground
    {
        class misery_gradPersistence_background: misery_RscText
        {
            idc = -1;
            x = 3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 33 * GUI_GRID_W;
            h = 21.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class misery_gradPersistence_prompt: RscText
        {
            idc = -1;
            text = "GRAD Persistence"; //--- ToDo: Localize;
            x = 4 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class misery_gradPersistence_icon: RscPicture
        {
            idc = -1;
            text = QPATHTOEF(icons,data\savedisk_ca.paa);
            x = 27 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class misery_gradPersistence_save: RscButton
        {
            idc = -1;
            text = "Save world"; //--- ToDo: Localize;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 9 * GUI_GRID_H + GUI_GRID_Y;
	        w = 12 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
            colorText[] = {0,0.8,0,1};
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE([ARR_2(EGVAR(persistence,gradWarning),0)] remoteExec [ARR_2('grad_persistence_fnc_saveMission',2)]);
        };
        class misery_gradPersistence_wipe: RscButton
        {
            idc = -1;
            text = "Wipe world data"; //--- ToDo: Localize;
            x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 9 * GUI_GRID_H + GUI_GRID_Y;
	        w = 12 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
            colorText[] = {0.9,0,0,1};
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE([ARR_1(EGVAR(persistence,gradPersistenceTag))] remoteExec [ARR_2('grad_persistence_fnc_clearMissionData',2)]);
        };
        class misery_gradPersistence_cancel_wipe: RscButton
        {
            idc = -1;
            text = "Cancel"; //--- ToDo: Localize;
            x = 14 * GUI_GRID_W + GUI_GRID_X;
	        y = 15 * GUI_GRID_H + GUI_GRID_Y;
	        w = 12 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE(closeDialog 2);
        };
    };
};
