/*
Misery Banking UI
Processes Money starage, as well as a joint player account ("Phoenix fund")
Designed specifically for Misery mod
*/

class Misery_Banking_UI
{
    idd = 483729;

    onLoad = "[] call '\z\misery\addons\bank\functions\fnc_Bank_UI_Updater.sqf';";

class ControlsBackground
{
class Misery_NWBank_BG: Misery_RscText
{
    idc = 1800;
    x = QUOTE(-0.04 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(4.83 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(40 * GUI_GRID_W);
    h = QUOTE(15.5 * GUI_GRID_H);
    colorBackground[]={0.2,0.2,0.2,.7};
};
class Misery_NWBank_Prompt: RscText
{
    idc = 1000;
    text = "New world Bank "; //--- ToDo: Localize;
    x = QUOTE(0.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(5.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(11 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
};
class Misery_NWBank_PlayerWallet: RscText
{
    idc = 1001;
    x = QUOTE(26 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(13.5 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_NWBank_Playerbank: RscText
{
    idc = 1002;
    x = QUOTE(26 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(6.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(13.5 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_NWBank_PhoenixFund: RscText
{
    idc = 1003;
    x = QUOTE(26 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(8 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(13.5 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_NWBank_InputBox_funds: RscText
{
    idc = 1004;
    x = QUOTE(21.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(10 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(14 * GUI_GRID_W);
    h = QUOTE(1.5 * GUI_GRID_H);
    sizeEx = 0.7 * GUI_GRID_H;
};
};
class Controls
    {
class Misery_NWBank_Deposit: RscButton
{
    idc = 1600;
    text = "Deposit"; //--- ToDo: Localize;
    x = QUOTE(0.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(11.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(7.5 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "[] call '\z\misery\addons\bank\functions\fnc_Deposit.sqf';";
};
class Misery_NWBank_Withdraw: RscButton
{
    idc = 1601;
    text = "Withdraw"; //--- ToDo: Localize;
    x = QUOTE(0.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(14.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(7.5 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "[] call '\z\misery\addons\bank\functions\fnc_Withdraw.sqf';";
};
class Misery_NWBank_Contribute: RscButton
{
    idc = 1602;
    text = "Contribute"; //--- ToDo: Localize;
    x = QUOTE(29 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(11.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(10 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "[] call '\z\misery\addons\bank\functions\fnc_Contribute.sqf';";
};
class Misery_NWBank_InputBox: RscEdit
{
    idc = 1400;
    x = QUOTE(10.5 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(10 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(11 * GUI_GRID_W);
    h = QUOTE(1.5 * GUI_GRID_H);
    sizeEx = 0.7 * GUI_GRID_H;
};
class Misery_NWBank_ClaimSupport: RscButton
{
    idc = 1603;
    text = "Claim Support"; //--- ToDo: Localize;
    x = QUOTE(29 * GUI_GRID_W + GUI_GRID_X);
    y = QUOTE(14.5 * GUI_GRID_H + GUI_GRID_Y);
    w = QUOTE(10 * GUI_GRID_W);
    h = QUOTE(2 * GUI_GRID_H);
    colorBackground[] = {0.2, 0.2, 0.2, 0.7};
    colorFocused[] = {0.5, 0.5, 0.5, 0.7};
    colorActive[] = {0.5, 0.5, 0.5, 0.7};
    onButtonClick = "[] call '\z\misery\addons\bank\functions\fnc_Claim_support.sqf';";
};
    };
        };

//$[1.063,["Misery_Bank_UI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_NWBank_BG",[2,"",["-0.04 * GUI_GRID_W + GUI_GRID_X","4.83 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","18 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_NWBank_Prompt",[2,"New world Bank ",["0.5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_NWBank_PlayerWallet",[2,"Player: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,"Misery_NWBank_Deposit",[2,"Deposit",["0.5 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"Misery_NWBank_Withdraw",[2,"Withdraw",["0.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"Misery_NWBank_Contribute",[2,"Contribute",["28.5 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"Misery_NWBank_Playerbank",[2,"Bank Account: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,"Misery_NWBank_PhoenixFund",[2,"Phoenix fund: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1400,"Misery_NWBank_InputBox",[2,"",["10.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,"Misery_NWBank_InputBox_funds",[2,"funds type",["21.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","14 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1603,"Misery_NWBank_ClaimSupport",[2,"Claim Support",["28.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1005,"Misery_NWBank_PhoenixFund_LastContibute",[2,"Last Phoenix fund donation by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","16.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1006,"Misery_NWBank_PhoenixFundLastSupport",[2,"Last Phoenix fund support claim by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","18 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1007,"",[2,"Highest Phoenix fund donation by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","19.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1008,"",[2,"Highest Phoenix fund Support Claim by: 1%, in amount: 2% 3%",["17.5 * GUI_GRID_W + GUI_GRID_X","21 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]]
//$[1.063,["Misery_Bank_UI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1800,"Misery_NWBank_BG",[2,"",["-0.04 * GUI_GRID_W + GUI_GRID_X","4.83 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","15.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"Misery_NWBank_Prompt",[2,"New world Bank ",["0.5 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"Misery_NWBank_PlayerWallet",[2,"Player: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1600,"Misery_NWBank_Deposit",[2,"Deposit",["0.5 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"Misery_NWBank_Withdraw",[2,"Withdraw",["0.5 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"Misery_NWBank_Contribute",[2,"Contribute",["29 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"Misery_NWBank_Playerbank",[2,"Bank Account: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1003,"Misery_NWBank_PhoenixFund",[2,"Phoenix fund: 1% 2%",["26 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1400,"Misery_NWBank_InputBox",[2,"",["10.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","11 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1004,"Misery_NWBank_InputBox_funds",[2,"funds type",["21.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","14 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],[1603,"Misery_NWBank_ClaimSupport",[2,"Claim Support",["29 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","2 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]


