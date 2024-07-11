/*
Headlamp Usage (Turning off)
This function syncs to all client in a server environment
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _player = _this select 0;

if (!isNil {_player getVariable "Misery_Headlamp"}) then {
    
    private _headlamp = _player getVariable "Misery_Headlamp";
    deleteVehicle _headlamp; 

    _player removeitem "Misery_HeadlampON";
    _player additem "Misery_HeadlampOFF";

    _player setVariable ["Misery_Headlamp", nil, true];

	//Fixes reloader issues:
}else{ 
_player removeitem "Misery_HeadlampON";
_player additem "Misery_HeadlampOFF";
};