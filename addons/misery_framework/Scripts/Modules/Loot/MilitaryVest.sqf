 /* -----------------------------------
Misery Mil vest checker
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private["_item","_military","_armour"];
_item=_this;
_military=FALSE;
_armour=0;
{
_armour=getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"HitpointsProtectionInfo">>_x>>"armor");
if(_armour>0)exitWith{_military=TRUE}
}forEach["chest","body","abdomen","diaphragm","neck","pelvis","arms","legs"];
_military