// Basically parseSimpleArray but works whether there are brackets on the array or not. Designed for arrays of strings
private["_string","_array"];
_string="";
if((typeName _this)=="STRING")then{_string=_this}else{_string=str _this};
if(_string=="")exitWith{[]};
_array=[];
{_array pushBack _x;}forEach(_string splitString",[]""");
_array