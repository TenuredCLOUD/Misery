/*
Misery HUD & GUI layout / design
Source code from Drongo, edited by TenuredCLOUD
Designed specifically for Misery mod
*/

class Misery_BackGround
{
    idc = -1;
    type = 0;
    style = 96;
    x = QUOTE(UI_MACRO_X);
    y = QUOTE(UI_MACRO_Y);
    w = QUOTE(UI_MACRO_W);
    h = QUOTE(UI_MACRO_H);
    font = UI_MACRO_FONT;
    sizeEx = UI_MACRO_TEXTSIZE;
    colorBackground[] = {0,0,0,1}; // Black background
    colorText[] = {0.5,0.5,0.5,1}; // Grey foreground
    text = "";
    lineSpacing = 1;
};

class Misery_RscProgress
{
    onLoad = QUOTE(_this spawn { for '_i' from 0 to 1 step 0.01 do { (_this # 0) progresssetPosition _i; sleep 0.01 } });
    deletable = 0;
    fade = 0;
    access = 0;
    type = QUOTE(CT_PROGRESS);
    style = QUOTE(ST_HORIZONTAL);
    colorFrame[] = {0,0,0,0};
    colorBar[] =
    {
        "(profilenamespace getVariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getVariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getVariable ['GUI_BCG_RGB_B',0.21])",
        "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.8])"
    };
    x = 0.344;
    y = 0.619;
    w = 0.313726;
    h = 0.0261438;
    shadow = 2;
    texture = "#(argb,8,8,3)color(1,1,1,1)";
};

class Misery_RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = UI_MACRO_FONT;
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.06 * UI_MACRO_W;
    h = 0.08 * UI_MACRO_H;
};

class Misery_RscText {
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    type = 0;
    style = UI_MACRO_STYLE;
    shadow = 1;
    colorShadow[] = {0,0,0,0.5};
    font = UI_MACRO_FONT;
    SizeEx = UI_MACRO_TEXTSIZE;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    linespacing = 1;
    align = "center";
    valign = "middle";
};

class Misery_Checkbox
{
    idc = -1; // Control identifier
    type = 77; // Type is 77 for checkbox
    deletable = 0;
    style = 0;
    checked = 0; // Default state (checked or not)
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    color[] = {1, 1, 1, 0.7}; // RGBA color of the checkbox in normal state
    colorFocused[] = {1, 1, 1, 1}; // RGBA color of the checkbox when it has focus
    colorHover[] = {1, 1, 1, 1}; // RGBA color of the checkbox when the mouse cursor is over it
    colorPressed[] = {1, 1, 1, 1}; // RGBA color of the checkbox when it is pressed
    colorDisabled[] = {1, 1, 1, 0.2}; // RGBA color of the checkbox when it is disabled
    colorBackground[] = {0, 0, 0, 0}; // RGBA color of the checkbox's background
    colorBackgroundFocused[] = {0, 0, 0, 0}; // RGBA color of the checkbox's background when it has focus
    colorBackgroundHover[] = {0, 0, 0, 0}; // RGBA color of the checkbox's background when the mouse cursor is over it
    colorBackgroundPressed[] = {0, 0, 0, 0}; // RGBA color of the checkbox's background when it is pressed
    colorBackgroundDisabled[] = {0, 0, 0, 0}; // RGBA color of the checkbox's background when it is disabled
    tooltipColorText[] = {1, 1, 1, 1}; // RGBA color of the tooltip text
    tooltipColorBox[] = {1, 1, 1, 1}; // RGBA color of the tooltip box
    tooltipColorShade[] = {0, 0, 0, 0.65}; // RGBA color of the tooltip box's shadow
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
    textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; // Texture for checked state
    textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; // Texture for unchecked state
    textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; // Texture for focused checked state
    textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; // Texture for focused unchecked state
    textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; // Texture for hover checked state
    textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; // Texture for hover unchecked state
    texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; // Texture for pressed checked state
    texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; // Texture for pressed unchecked state
    textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; // Texture for disabled checked state
    textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; // Texture for disabled unchecked state
};

class Misery_StructuredText {
    idc = -1;
    type = 13;
    style = UI_MACRO_STYLE;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    x = 0.5;
    y = 0.5;
    w = 0.5;
    h = 0.5;
    size = UI_MACRO_TEXTSIZE;
    text = "";
    font = UI_MACRO_FONT;
    class Attributes {
        font = UI_MACRO_FONT;
        color = "#ffffff";
        align = "left";
        valign = "middle";
        shadow = "false";
        shadowColor = "#ff0000";
        size = "1";
  };
};

class Misery_RscEdit
{
    access = 0;
    type = 2;
    style = "0x00";
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorDisabled[] = {1,1,1,0.25};
    colorBackground[] = {0,0,0,0.5};
    colorText[] = {1,1,1,1};
    colorSelection[] = {1,1,1,0.25};
    font = UI_MACRO_FONT;
    SizeEx = UI_MACRO_TEXTSIZE;
    autocomplete = "";
    text = "";
    size = UI_MACRO_TEXTSIZE;
    shadow = 0;
    canModify = 1;
};

class Misery_RscTitle : Misery_RscText {
    style = 0;
    SizeEx = UI_MACRO_TEXTSIZE;
    colorText[] = {0.95, 0.95, 0.95, 1};
};

class Misery_RscButtonMenu {
    idc = -1;
    type = 16;
    style = UI_MACRO_STYLE;
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = UI_MACRO_BUTTON_W;
    h = UI_MACRO_BUTTON_H;
    animTextureNormal = UI_MACRO_BUTTON_COLOR3;
    animTextureDisabled = UI_MACRO_BUTTON_COLOR3;
    animTextureOver = UI_MACRO_BUTTON_COLOR3; //
    animTextureFocused = UI_MACRO_BUTTON_COLOR0;
    animTexturePressed = UI_MACRO_BUTTON_COLOR0; //
    animTextureDefault = UI_MACRO_BUTTON_COLOR3;
    textureNoShortcut = UI_MACRO_BUTTON_COLOR3;
    colorBackground[] = UI_MACRO_COLOR1;
    colorBackground2[] = {1,1,1,0.3};
    colorBackgroundFocused[] = UI_MACRO_COLOR1;
    // Text colour selected
    color[] = UI_MACRO_COLOR7;
    // Text colour other
    color2[] = UI_MACRO_COLOR7;
    colorText[] = UI_MACRO_COLOR7;
    colorFocused[] = UI_MACRO_COLOR7;
    colorDisabled[] = UI_MACRO_COLOR7;
    period = 1;
    periodFocus = 111;
    periodOver = 111;
    Size = UI_MACRO_TEXTSIZE;
    SizeEx = UI_MACRO_TEXTSIZE;
    soundEnter[] = {"",0.09,1};
    soundPush[] = {"",0.0,0};
    soundClick[] = {"",0.07,1};
    soundEscape[] = {"",0.09,1};
    action = "";
    text = "";
    font = UI_MACRO_FONT;
    class HitZone {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos {
        left = 0;
        top = 0;
        w = 0;
        h = 0;
    };
    class TextPos {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class Attributes {
        font = UI_MACRO_FONT;
        color = "#696969";
        align = "center";
        valign = "middle";
        shadow = "false";
    };
    class AttributesImage {
        color = "#696969";
        align = "left";
        valign = "middle";
    };
};

class Misery_RscButtonHidden : Misery_RscButtonMenu {
    animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
    animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
    animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
    animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
    animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
    animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
    textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
};

class Misery_RscButtonTabFNC : Misery_RscButtonHidden {
    idc = -1;
    text = "";
    tooltip = "";
    onButtonClick = "";
    x = UI_MACRO_TABFX;
    y = UI_MACRO_TABFY;
    w = UI_MACRO_TABFW;
    h = UI_MACRO_TABFH;
};

class Misery_RscButtonMenuText : Misery_RscButtonMenu{
};

class Misery_RscListBox
{
    style = 16;
    idc = -1;
    type = 5;
    w = 0.275;
    h = 0.04;
    font = UI_MACRO_FONT;
    // Text colour when selected
    colorSelect[] = UI_MACRO_COLOR1;
    // Colour the text will fade to when selected
    colorSelect2[] = UI_MACRO_COLOR1;
    // Basic text colour when NOT selected
    colorText[] = UI_MACRO_COLOR1;
    // Basic background colour
    //colorBackground[] = UI_MACRO_COLOR0;
    colorBackground[] = UI_MACRO_COLOR4;
    // Background colour behind the text when selected
    colorSelectBackground[] = UI_MACRO_COLOR7;
    // This is the colour that colorSelectBackground will fade to
    colorSelectBackground2[] = UI_MACRO_COLOR7;
    colorScrollbar[] = {0.2,0.2,0.2,1};
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    wholeHeight = 0.45;
    rowHeight = 0.04;
    color[] = UI_MACRO_COLOR1;
    colorActive[] = UI_MACRO_COLOR1;
    colorDisabled[] = {0,0,0,0.3};
    SizeEx = UI_MACRO_TEXTSIZE;
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    pictureColor[] = UI_MACRO_COLOR1;
    // What it fades to
    pictureColorSelect[] = UI_MACRO_COLOR1;
    pictureColorDisabled[] = UI_MACRO_COLOR1;
    class ListScrollBar
    {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
};

class Misery_ActiveText : Misery_RscText {
    idc = -1;
    type = 11;
    style = UI_MACRO_STYLE;
    color[] = UI_MACRO_COLOR1;
    colorActive[] = UI_MACRO_COLOR1;
    colorDisabled[] = {1,1,1,0.3};
    colorText[] = UI_MACRO_COLOR1;
    colorBackground[] = UI_MACRO_COLOR2;
    soundEnter[] = {"",0,1};
    soundPush[] = {"",0,1};
    soundClick[] = {"", 0,1};
    soundEscape[] = {"",0,1 };
    action = "";
    text = "";
    default = "false";
};

class Misery_ButtonExitTablet : Misery_RscButtonHidden {
    idc = -1;
    text = "";
    tooltip = "Exit";
    onButtonClick = QUOTE(closeDialog 0);
    x = UI_MACRO_COL + (UI_MACRO_COLINC * 5.5);
    //y = UI_MACRO_ROW + (UI_MACRO_ROWINC * 12.5);
    y = UI_MACRO_TABFY;
    w = UI_MACRO_BUTTON_W;
    h = UI_MACRO_BUTTON_H;
};
