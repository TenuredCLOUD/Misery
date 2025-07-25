#include "..\script_component.hpp"

class CLASS(VehicleStartMenu) {
    idd = 274840;
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class RscBackground: RscText {
            idc = -1;
            x = 0.35 * safezoneW + safezoneX;
            y = 0.35 * safezoneH + safezoneY;
            w = 0.3 * safezoneW;
            h = 0.3 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.7};
        };
    };

    class controls {
        class RscStatusText: RscText {
            idc = 1000;
            text = "Vehicle: Unknown";
            x = 0.36 * safezoneW + safezoneX;
            y = 0.36 * safezoneH + safezoneY;
            w = 0.28 * safezoneW;
            h = 0.04 * safezoneH;
            colorText[] = {1, 1, 1, 1};
        };

        class RscStartButton: RscButton {
            idc = 1600;
            text = "Start Engine";
            x = 0.36 * safezoneW + safezoneX;
            y = 0.42 * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.04 * safezoneH;
        };

        class RscStopButton: RscButton {
            idc = 1601;
            text = "Stop Engine";
            x = 0.51 * safezoneW + safezoneX;
            y = 0.42 * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.04 * safezoneH;
        };

        class RscStatusButton: RscButton {
            idc = 1602;
            text = "Check Status";
            x = 0.36 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.04 * safezoneH;
        };

        class RscExitButton: RscButton {
            idc = 1603;
            text = "Exit";
            x = 0.51 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.04 * safezoneH;
        };
    };
};
