class CLASS(vitals_framework_ui) {
    idd = 982377;
    onLoad = QUOTE([982377] call EFUNC(common,menuBlurEffect); [] call EFUNC(vitals,status));

    class ControlsBackground {
        class CLASS(vitals_framework_background): CLASS(RscText) {
            idc = -1;
            x = -3.5 * GUI_GRID_W + GUI_GRID_X;
            y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 47 * GUI_GRID_W;
            h = 8 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(vitals_framework_status_buffs): RscText {
            idc = -1;
            text = "Buffs:";
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_ailments): RscText {
            idc = -1;
            text = "Ailments:";
            x = 37 * GUI_GRID_W + GUI_GRID_X;
            y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls {
        class CLASS(vitals_framework_status_hunger): RscText {
            idc = 1003;
            text = "Hunger:";
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_hungerBar): CLASS(RscProgress) {
            idc = 1012;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_thirst): RscText {
            idc = 1005;
            text = "Thirst:";
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_thirstBar): CLASS(RscProgress) {
            idc = 1013;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_fatigue): RscText {
            idc = 1006;
            text = "Fatigue:";
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 6 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_fatigueBar): CLASS(RscProgress) {
            idc = 1014;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 7 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_wetness): RscText {
            idc = 1007;
            text = "Wetness:";
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_wetnessBar): CLASS(RscProgress) {
            idc = 1018;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_funds): RscText {
            idc = 1009;
            text = "Funds";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_gasMask): RscText {
            idc = 1016;
            text = "Gas Mask:";
            x = 21.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_cartridgesBar): CLASS(RscProgress) {
            idc = 1017;
            x = 21.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_buffs_list): RscListBox {
            idc = 1501;
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 29 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onLBSelChanged = QUOTE(_this call EFUNC(vitals,processStatus));
        };
        class CLASS(vitals_framework_status_ailments_list): RscListBox {
            idc = 1502;
            x = 37 * GUI_GRID_W + GUI_GRID_X;
            y = 29 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onLBSelChanged = QUOTE(_this call EFUNC(vitals,processStatus));
        };
        class CLASS(vitals_framework_noteBox): RscStructuredText {
            idc = 1022;
            x = -3 * GUI_GRID_W + GUI_GRID_X;
            y = 29 * GUI_GRID_H + GUI_GRID_Y;
            w = 32.5 * GUI_GRID_W;
            h = 4.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
