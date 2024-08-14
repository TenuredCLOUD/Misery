#include "..\script_component.hpp"
// Basically parseSimpleArray but works whether there are brackets on the array or not. Designed for arrays of strings
private["_string","_array"];
_string="";if((typeName _this)=="STRING")then{_string=_this}else{_string=str _this};
//_array=[];
//{if((typeName _x)=="STRING")then{_array pushBack _x}else{_array pushBack(str _x)}}forEach(_string splitString",");
//_string=_this;
if(_string=="")exitWith{[]};
if!(((_string splitString "")select 0)=="[")then{_string=format["[%1]",_string]};
(parseSimpleArray _string)
