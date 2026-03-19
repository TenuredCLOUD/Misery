class CLASS(devils_luck_ui) {
    idd = 338455;
    onLoad = QUOTE([338455] call EFUNC(common,menuBlurEffect); [] call EFUNC(devils_luck,loadMenu));
    onUnload = QUOTE(call EFUNC(devils_luck,unloadMenu));

    class ControlsBackground {
        class CLASS(devils_luck_background): CLASS(RscText) {
            idc = -1;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(devils_luck_prompt): RscText {
            idc = 1100;
            text = "Devil's Luck";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_player_funds): RscText
        {
            idc = 2222;
            x = 28 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 11.5 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_dealer_funds): RscText
        {
            idc = 2223;
            x = 28 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 11.5 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };

    class Controls {
        class CLASS(devils_luck_left_die): RscPicture {
            idc = 1201;
            text = "\z\misery\addons\icons\data\dice_6_ca.paa";
            x = 9 * GUI_GRID_W + GUI_GRID_X;
            y = 7 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
        };
        class CLASS(devils_luck_right_die): RscPicture {
            idc = 1202;
            text = "\z\misery\addons\icons\data\dice_1_ca.paa";
            x = 16 * GUI_GRID_W + GUI_GRID_X;
            y = 7 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
        };
        class CLASS(devils_luck_dice_value): RscText {
            idc = 1101;
            text = "7";
            x = 14.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11 * GUI_GRID_H + GUI_GRID_Y;
            w = 2 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE * 1.5;
        };
        class CLASS(devils_luck_current_bet): RscText {
            idc = 1102;
            text = "Current Bet: 0";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_bet_amount): RscEdit {
            idc = 1600;
            x = 30 * GUI_GRID_W + GUI_GRID_X;
            y = 8 * GUI_GRID_H + GUI_GRID_Y;
            w = 9 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_bet_update): RscButton
        {
            idc = -1;
            onButtonClick = QUOTE([] call EFUNC(devils_luck,updateBetDisplay));
            text = "Place Bet";
            x = 30.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_prediction): RscText {
            idc = 1103;
            text = "Prediction: NONE";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_predict_higher): RscButton {
            idc = 1602;
            text = "Predict Higher";
            onButtonClick = QUOTE([true] call EFUNC(devils_luck,setPrediction));
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_predict_lower): RscButton {
            idc = 1603;
            text = "Predict Lower";
            onButtonClick = QUOTE([false] call EFUNC(devils_luck,setPrediction));
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_roll): RscButton {
            idc = 1604;
            text = "ROLL";
            onButtonClick = QUOTE([] call EFUNC(devils_luck,handleRoll));
            x = 16 * GUI_GRID_W + GUI_GRID_X;
            y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.4, 0, 0, 0.8};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_help_tips): RscButton
        {
            onButtonClick = QUOTE([] call EFUNC(devils_luck,rules));
            idc = 1606;
            text = "Rules";
            x = 31 * GUI_GRID_W + GUI_GRID_X;
            y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_exit): RscButton {
            idc = 1605;
            text = "Leave Game";
            onButtonClick = "closeDialog 2";
            x = 31 * GUI_GRID_W + GUI_GRID_X;
            y = 22 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(devils_luck_noteBox): RscText {
            idc = 1104;
            text = "Place your bets...";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
