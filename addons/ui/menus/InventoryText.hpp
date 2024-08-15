/*
Misery HUD layout / design
Imported from some of Drongo's displays with permission
Designed specifically for Misery mod
*/

class MiseryDisplayInventoryText
{
    idd = 99000;
    duration = .1;
    fadein = 0;
    fadeout = 0;
    class controls
    {
        class Misery_Frame: Misery_RscText
        {
            //colorBackground[]={0, 0, 0, 0.7};
            colorBackground[]={0.2,0.2,0.2,.7};
            idc=-1;
            x=UI_MACRO_COL+(UI_MACRO_COLINC*3);
            y=UI_MACRO_ROW+(UI_MACRO_ROWINC*-1);
            w=UI_MACRO_BUTTON_W+(UI_MACRO_COLINC*0);
            h=UI_MACRO_BUTTON_H+(UI_MACRO_ROWINC*0);
        };
        class Misery_ActiveTextInv : Misery_ActiveText
        {
            idc=-1;
            text="Actions";
            action="execVM '\z\misery\addons\inventory\functions\fnc_DisplayActions.sqf'";
            x=UI_MACRO_COL+(UI_MACRO_COLINC*3);
            y=UI_MACRO_ROW+(UI_MACRO_ROWINC*-1);
            w=UI_MACRO_BUTTON_W+(UI_MACRO_COLINC*1);
            h=UI_MACRO_BUTTON_H;
            align = "center";
            valign = "middle";
        };
    };
};
