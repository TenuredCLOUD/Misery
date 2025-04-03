class CLASS(banking_ui) {
    idd = 483729;

    onLoad = QUOTE([] call EFUNC(bank,refresh));

    class ControlsBackground {
        class CLASS(bank_background): CLASS(RscText) {
            idc = 1800;
            x = -0.001;
            y = 0.1932;
            w = 1;
            h = 0.62;
            colorBackground[]={0.2,0.2,0.2,.7};
        };
        class CLASS(bank_prompt): RscText {
            idc = 1000;
            text = "New world Bank "; //--- ToDo: Localize;
            x = 0.0125;
            y = 0.22;
            w = 0.275;
            h = 0.08;
        };
        class CLASS(bank_playerWallet): RscText {
            idc = 1001;
            x = 0.65;
            y = 0.2;
            w = 0.3375;
            h = 0.08;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(bank_playerbank): RscText {
            idc = 1002;
            x = 0.65;
            y = 0.26;
            w = 0.3375;
            h = 0.08;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(bank_phoenixFund): RscText {
            idc = 1003;
            x = 0.65;
            y = 0.32;
            w = 0.3375;
            h = 0.08;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(bank_inputBox_funds): RscText {
            idc = 1004;
            x = 0.5375;
            y = 0.4;
            w = 0.35;
            h = 0.06;
            sizeEx = 0.7 * GUI_GRID_H;
        };
    };
    class Controls {
        class CLASS(bank_deposit): RscButton {
            idc = 1600;
            text = "Deposit"; //--- ToDo: Localize;
            x = 0.0125;
            y = 0.46;
            w = 0.1875;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(bank,deposit));
        };
        class CLASS(bank_withdraw): RscButton {
            idc = 1601;
            text = "Withdraw"; //--- ToDo: Localize;
            x = 0.0125;
            y = 0.58;
            w = 0.1875;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(bank,withdraw));
        };
        class CLASS(bank_contribute): RscButton {
            idc = 1602;
            text = "Contribute"; //--- ToDo: Localize;
            x = 0.725;
            y = 0.46;
            w = 0.25;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(bank,contribute));
        };
        class CLASS(bank_inputBox): RscEdit {
            idc = 1400;
            x = 0.2625;
            y = 0.4;
            w = 0.275;
            h = 0.06;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(bank_claimSupport): RscButton {
            idc = 1603;
            text = "Claim Support"; //--- ToDo: Localize;
            x = 0.725;
            y = 0.58;
            w = 0.25;
            h = 0.08;
            colorBackground[] = {0.2, 0.2, 0.2, 0.7};
            colorFocused[] = {0.5, 0.5, 0.5, 0.7};
            colorActive[] = {0.5, 0.5, 0.5, 0.7};
            onButtonClick = QUOTE([] call EFUNC(bank,claim));
        };
    };
};

//$[1.063,[QCLASS(Bank_UI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(NWBank_BG",[2,"",["-0.04 * GUI_GRID_W + GUI_GRID_X","4.83 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","18 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(NWBank_Prompt",[2,"New world Bank ",["0.5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,QCLASS(NWBank_PlayerWallet",[2,"Player: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,QCLASS(NWBank_Deposit",[2,"Deposit",["0.5 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,QCLASS(NWBank_Withdraw",[2,"Withdraw",["0.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,QCLASS(NWBank_Contribute",[2,"Contribute",["28.5 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,QCLASS(NWBank_Playerbank",[2,"Bank Account: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,QCLASS(NWBank_PhoenixFund",[2,"Phoenix fund: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1400,QCLASS(NWBank_InputBox",[2,"",["10.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,QCLASS(NWBank_InputBox_funds",[2,"funds type",["21.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","14 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1603,QCLASS(NWBank_ClaimSupport",[2,"Claim Support",["28.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1005,QCLASS(NWBank_PhoenixFund_LastContibute",[2,"Last Phoenix fund donation by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","16.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1006,QCLASS(NWBank_PhoenixFundLastSupport",[2,"Last Phoenix fund support claim by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","18 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1007,"",[2,"Highest Phoenix fund donation by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1008,"",[2,"Highest Phoenix fund Support Claim by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","21 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]
//$[1.063,[QCLASS(Bank_UI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,QCLASS(NWBank_BG",[2,"",["-0.04 * GUI_GRID_W + GUI_GRID_X","4.83 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","15.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,QCLASS(NWBank_Prompt",[2,"New world Bank ",["0.5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,QCLASS(NWBank_PlayerWallet",[2,"Player: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,QCLASS(NWBank_Deposit",[2,"Deposit",["0.5 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,QCLASS(NWBank_Withdraw",[2,"Withdraw",["0.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,QCLASS(NWBank_Contribute",[2,"Contribute",["29 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,QCLASS(NWBank_Playerbank",[2,"Bank Account: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,QCLASS(NWBank_PhoenixFund",[2,"Phoenix fund: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1400,QCLASS(NWBank_InputBox",[2,"",["10.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,QCLASS(NWBank_InputBox_funds",[2,"funds type",["21.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","14 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1603,QCLASS(NWBank_ClaimSupport",[2,"Claim Support",["29 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]


