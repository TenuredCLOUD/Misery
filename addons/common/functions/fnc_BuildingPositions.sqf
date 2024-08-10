private["_building","_positions"];
_building=_this;
_positions=[_building]call BIS_fnc_buildingPositions;
{if(_x call Misery_fnc_IsInGeometry)then{_positions=_positions-[_x]}}forEach _positions;
_positions