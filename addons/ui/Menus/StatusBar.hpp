/*
Misery Primary HUD option 
Concepts Based on GF Ravage Status Bar script & JakeHekesFist [DMD] displays 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/
class MiseryStatusBar
{
    idd = -1; // The ID of the dialog
    duration = 999999999; // The duration the dialog will stay open (in seconds)
    onLoad = "uiNamespace setVariable ['MiseryStatusBar', _this select 0];"; // Code executed when the dialog is loaded
    fadein = 0; // Time it takes for the dialog to fade in (in seconds)
    fadeout = 0; // Time it takes for the dialog to fade out (in seconds)
    movingEnable = 0; // Whether the dialog can be moved by the player (0 = no, 1 = yes)
    objects[] = {}; // An array of objects in the dialog
    class controls
	{
        class statusBarText
		{
            idc = 881488; // The ID of the control
            x = 0.905 * safezoneW + safezoneX; // The horizontal position of the control (0 = left side of the screen, 1 = right side)
            y = 0.3 * safezoneH + safezoneY; // The vertical position of the control (0 = top of the screen, 1 = bottom)
            w = 0.095 * safezoneW; // The width of the control (as a fraction of the screen width)
            h = 1 * safezoneH; // The height of the control (as a fraction of the screen height)
            colorBackground[] = {0,0,0,0}; // The background color of the control (in RGBA format)
            shadow = 0; // Whether the control has a shadow (0 = no, 1 = yes)
            font = "PuristaMedium"; // The font of the control
            size = 0.035; // The size of the control
            type = 13; // The type of the control (13 = CT_STATIC)
            style = 1; // The style of the control (1 = ST_LEFT)
            text = ""; // The initial text of the control

            class Attributes
			{
                align="right"; // The horizontal alignment of the text
                valign = "middle"; // The vertical alignment of the text
                shadow = 0; // Whether the text has a shadow (0 = no, 1 = yes)
                shadowColor = "#000000"; // The color of the text shadow (in RGB format)
                color = "#ffffff"; // The color of the text (in RGB format)
                font = "PuristaMedium"; // The font of the text
                size = 0.8; // The size of the text
            };
        };
    };
};

