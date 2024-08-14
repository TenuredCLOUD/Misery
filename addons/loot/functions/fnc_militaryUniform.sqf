#include "..\script_component.hpp"
/*
Misery Mil uniform checker
Designed specifically for Misery mod
Source code by Drongo Permission recieved prior to usage
*/

private["_item","_text","_side"];
_item=_this;
_text=getText(configFile>>"cfgWeapons">>_item>>"ItemInfo">>"uniformClass");
_side=getNumber(configfile>>"CfgVehicles">>_text>>"side");
if(_side==3)exitWith{false};
true
