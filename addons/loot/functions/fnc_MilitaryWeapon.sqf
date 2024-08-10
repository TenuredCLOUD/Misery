/*
Misery Mil weapon checker
Designed specifically for Misery mod 
Source code by Drongo Permission recieved prior to usage
*/

private["_w","_isMilitary","_mags"];
_w=_this;
_isMilitary=false;
_mags=[];
//if((getNumber(configFile>>"CfgWeapons">>_w>>"FullAuto">>"autofire"))==1)then{_isMilitary=true};
if((getNumber(configFile>>"CfgWeapons">>_w>>"type"))==4)then{_isMilitary=true};
if!(_isMilitary)then{
	if((getText(configFile>>"CfgWeapons">>_w>>"cursor"))=="mg")then{_isMilitary=true};
};
if!(_isMilitary)then{
	_mags=getArray(configFile>>"CfgWeapons">>_w>>"magazines");
	{if(getNumber(configFile>>"CfgMagazines">>_w>>"count")>30)then{_isMilitary=true}}forEach _mags;
};
if!(_isMilitary)then{
	if("EGLM" in(getArray(configFile>>"CfgWeapons">>_w>>"muzzles")))then{_isMilitary=true};
};
_isMilitary