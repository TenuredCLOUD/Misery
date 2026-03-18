class CLASS(banking_ui)
{
    idd = 483729;
    onLoad = QUOTE([483729] call EFUNC(common,menuBlurEffect); [] call EFUNC(currency,bankRefresh));

    class ControlsBackground
    {
        class CLASS(bank_background): CLASS(RscText)
        {
            idc = -1;
            x = -0.04 * GUI_GRID_W + GUI_GRID_X;
            y = 4.83 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 15.5 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(bank_prompt): RscText
        {
            idc = 1000;
            text = "New world Bank "; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_taxNotice): RscText
        {
            idc = 1005;
            text = "";
            x = 26 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_depositNotice): RscText
        {
            idc = 1006;
            text = "";
            x = 10.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 18 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_withdrawNotice): RscText
        {
            idc = 1007;
            text = "";
            x = 10.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 18 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
    class Controls
    {
        class CLASS(bank_playerWallet): RscText
        {
            idc = 1001;
            x = 26 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_playerBank): RscText
        {
            idc = 1002;
            x = 26 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_inputBox_funds): RscText
        {
            idc = 1004;
            x = 21.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 14 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_deposit): RscButton
        {
            idc = 1600;
            onButtonClick = QUOTE([] call EFUNC(currency,fundsDeposit));
            text = "Deposit"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_withdraw): RscButton
        {
            idc = 1601;
            onButtonClick = QUOTE([] call EFUNC(currency,fundsWithdraw));
            text = "Withdraw"; //--- ToDo: Localize;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(bank_inputBox): RscEdit
        {
            idc = 1400;
            x = 10.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
