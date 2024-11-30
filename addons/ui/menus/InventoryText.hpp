class CLASS(inventoryText_ui)
{
    idd = 99000;
    duration = .1;
    fadein = 0;
    fadeout = 0;
    class controls
    {
        class CLASS(inventoryFrame): CLASS(RscText)
        {
            //colorBackground[]={0, 0, 0, 0.7};
            colorBackground[]={0.2,0.2,0.2,.7};
            idc=-1;
            x=UI_MACRO_COL+(UI_MACRO_COLINC*3);
            y=UI_MACRO_ROW+(UI_MACRO_ROWINC*-1);
            w=UI_MACRO_BUTTON_W+(UI_MACRO_COLINC*0);
            h=UI_MACRO_BUTTON_H+(UI_MACRO_ROWINC*0);
        };
        class CLASS(ActiveText)Inv : CLASS(ActiveText)
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
