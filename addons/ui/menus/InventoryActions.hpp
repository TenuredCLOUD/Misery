/*
Misery HUD layout / design
Imported from some of Drongo's displays with permission
Designed specifically for Misery mod
*/

class MiseryDisplayInventoryActions
{
    idd = 10000;
    duration = .1;
    fadein = 0;
    fadeout = 0;
    class controls
    {
        class Misery_ListActions : Misery_RscListBox
        {
            idc=10001;
            text="";
            tooltip="Actions";
            onLBSelChanged="[false] execVM '\z\misery\addons\inventory\functions\fnc_SelectAction.sqf'";
            onLBDblClick="[true] execVM '\z\misery\addons\inventory\functions\fnc_SelectAction.sqf'";
            x=UI_MACRO_COL+(UI_MACRO_COLINC*10);
            y=UI_MACRO_ROW+(UI_MACRO_ROWINC*1);
            w=UI_MACRO_BUTTON_W+(UI_MACRO_COLINC*1);
            h=UI_MACRO_BUTTON_H+(UI_MACRO_ROWINC*10);
            colorBackground[]={0.2,0.2,0.2,.7};
        };
    };
};
