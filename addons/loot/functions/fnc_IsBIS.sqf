/*
Misery IsBIS parent check
Designed specifically for Misery mod 
Source code by Drongo Permission recieved prior to usage
*/

private["_item"];
_item=_this;
if(getText(configFile>>"CfgVehicles">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgWeapons">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgMagazines">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgGoggles">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgBackpacks">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
FALSE