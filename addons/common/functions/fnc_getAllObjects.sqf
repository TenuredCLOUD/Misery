// Get all alive objects and empty vehicles
private["_objects"];
_objects=[];
{if((count(crew _x))==0)then{_objects pushBackUnique _x}}forEach(entities[["All"],["Man","Animal","Logic"],FALSE,TRUE]);
{
if(_x in(allMissionObjects "all"))then{_objects pushBackUnique _x};
}forEach(MiseryCenter nearSupplies(MiseryRadius*2));
_objects