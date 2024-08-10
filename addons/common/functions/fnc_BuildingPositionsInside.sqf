// Building positions with a roof overhead

#include "\z\misery\addons\main\script_macros.hpp"

private["_building","_positions"];
_building=_this;
_positions=_building call EFUNC(common,BuildingPositions);
{if!(_x call Misery_misc_fnc_IsInsideloot)then{_positions=_positions-[_x]}}forEach _positions;
_positions