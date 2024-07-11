/*
Misery Mil Headgear checker
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_item","_sides"];
_item=_this;
_sides=getArray(configFile>>"cfgWeapons">>_item>>"ItemInfo">>"ModelSides");
if(_sides isEqualTo[3])exitWith{FALSE};
if(getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"HitpointsProtectionInfo">>"head">>"armor")==0)exitWith{FALSE};
TRUE