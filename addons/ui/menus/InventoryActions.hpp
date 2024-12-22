class CLASS(inventoryActions_ui)
{
    idd = 10000;
    duration = .1;
    fadein = 0;
    fadeout = 0;
    class controls
    {
        class CLASS(listActions) : CLASS(RscListBox)
        {
            idc=10001;
            text="";
            tooltip="Actions";
            onLBSelChanged= QUOTE([false] call EFUNC(inventory,selectAction));
            onLBDblClick= QUOTE([true] call EFUNC(inventory,selectAction));
            x=UI_MACRO_COL+(UI_MACRO_COLINC*10);
            y=UI_MACRO_ROW+(UI_MACRO_ROWINC*1);
            w=UI_MACRO_BUTTON_W+(UI_MACRO_COLINC*1);
            h=UI_MACRO_BUTTON_H+(UI_MACRO_ROWINC*10);
            colorBackground[]={0.2,0.2,0.2,.7};
        };
    };
};
