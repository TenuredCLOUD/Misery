class CLASS(traderShop_ui) {
    idd = 982390;
    // onLoad = QUOTE(_trader = player getVariable 'currentTrader'; _trader setVariable ['Misery_TraderIsBusy', true, true]; _trader setVariable ['Misery_TradingWith', profileName, true]; GVAR(currentAction) = 'buy'; [] call EFUNC(traders,shopVal); [] call EFUNC(traders,processCategory); [] call EFUNC(traders,processMenuSwitch;));
    // onUnload = QUOTE(_trader = player getVariable 'currentTrader'; _trader setVariable ['Misery_TraderIsBusy', false, true]; _trader setVariable ['Misery_TradingWith', nil, true]; _queue = _trader getVariable 'Misery_TradingQue'; _index = _queue find (getPlayerUID player); if (_index isNotEqualTo -1) then {_queue deleteAt _index;_trader setVariable ['Misery_TradingQue', _queue, true];};);

    //Will need to convert onLoad and onUnload events to functions:
    onLoad = QUOTE(
        _trader = player getVariable [ARR_2(QUOTE(QGVAR(currentTrader)),objNull)];
        _trader setVariable [ARR_3(QUOTE(QGVAR(traderIsBusy)),true,true)];
        _trader setVariable [ARR_3(QUOTE(QGVAR(tradingWith)),profileName,true)];
        GVAR(currentAction) = buy;
        [] call EFUNC(traders,shopVal);
        [] call EFUNC(traders,processCategory);
        [] call EFUNC(traders,processMenuSwitch);
    );

    onUnload = QUOTE(
        _trader = player getVariable [ARR_2(QUOTE(QGVAR(currentTrader)),objNull)];
        _trader setVariable [ARR_3(QUOTE(QGVAR(traderIsBusy)),false,true)];
        _trader setVariable [ARR_3(QUOTE(QGVAR(tradingWith)),nil,true)];
        _queue = _trader getVariable [ARR_2(QUOTE(QGVAR(tradingQue)),[])];
        _index = _queue find (getPlayerUID player);
        if (_index isNotEqualTo -1) then {
            _queue deleteAt _index;
            _trader setVariable [ARR_3(QUOTE(QGVAR(tradingQue)),_queue,true)];
        };
    );


    class ControlsBackground {
        class CLASS(traderShop_background): CLASS(RscText) {
            idc = 1800;
            x = -0.15;
            y = -0.2;
            w = 1.3;
            h = 1.28;
            colorBackground[]={0.2,0.2,0.2,.7};
        };
        class CLASS(traderShop_prompt): RscText {
            idc = 1000;
            x = -0.125;
            y = -0.18;
            w = 0.525;
            h = 0.08;
        };
        class CLASS(traderShop_playerFunds_info): RscText {
            idc = 1003;
            x = 0.7625;
            y = -0.06;
            w = 0.4375;
            h = 0.08;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(traderShop_shopFunds_info): RscText {
            idc = 1002;
            x = 0.7625;
            y = -0.12;
            w = 0.4375;
            h = 0.08;
            sizeEx = 0.7 * GUI_GRID_H;
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
            sizeEx = 0.7 * GUI_GRID_H;
            onLBSelChanged = QUOTE([] call EFUNC(traders,shopVal));
        };
        class CLASS(traderShop_shop_list): RscListBox {
            idc = 1500;
            x = 0;
            y = 0.02;
            w = 0.5125;
            h = 0.74;
            sizeEx = 0.7 * GUI_GRID_H;
            onLBSelChanged = QUOTE([] call EFUNC(traders,processIcon));
        };
        class CLASS(traderShop_infoBox): RscText {
            idc = 1001;
            x = 0;
            y = 0.78;
            w = 0.5375;
            h = 0.28;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(traderShop_icon_infoBox): CLASS(StructuredText) {
            idc = 1004;
            x = 0.575;
            y = 0.28;
            w = 0.4875;
            h = 0.22;
            sizeEx = 0.65 * GUI_GRID_H;
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
            onButtonClick = QUOTE([] call EFUNC(traders,processTransaction));
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
            onButtonClick = QUOTE([] call EFUNC(traders,processGift));
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
            onButtonClick = QUOTE(GVAR(currentAction) = nil; closeDialog 2);
        };
        class CLASS(traderShop_showCompats): CLASS(Checkbox) {
            idc = 2800;
            tooltip = "Only show compatible weapon items";
            x = 0.53025;
            y = -0.0328;
            w = 0.0375;
            h = 0.04;
            onCheckedChanged = QUOTE([] call EFUNC(traders,shopVal));
        };
    };
};

//$[1.063,["traderShop_UI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"traderShop_BG",[2,"",["-6 * GUI_GRID_W + GUI_GRID_X","-5 * GUI_GRID_H + GUI_GRID_Y","52 * GUI_GRID_W","32 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"traderShop_Prompt",[2,"Store Name",["-5 * GUI_GRID_W + GUI_GRID_X","-4.5 * GUI_GRID_H + GUI_GRID_Y","21 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"traderShop_Shop_List",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","18.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1200,"traderShop_icon",[2,"\Data\Mappack\medical.paa",["27.5 * GUI_GRID_W + GUI_GRID_X","1.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"traderShop_Exit",[2,"Exit",["38 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"traderShop_InfoBox",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","21.5 * GUI_GRID_W","7 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,"traderShop_PlayerFunds_Info",[2,"Your funds:",["30.5 * GUI_GRID_W + GUI_GRID_X","-1.5 * GUI_GRID_H + GUI_GRID_Y","17.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1602,"traderShop_Sell",[2,"Sell",["22.5 * GUI_GRID_W + GUI_GRID_X","13.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"traderShop_Icon_infoBox",[2,"",["23 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","19.5 * GUI_GRID_W","5.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1603,"traderShop_Gift",[2,"Gift Item",["22.5 * GUI_GRID_W + GUI_GRID_X","16 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"traderShop_ShopFunds_Info",[2,"Shop funds:",["30.5 * GUI_GRID_W + GUI_GRID_X","-3 * GUI_GRID_H + GUI_GRID_Y","17.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,"traderShop_BuyMenu",[2,"Buy Menu",["22.5 * GUI_GRID_W + GUI_GRID_X","18.5 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2100,"traderShop_DropList",[2,"",["0.04 * GUI_GRID_W + GUI_GRID_X","-0.75 * GUI_GRID_H + GUI_GRID_Y","20.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1801,QCLASS(Trader_Buy_Icon_Frame",[2,"",["27.5 * GUI_GRID_W + GUI_GRID_X","1.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

