 /* -----------------------------------
Misery Mil uniform checker
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private["_item","_text","_side"];
_item=_this;
_text=getText(configFile>>"cfgWeapons">>_item>>"ItemInfo">>"uniformClass");
_side=getNumber(configfile>>"CfgVehicles">>_text>>"side");
if(_side==3)exitWith{FALSE};
TRUE