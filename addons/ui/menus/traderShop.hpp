class CLASS(traderShop_ui) {
    idd = 982390;
    onLoad = QUOTE(call EFUNC(traders,loadTrader));
    onUnload = QUOTE(call EFUNC(traders,unloadTrader));

    class ControlsBackground {
        class CLASS(traderShop_background): CLASS(RscText) {
            idc = 1800;
            x = -0.15;
            y = -0.2;
            w = 1.3;
            h = 1.28;
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class CLASS(traderShop_prompt): RscText {
            idc = 1000;
            x = -0.125;
            y = -0.18;
            w = 0.525;
            h = 0.08;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(traderShop_playerFunds_info): RscText {
            idc = 1003;
            x = 0.7625;
            y = -0.06;
            w = 0.4375;
            h = 0.08;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(traderShop_shopFunds_info): RscText {
            idc = 1002;
            x = 0.7625;
            y = -0.12;
            w = 0.4375;
            h = 0.08;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(traderShop_icon): RscPicture {
            idc = 1200;
            x = 0.6875;
            y = 0.06;
            w = 0.2125;
            h = 0.2;
        };
    };
    class Controls {
        class CLASS(traderShop_dropList): RscCombo {
            idc = 2100;
            x = 0.001;
            y = -0.03;
            w = 0.5125;
            h = 0.04;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onLBSelChanged = QUOTE([] call EFUNC(traders,updateShop));
        };
        class CLASS(traderShop_shop_list): RscListBox {
            idc = 1500;
            x = 0;
            y = 0.02;
            w = 0.5125;
            h = 0.74;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onLBSelChanged = QUOTE([] call EFUNC(traders,processIcon));
        };
        class CLASS(traderShop_infoBox): RscText {
            idc = 1001;
            x = 0;
            y = 0.78;
            w = 0.5375;
            h = 0.28;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(traderShop_icon_infoBox): CLASS(StructuredText) {
            idc = 1004;
            x = 0.575;
            y = 0.28;
            w = 0.4875;
            h = 0.22;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(traderShop_sell): RscButton {
            idc = 1602;
            text = "Buy"; //--- ToDo: Localize;
            x = 0.5625;
            y = 0.54;
            w = 0.175;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE([ctrlText (_this select 0)] call EFUNC(traders,processTransaction));
        };
        class CLASS(traderShop_gift): RscButton {
            idc = 1603;
            text = "Gift Item"; //--- ToDo: Localize;
            x = 0.5625;
            y = 0.64;
            w = 0.175;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE([ctrlText (_this select 0)] call EFUNC(traders,processTransaction));
        };
        class CLASS(traderShop_buyMenu): RscButton {
            idc = 1600;
            text = "Sell Menu"; //--- ToDo: Localize;
            x = 0.5625;
            y = 0.74;
            w = 0.175;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE([] call EFUNC(traders,processMenuSwitch));
        };
        class CLASS(traderShop_exit): RscButton {
            idc = 1601;
            text = "Exit"; //--- ToDo: Localize;
            x = 0.95;
            y = 0.94;
            w = 0.175;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onButtonClick = QUOTE(GVAR(currentAction) = nil; closeDialog 2);
        };
        class CLASS(traderShop_showCompats): CLASS(Checkbox) {
            idc = 2800;
            tooltip = "Only show compatible weapon items";
            x = 0.53025;
            y = -0.0328;
            w = 0.0375;
            h = 0.04;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
            onCheckedChanged = QUOTE([] call EFUNC(traders,updateShop));
        };
    };
};
