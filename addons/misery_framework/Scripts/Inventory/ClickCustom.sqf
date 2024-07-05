 /* -----------------------------------
Click action for custom item usage
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private["_item","_description"];
_item=_this select 0;
_description="";
{
_description=getText(configFile>>_x>>_item>>"descriptionShort");
if!(_description=="")exitWith{};
}forEach["cfgWeapons","cfgMagazines"]; //["cfgWeapons","cfgMagazines","cfgGlasses","cfgVehicles"];
if(_description=="")exitWith{};
//hint parseText _description;