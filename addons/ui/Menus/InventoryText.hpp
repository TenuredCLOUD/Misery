/*
Misery HUD layout / design
Imported from some of Drongo's displays with permission
Designed specifically for Misery mod 
*/

class MiseryDisplayInventoryText
{
	idd = 99000; 
	duration = .1;
	fadein = 0;
	fadeout = 0;
	class controls
	{
		class Misery_Frame: Misery_RscText
		{
			//colorBackground[]={0, 0, 0, 0.7};
			colorBackground[]={0.2,0.2,0.2,.7};
			idc=-1;
			x=Misery_COL+(Misery_COLINC*3);
			y=Misery_ROW+(Misery_ROWINC*-1);
			w=Misery_BUTTON_W+(Misery_COLINC*0);
			h=Misery_BUTTON_H+(Misery_ROWINC*0);
		};
		class Misery_ActiveTextInv : Misery_ActiveText
		{
			idc=-1;
			text="Actions";
			action="execVM '\z\misery\addons\inventory\functions\fnc_DisplayActions.sqf'";
			x=Misery_COL+(Misery_COLINC*3);
			y=Misery_ROW+(Misery_ROWINC*-1);
			w=Misery_BUTTON_W+(Misery_COLINC*1);
			h=Misery_BUTTON_H;
			align = "center";
			valign = "middle";
		};
	};
};