/* -----------------------------------
Misery Generator Position Tracking
Continually watches generator position to make sure it doesn't move, if it moves kill the engine...
This should prevent hiccups with fortification frameworks, or "moving" a generator
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

_Generator = _this select 0;
_lastPos = getPosATL _Generator; 

while {true} do {
    _currentPos = getPosATL _Generator; 

	//Check if generator is "Moving" (Base item framework of somekind? if so kill running gen)
    if (_currentPos distance _lastPos > 0.01) exitWith {
        _Generator setVariable ["Misery_Gen_IsRunning", false, true];
    };

	//Check if generator no longer exists
	if (isNull _Generator) exitWith {
		_Generator setVariable ["Misery_Gen_IsRunning", false, true];
	};
};
