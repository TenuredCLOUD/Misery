private["_item"];
_item=_this;
if(getText(configFile>>"CfgVehicles">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgWeapons">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgMagazines">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgGoggles">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
if(getText(configFile>>"CfgBackpacks">>_item>>"author")=="Bohemia Interactive")exitWith{TRUE};
FALSE