class RscText {
    idc = -1;
    type = 0;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
    shadow = 1;
};

class RscStructuredText {
    idc = -1;
    type = 13;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
};

class RscPicture {
    access = 0;
    idc = -1;
    type = 0;
    style = 48; // ST_PICTURE
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    font = "PuristaMedium";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
};

class RscListBox {
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
    class ListScrollBar {
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

class RscButton {
    idc = -1;
    type = 1;
    style = 2;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
};

class RscEdit {
    idc = -1;
    type = 2;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
    text = "";
};

class RscCombo {
    idc = -1;
    type = 4;
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1, 1, 1, 1};
};

class RscFrame {
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0, 0, 0, 1};
    colorText[] = {1, 1, 1, 1};
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};

class RscCheckBox {
    idc = -1;
    type = 77;
    style = 0;
    checked = 0;
    x = 0; y = 0; w = 1; h = 1;
    color[] = {1, 1, 1, 0.7};
    colorFocused[] = {1, 1, 1, 1};
    colorHover[] = {1, 1, 1, 1};
    colorPressed[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.2};
    colorBackground[] = {0, 0, 0, 0};
    colorBackgroundFocused[] = {0, 0, 0, 0};
    colorBackgroundHover[] = {0, 0, 0, 0};
    colorBackgroundPressed[] = {0, 0, 0, 0};
    colorBackgroundDisabled[] = {0, 0, 0, 0};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter.wss", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush.wss", 0.09, 1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick.wss", 0.09, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape.wss", 0.09, 1};
    textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
};

class RscProgress;
class RscBackGround;

class CLASS(BackGround): RscBackGround {
    idc = -1;
    type = 0;
    style = 96;
    x = QUOTE(UI_MACRO_X);
    y = QUOTE(UI_MACRO_Y);
    w = QUOTE(UI_MACRO_W);
    h = QUOTE(UI_MACRO_H);
    font = UI_MACRO_FONT;
    sizeEx = UI_MACRO_TEXTSIZE;
    colorBackground[] = {0, 0, 0, 1};
    colorText[] = {0.5, 0.5, 0.5, 1};
    text = "";
    lineSpacing = 1;
};

class CLASS(RscProgress): RscProgress {
    deletable = 0;
    fade = 0;
    access = 0;
    type = 8;
    style = 0; // ST_HORIZONTAL
    colorFrame[] = {1, 1, 1, 0.8};
    colorBar[] = {1, 1, 1, 1};
    colorBackground[] = {0, 0, 0, 0.3};
    colorText[] = {1, 1, 1, 0};
    font = UI_MACRO_FONT;
    sizeEx = UI_MACRO_TEXTSIZE;
    shadow = 2;
    texture = "#(argb,8,8,3)color(1,1,1,1)";
};

class CLASS(RscPicture): RscPicture {
    access = 0;
    idc = -1;
    type = 0;
    style = 48;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
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

class CLASS(RscText): RscText {
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    type = 0;
    style = UI_MACRO_STYLE;
    shadow = 1;
    colorShadow[] = {0, 0, 0, 0.5};
    font = UI_MACRO_FONT;
    SizeEx = UI_MACRO_TEXTSIZE;
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = {0, 0, 0, 0};
    linespacing = 1;
};

class CLASS(ActiveText) : CLASS(RscText) {
    idc = -1;
    type = 11;
    style = UI_MACRO_STYLE;
    color[] = UI_MACRO_COLOR1;
    colorActive[] = UI_MACRO_COLOR1;
    colorDisabled[] = {1, 1, 1, 0.3};
    colorText[] = UI_MACRO_COLOR1;
    colorBackground[] = UI_MACRO_COLOR2;
    soundEnter[] = {"", 0, 1};
    soundPush[] = {"", 0, 1};
    soundClick[] = {"", 0, 1};
    soundEscape[] = {"", 0, 1 };
    action = "";
    text = "";
    default = "false";
};

class CLASS(Checkbox): RscCheckBox {
    x = 0; y = 0; w = 1; h = 1;
};

class CLASS(RscListBox): RscListBox {
    style = 16;
    idc = -1;
    type = 5;
    w = 0.275;
    h = 0.04;
    font = UI_MACRO_FONT;
    colorSelect[] = UI_MACRO_COLOR1;
    colorSelect2[] = UI_MACRO_COLOR1;
    colorText[] = UI_MACRO_COLOR1;
    colorBackground[] = UI_MACRO_COLOR4;
    colorSelectBackground[] = UI_MACRO_COLOR7;
    colorSelectBackground2[] = UI_MACRO_COLOR7;
    colorScrollbar[] = {0.2, 0.2, 0.2, 1};
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    wholeHeight = 0.45;
    rowHeight = 0.04;
    color[] = UI_MACRO_COLOR1;
    colorActive[] = UI_MACRO_COLOR1;
    colorDisabled[] = {0, 0, 0, 0.3};
    SizeEx = UI_MACRO_TEXTSIZE;
    soundSelect[] = {"", 0.1, 1};
    maxHistoryDelay = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    pictureColor[] = UI_MACRO_COLOR1;
    pictureColorSelect[] = UI_MACRO_COLOR1;
    pictureColorDisabled[] = UI_MACRO_COLOR1;
    class ListScrollBar {
        color[] = {1, 1, 1, 0.6};
        colorActive[] = {1, 1, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.3};
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
};

class CLASS(StructuredText): RscStructuredText {
    idc = -1;
    type = 13;
    style = UI_MACRO_STYLE;
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = {0, 0, 0, 0};
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
        shadow = 0;
        shadowColor = "#00000000";
        size = "1";
    };
};

class CLASS(RscEdit): RscEdit {
    access = 0;
    type = 2;
    style = 0;
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorDisabled[] = {1, 1, 1, 0.25};
    colorBackground[] = {0, 0, 0, 0.5};
    colorText[] = {1, 1, 1, 1};
    colorSelection[] = {1, 1, 1, 0.25};
    font = UI_MACRO_FONT;
    SizeEx = UI_MACRO_TEXTSIZE;
    autocomplete = "";
    text = "";
    size = UI_MACRO_TEXTSIZE;
    shadow = 0;
    canModify = 1;
};
