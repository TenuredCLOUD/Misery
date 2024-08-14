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
            x=Misery_COL+(Misery_COLINC*10);
            y=Misery_ROW+(Misery_ROWINC*1);
            w=Misery_BUTTON_W+(Misery_COLINC*1);
            h=Misery_BUTTON_H+(Misery_ROWINC*10);
            colorBackground[]={0.2,0.2,0.2,.7};
        };
    };
};
