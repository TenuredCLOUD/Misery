#include "..\script_component.hpp"
/*
Misery Mil vest checker
Designed specifically for Misery mod
Source code by Drongo Permission recieved prior to usage
*/

private["_item","_military","_armour"];
_item=_this;
_military=false;
_armour=0;
{
_armour=getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"HitpointsProtectionInfo">>_x>>"armor");
if(_armour>0)exitWith{_military=true}
}forEach["chest","body","abdomen","diaphragm","neck","pelvis","arms","legs"];
_military