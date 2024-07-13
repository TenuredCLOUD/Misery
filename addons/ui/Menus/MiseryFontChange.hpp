/*
Misery Font overrider / HUD change
List and scroll bar controls + Certain Menu's Inventory, etc...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

class RscFrame
{
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0, 0, 0, 1};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};

class RscText
{
    idc = -1;
    type = 0;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
};

class RscButton
{
    idc = -1;
    type = 1;
    style = 2;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
};

class RscListBox
{
    type = 5;
    style = 0;
    idc = -1;
    colorBackground[] = {1, 1, 1, 0.1};
    colorSelect[] = {0, 0, 0, 1};
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    font = "PuristaMedium";
    sizeEx = 0.04;
    rowHeight = 0.02;
    colorScrollbar[] = {0.95, 0.95, 0.95, 1};
    colorSelect2[] = {0.95, 0.95, 0.95, 1};
    colorSelectBackground[] = {1, 1, 1, 0.5};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    soundSelect[] = {"", 0.1, 1};
    period = 0;
    maxHistoryDelay = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    shadow = 0;
    class ListScrollBar
    {
        color[] = {1, 1, 1, 0.6};
        colorActive[] = {1, 1, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
        shadow = 0;
    };
};

class RscEdit
{
    idc = -1;
    type = 2;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
};

class RscCombo
{
    idc = -1;
    type = 4;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
};

// class RscControlsGroup
// {
//     idc = -1;
//     type = 15;
//     style = 0;
//     font = "PuristaMedium";
//     sizeEx = 0.04;
//     colorText[] = {1, 1, 1, 1};
// };

class RscStructuredText
{
    idc = -1;
    type = 13;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
};

class RscPicture
{
    access = 0;
    idc = -1;
    type = 0;
    style = 48;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
};


