#include "..\script_component.hpp"
/*
Clothing warmth calcs
Designed specifically for Misery mod
Code concepts by Drongo, edited by TenuredCLOUD
*/

// // Calculate warmth of clothing (based on mass of uniform, vest and headgear)
private _man=_this;
// Coverage of uniform, vest, headgear, goggles (often balaclavas)
private _u=getNumber(configFile>>"CfgWeapons">>(uniform _man)>>"ItemInfo">>"mass");
// Reduce _v by armour value?
private _v=getNumber(configFile>>"CfgWeapons">>(vest _man)>>"ItemInfo">>"mass");
_v=round(_v/2);
private _h=getNumber(configFile>>"CfgWeapons">>(headgear _man)>>"ItemInfo">>"mass");
_h=round(_h/3);
private _g=getNumber(configFile>>"CfgWeapons">>(goggles _man)>>"ItemInfo">>"mass");

// Extra warmth for Ghillies and Gorkas, wetsuits:
if(((toLower(uniform _man))find "ghillie")>-1)then{_u=_u * 3};
if(((toLower(uniform _man))find "gorka")>-1)then{_u=_u * 3 };
if(((toLower(uniform _man))find "wetsuit")>-1)then{_u=_u * 2};

// Extra warmth for ushankas, balaclavas, beanies, and shemags: (+calc if facewear / helmet has no value)
if(((toLower(headgear _man))find "watchcap")>-1)then{
if (_h < 6 || _h isEqualTo 0) then {
_h=((6) * 3);
}else{
_h=_h * 3;
};
};
if(((toLower(headgear _man))find "ushanka")>-1)then{
if (_h < 6 || _h isEqualTo 0) then {
_h=((6) * 3);
}else{
_h=_h * 3;
};
};
if(((toLower(headgear _man))find "bala")>-1)then{
if (_h < 6 || _h isEqualTo 0) then {
_h=((6) * 3);
}else{
_h=_h * 3;
};
};
if(((toLower(headgear _man))find "shem")>-1)then{
if (_h < 6 || _h isEqualTo 0) then {
_h=((6) * 3);
}else{
_h=_h * 3;
};
};
if(((toLower(goggles _man))find "bala")>-1)then{
if (_g < 6 || _g isEqualTo 0) then {
_g=((6) * 3);
}else{
_g=_g * 3;
};
};
if(((toLower(goggles _man))find "shem")>-1)then{
if (_g < 6 || _g isEqualTo 0) then {
_g=((6) * 3);
}else{
_g=_g * 3;
};
};

private _warmth=(_u+_v+_h+_g);
//Ceil to round up in case clothing mass is very low integer value example: 1 * 3 = 3 /10 = 0.3 ceil = 1;
_warmth=ceil(_warmth/10);
_u=round(_u/10);
_v=round(_v/10);
_h=ceil(_h/10);
_g=ceil(_g/10);
private _text=format["Uniform: %1  Vest: %2  Headwear: %3  Facewear: %4",_u,_v,_h,_g];
[_warmth,[_u,_v,_h,_g],_text]

