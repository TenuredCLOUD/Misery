// Building positions with a roof overhead
private["_building","_positions"];
_building=_this;
_positions=_building call Misery_fnc_BuildingPositions;
{if!(_x call Misery_fnc_IsInsideloot)then{_positions=_positions-[_x]}}forEach _positions;
_positions