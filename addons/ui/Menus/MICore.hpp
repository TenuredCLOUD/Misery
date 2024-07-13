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
	x = PASS_STR(Misery_x);
	y = PASS_STR(Misery_y);
	w = PASS_STR(Misery_W);
	h = PASS_STR(Misery_H);
	font = Misery_font;
	sizeEx = Misery_TEXTSIZE;
	colorBackground[] = {0,0,0,1}; // Black background
	colorText[] = {0.5,0.5,0.5,1}; // Grey foreground
	text = "";
	lineSpacing = 1;
};

class Misery_RscProgress
{
    onLoad = "_this spawn { for '_i' from 0 to 1 step 0.01 do { (_this # 0) progressSetPosition _i; sleep 0.01 } }";
	deletable = 0;
	fade = 0;
	access = 0;
	type = PASS_STR(CT_PROGRESS);
	style = PASS_STR(ST_HORIZONTAL);
	colorFrame[] = {0,0,0,0};
	colorBar[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
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
	font = Misery_font;
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
	w = 0.06 * Misery_W;
	h = 0.08 * Misery_H;
};

class Misery_RscText {
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = Misery_style;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = Misery_font;
	SizeEx = Misery_TEXTSIZE;
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
	style = Misery_style;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	x = 0.5; 
	y = 0.5; 
	w = 0.5; 
	h = 0.5; 
	size = Misery_TEXTSIZE;
	text = "";
	font = Misery_font;
	class Attributes {
		font = Misery_font;
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
	font = Misery_font;
	SizeEx = Misery_TEXTSIZE;
	autocomplete = "";
	text = "";
	size = Misery_TEXTSIZE;
	shadow = 0;
	canModify = 1;
};
	
class Misery_RscTitle : Misery_RscText {
	style = 0;
	SizeEx = Misery_TEXTSIZE;
	colorText[] = {0.95, 0.95, 0.95, 1};
};

class Misery_RscButtonMenu {
	idc = -1;
	type = 16;
	style = Misery_style;
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = Misery_BUTTON_W;
	h = Misery_BUTTON_H;
	animTextureNormal = Misery_BUTTONCOLOUR3;
	animTextureDisabled = Misery_BUTTONCOLOUR3;
	animTextureOver = Misery_BUTTONCOLOUR3; //
	animTextureFocused = Misery_BUTTONCOLOUR0;
	animTexturePressed = Misery_BUTTONCOLOUR0; //
	animTextureDefault = Misery_BUTTONCOLOUR3;
	textureNoShortcut = Misery_BUTTONCOLOUR3;
	colorBackground[] = Misery_COLOUR1;
	colorBackground2[] = {1,1,1,0.3};
	colorBackgroundFocused[] = Misery_COLOUR1;
	// Text colour selected
	color[] = Misery_COLOUR7;
	// Text colour other
	color2[] = Misery_COLOUR7;
	colorText[] = Misery_COLOUR7;
	colorFocused[] = Misery_COLOUR7;
	colorDisabled[] = Misery_COLOUR7;
	period = 1;
	periodFocus = 111;
	periodOver = 111;
	Size = Misery_TEXTSIZE;
	SizeEx = Misery_TEXTSIZE;
	soundEnter[] = {"",0.09,1};
	soundPush[] = {"",0.0,0};
	soundClick[] = {"",0.07,1};
	soundEscape[] = {"",0.09,1};
	action = "";
	text = "";
	font = Misery_font;
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
		font = Misery_font;
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
	x = Misery_tabFx;
	y = Misery_tabFy;
	w = Misery_tabFw;
	h = Misery_tabFh;
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
	font = Misery_font;
	// Text colour when selected
	colorSelect[] = Misery_COLOUR1;
	// Colour the text will fade to when selected
	colorSelect2[] = Misery_COLOUR1;
	// Basic text colour when NOT selected
	colorText[] = Misery_COLOUR1;
	// Basic background colour
	//colorBackground[] = Misery_COLOUR0;
	colorBackground[] = Misery_COLOUR4;
	// Background colour behind the text when selected
	colorSelectBackground[] = Misery_COLOUR7;
	// This is the colour that colorSelectBackground will fade to
	colorSelectBackground2[] = Misery_COLOUR7;
	colorScrollbar[] = {0.2,0.2,0.2,1};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = Misery_COLOUR1;
	colorActive[] = Misery_COLOUR1;
	colorDisabled[] = {0,0,0,0.3};
	SizeEx = Misery_TEXTSIZE;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	pictureColor[] = Misery_COLOUR1;
	// What it fades to
	pictureColorSelect[] = Misery_COLOUR1;
	pictureColorDisabled[] = Misery_COLOUR1;
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
	style = Misery_style;
	color[] = Misery_COLOUR1;
	colorActive[] = Misery_COLOUR1;
	colorDisabled[] = {1,1,1,0.3};
	colorText[] = Misery_COLOUR1;
	colorBackground[] = Misery_COLOUR2;
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
	onButtonClick = "closeDialog 0";
	x = Misery_COL + (Misery_COLINC * 5.5);
	//y = Misery_ROW + (Misery_ROWINC * 12.5);
	y = Misery_tabFy;
	w = Misery_BUTTON_W;
	h = Misery_BUTTON_H;
};