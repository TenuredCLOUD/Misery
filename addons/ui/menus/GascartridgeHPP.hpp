/*
Misery Primary HUD option
Concepts Based on GF Ravage Status Bar script & JakeHekesFist [DMD] displays
Designed specifically for Misery mod
by TenuredCLOUD
*/

class Gascartridge
{
        idd = -1;
        duration = 10000000000;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(gasCartridge)),_this select 0)]);
        fadein = 0;
        fadeout = 0;
        movingEnable = 0;
        objects[] = {};

class controlsBackground
{
        class statusBarImage
      {
           idc = 55557;
        type = 0;
        style = 48;
        x = safezoneX + safezoneW - 0.90; //1.90 Default    //1.50     center       1.20     right    1.90 for 1920 ,    1.38 for 1024
        y = safezoneY + safezoneH - 0.315;    //70     down      75     up        0.075
        w = 1.38;
        h = 0.08;
        colorText[] = {1, 1, 1, 1};
        colorBackground[]={0,0,0,0};
        sizeEx = 0.4;
        font = "PuristaMedium";
        text = "";


        class Attributes
        {
        align="center";
        color = "#ffffff";
        font = "PuristaMedium";
        };
      };
};

class controls
{
        class statusBarText
      {
        idc = 55554;
        x = safezoneX + safezoneW - 0.90; //1.90 Default //1.50     center       1.20     right    1.90 for 1920 ,    1.38 for 1024
        y = safezoneY + safezoneH - 0.315;    //70     down      75     up        0.070
        w = 1.38;
        h = 0.08;
        shadow = 0;//1
        font = "PuristaMedium";
        size = 0.035; //Default 0.040
        type = 13;
        style = 1; //2;
        text = "";

        class Attributes
        {
        align="center";
        color = "#ffffff";
        font = "PuristaMedium";
        };
      };
   };
};
