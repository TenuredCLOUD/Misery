class CLASS(vitals_framework_ui) {
    idd = 982377;
    onLoad = QUOTE([982377] call EFUNC(common,menuBlurEffect); [] call EFUNC(vitals,status)); //_this call EFUNC(inventory,initInventoryDialog));

    class ControlsBackground {
        // class CLASS(vitals_framework_actions_background): CLASS(RscText) {
        //     idc = -1;
        //     x = -26 * GUI_GRID_W + GUI_GRID_X;
        //     y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 16.5 * GUI_GRID_W;
        //     h = 31.5 * GUI_GRID_H;
        //     colorBackground[] = {0,0,0,0.7};
        // };
        class CLASS(vitals_framework_background): CLASS(RscText) {
            // idc = -1;
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 16.5 * GUI_GRID_W;
            // h = 31.5 * GUI_GRID_H;
            // colorBackground[] = {0,0,0,0.7};

            idc = -1;
	        x = -3.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 47 * GUI_GRID_W;
	        h = 8 * GUI_GRID_H;
	        colorBackground[] = {0,0,0,0.7};
        };
        // class CLASS(vitals_framework_prompt): RscText {
        //     idc = -1;
        //     text = "Actions:";
        //     x = -25.5 * GUI_GRID_W + GUI_GRID_X;
        //     y = -3 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 4 * GUI_GRID_W;
        //     h = 2.5 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        // };
        // class CLASS(vitals_framework_items_prompt): RscText {
        //     idc = -1;
        //     text = "Items:";
        //     x = -25.5 * GUI_GRID_W + GUI_GRID_X;
        //     y = 10 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 4 * GUI_GRID_W;
        //     h = 2.5 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        // };
        class CLASS(vitals_framework_status_buffs): RscText {
            idc = -1;
            text = "Buffs:";
            // x = 50.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4 * GUI_GRID_W;
            // h = 2.5 * GUI_GRID_H;
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
            // x = 58.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4.5 * GUI_GRID_W;
            // h = 2.5 * GUI_GRID_H;
            x = 37 * GUI_GRID_W + GUI_GRID_X;
	        y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4.5 * GUI_GRID_W;
	        h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls {
        // class CLASS(vitals_framework_actionList): RscListBox {
        //     idc = 1500;
        //     x = -25 * GUI_GRID_W + GUI_GRID_X;
        //     y = -1 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 14.5 * GUI_GRID_W;
        //     h = 9.5 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        // };
        // class CLASS(vitals_framework_actionButton): RscButton {
        //     idc = 1600;
        //     text = "Confirm Selection";
        //     x = -17.5 * GUI_GRID_W + GUI_GRID_X;
        //     y = 9 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 7 * GUI_GRID_W;
        //     h = 1.5 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        //     colorBackground[] = {0,0,0,0.7};
        //     colorFocused[] = {0.5,0.5,0.5,0.7};
        //     colorActive[] = {0.5,0.5,0.5,0.7};
        //     onButtonClick = QUOTE([true] call EFUNC(actions,selectAction));
        // };
        // class CLASS(vitals_framework_itemsList): RscListBox {
        //     idc = 1503;
        //     x = -25 * GUI_GRID_W + GUI_GRID_X;
        //     y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 14.5 * GUI_GRID_W;
        //     h = 9.5 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        // };
        // class CLASS(vitals_framework_itemsSelect): RscCombo {
        //     idc = 2100;
        //     x = -25 * GUI_GRID_W + GUI_GRID_X;
        //     y = 12 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 15 * GUI_GRID_W;
        //     h = 1 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        // };
        // class CLASS(vitals_framework_itemsSelection): RscButton {
        //     idc = 1601;
        //     text = "Use";
        //     x = -17 * GUI_GRID_W + GUI_GRID_X;
        //     y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 7 * GUI_GRID_W;
        //     h = 1.5 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        //     colorBackground[] = {0,0,0,0.7};
        //     colorFocused[] = {0.5,0.5,0.5,0.7};
        //     colorActive[] = {0.5,0.5,0.5,0.7};
        //     onButtonClick = QUOTE([ctrlParent (_this select 0)] call EFUNC(inventory,handleItemUse));
        // };
        class CLASS(vitals_framework_status_hunger): RscText {
            idc = 1003;
            text = "Hunger:";
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4 * GUI_GRID_W;
            // h = 1 * GUI_GRID_H;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
	        y = 3 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4 * GUI_GRID_W;
	        h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_hungerBar): CLASS(RscProgress) {
            idc = 1012;
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4.8 * GUI_GRID_W;
            // h = 0.5 * GUI_GRID_H;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
	        y = 4 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4.8 * GUI_GRID_W;
	        h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_thirst): RscText {
            idc = 1005;
            text = "Thirst:";
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 3 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4 * GUI_GRID_W;
            // h = 1 * GUI_GRID_H;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
	        y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4 * GUI_GRID_W;
	        h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_thirstBar): CLASS(RscProgress) {
            idc = 1013;
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 4 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4.8 * GUI_GRID_W;
            // h = 0.5 * GUI_GRID_H;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
	        y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4.8 * GUI_GRID_W;
	        h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_fatigue): RscText {
            idc = 1006;
            text = "Fatigue:";
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4 * GUI_GRID_W;
            // h = 1 * GUI_GRID_H;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
	        y = 6 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4 * GUI_GRID_W;
	        h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_fatigueBar): CLASS(RscProgress) {
            idc = 1014;
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4.8 * GUI_GRID_W;
            // h = 0.5 * GUI_GRID_H;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
	        y = 7 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4.8 * GUI_GRID_W;
	        h = 0.5 * GUI_GRID_H;
        };
        class CLASS(vitals_framework_status_wetness): RscText {
            idc = 1007;
            text = "Wetness:";
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 6 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4.5 * GUI_GRID_W;
            // h = 1 * GUI_GRID_H;
            x = 13 * GUI_GRID_W + GUI_GRID_X;
	        y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4.5 * GUI_GRID_W;
	        h = 1 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_wetnessBar): CLASS(RscProgress) {
            idc = 1018;
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 7 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4.8 * GUI_GRID_W;
            // h = 0.5 * GUI_GRID_H;
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
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            // w = 5 * GUI_GRID_W;
            // h = 1.5 * GUI_GRID_H;
            x = 21.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 5 * GUI_GRID_W;
	        h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(vitals_framework_status_cartridgesBar): CLASS(RscProgress) {
            idc = 1017;
            // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 11 * GUI_GRID_H + GUI_GRID_Y;
            // w = 4.8 * GUI_GRID_W;
            // h = 0.5 * GUI_GRID_H;
            x = 21.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 4 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4.8 * GUI_GRID_W;
	        h = 0.5 * GUI_GRID_H;
        };
        // class CLASS(vitals_framework_status_temperature): RscText {
        //     idc = 1015;
        //     text = "Temperature:";
        //     // x = 49.5 * GUI_GRID_W + GUI_GRID_X;
        //     // y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
        //     // w = 6 * GUI_GRID_W;
        //     // h = 2 * GUI_GRID_H;
        //     x = 0 * GUI_GRID_W + GUI_GRID_X;
	    //     y = 25.5 * GUI_GRID_H + GUI_GRID_Y;
	    //     w = 6 * GUI_GRID_W;
	    //     h = 2 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        // };
        // class CLASS(vitals_framework_status_temperature_exposure): RscText {
        //     idc = 1010;
        //     text = "No ERU";
        //     x = 54.5 * GUI_GRID_W + GUI_GRID_X;
        //     y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
        //     w = 5 * GUI_GRID_W;
        //     h = 2 * GUI_GRID_H;
        //     font = UI_MACRO_FONT;
        //     sizeEx = UI_MACRO_TEXTSIZE;
        // };
        class CLASS(vitals_framework_status_buffs_list): RscListBox {
            idc = 1501;
            // x = 50.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 14 * GUI_GRID_H + GUI_GRID_Y;
            // w = 6 * GUI_GRID_W;
            // h = 2.5 * GUI_GRID_H;
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
            // x = 58.5 * GUI_GRID_W + GUI_GRID_X;
            // y = 14 * GUI_GRID_H + GUI_GRID_Y;
            // w = 6 * GUI_GRID_W;
            // h = 2.5 * GUI_GRID_H;
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
            // x = 0 * GUI_GRID_W + GUI_GRID_X;
            // y = 26 * GUI_GRID_H + GUI_GRID_Y;
            // w = 40 * GUI_GRID_W;
            // h = 4.5 * GUI_GRID_H;
            x = -3 * GUI_GRID_W + GUI_GRID_X;
	        y = 29 * GUI_GRID_H + GUI_GRID_Y;
	        w = 32.5 * GUI_GRID_W;
	        h = 4.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};







////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by TenuredCLOUD, v1.063, #Cucivy)
////////////////////////////////////////////////////////

// class misery_vitals_framework_vitals_background: misery_RscText
// {
// 	idc = 1000;
// 	x = -3.5 * GUI_GRID_W + GUI_GRID_X;
// 	y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 47 * GUI_GRID_W;
// 	h = 8 * GUI_GRID_H;
// 	colorBackground[] = {0,0,0,0.7};
// };
// class misery_vitals_framework_status_buffs: RscText
// {
// 	idc = 1001;
// 	text = "Buffs:"; //--- ToDo: Localize;
// 	x = 29.5 * GUI_GRID_W + GUI_GRID_X;
// 	y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4 * GUI_GRID_W;
// 	h = 2.5 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_ailments: RscText
// {
// 	idc = 1002;
// 	text = "Ailments:"; //--- ToDo: Localize;
// 	x = 37 * GUI_GRID_W + GUI_GRID_X;
// 	y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4.5 * GUI_GRID_W;
// 	h = 2.5 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_hunger: RscText
// {
// 	idc = 1003;

// 	text = "Hunger:"; //--- ToDo: Localize;
// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 3 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4 * GUI_GRID_W;
// 	h = 1 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_hungerBar: misery_RscProgress
// {
// 	idc = 1012;

// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 4 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4.8 * GUI_GRID_W;
// 	h = 0.5 * GUI_GRID_H;
// 	colorText[] = {1,1,1,0};
// 	colorBackground[] = {0,0,0,0.3};
// };
// class misery_vitals_framework_status_thirst: RscText
// {
// 	idc = 1005;

// 	text = "Thirst:"; //--- ToDo: Localize;
// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4 * GUI_GRID_W;
// 	h = 1 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_thirstBar: misery_RscProgress
// {
// 	idc = 1013;

// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4.8 * GUI_GRID_W;
// 	h = 0.5 * GUI_GRID_H;
// 	colorText[] = {1,1,1,0};
// 	colorBackground[] = {0,0,0,0.3};
// };
// class misery_vitals_framework_status_fatigue: RscText
// {
// 	idc = 1006;

// 	text = "Fatigue:"; //--- ToDo: Localize;
// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 6 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4 * GUI_GRID_W;
// 	h = 1 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_fatigueBar: misery_RscProgress
// {
// 	idc = 1014;

// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 7 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4.8 * GUI_GRID_W;
// 	h = 0.5 * GUI_GRID_H;
// 	colorText[] = {1,1,1,0};
// 	colorBackground[] = {0,0,0,0.3};
// };
// class misery_vitals_framework_status_wetness: RscText
// {
// 	idc = 1007;

// 	text = "Wetness:"; //--- ToDo: Localize;
// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4.5 * GUI_GRID_W;
// 	h = 1 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_wetnessBar: misery_RscProgress
// {
// 	idc = 1018;

// 	x = 13 * GUI_GRID_W + GUI_GRID_X;
// 	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4.8 * GUI_GRID_W;
// 	h = 0.5 * GUI_GRID_H;
// 	colorText[] = {1,1,1,0};
// 	colorBackground[] = {0,0,0,0.3};
// };
// class misery_vitals_framework_status_gasMask: RscText
// {
// 	idc = 1016;

// 	text = "Gas Mask:"; //--- ToDo: Localize;
// 	x = 21.5 * GUI_GRID_W + GUI_GRID_X;
// 	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 5 * GUI_GRID_W;
// 	h = 1.5 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_cartridgesBar: misery_RscProgress
// {
// 	idc = 1017;

// 	x = 21.5 * GUI_GRID_W + GUI_GRID_X;
// 	y = 4 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 4.8 * GUI_GRID_W;
// 	h = 0.5 * GUI_GRID_H;
// 	colorText[] = {1,1,1,0};
// 	colorBackground[] = {0,0,0,0.3};
// };
// class misery_vitals_framework_status_buffs_list: RscListBox
// {
// 	idc = 1501;
// 	onLBSelChanged = "_this call misery_vitals_fnc_processStatus";

// 	x = 29.5 * GUI_GRID_W + GUI_GRID_X;
// 	y = 29 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 6 * GUI_GRID_W;
// 	h = 2.5 * GUI_GRID_H;
// };
// class misery_vitals_framework_status_ailments_list: RscListBox
// {
// 	idc = 1502;
// 	onLBSelChanged = "_this call misery_vitals_fnc_processStatus";

// 	x = 37 * GUI_GRID_W + GUI_GRID_X;
// 	y = 29 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 6 * GUI_GRID_W;
// 	h = 2.5 * GUI_GRID_H;
// };
// class misery_vitals_framework_noteBox: RscStructuredText
// {
// 	idc = 1022;

// 	x = -3 * GUI_GRID_W + GUI_GRID_X;
// 	y = 29 * GUI_GRID_H + GUI_GRID_Y;
// 	w = 32.5 * GUI_GRID_W;
// 	h = 4.5 * GUI_GRID_H;
// };
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

