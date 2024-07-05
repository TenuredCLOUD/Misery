 /* -----------------------------------
Misery Ambient SoundScape simulation
Runs random audio / sounds generated on a random player each loop...
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if (isServer) then {
    while {true} do {
        
        _players = allPlayers;

        _player = selectRandom _players;

        _angle = random 360;
        _distance = 50 + random 150; 
        _spawnPos = _player getPos [_distance, _angle];

        private _soundDummy = "Land_HelipadEmpty_F" createVehicle _spawnPos;
        _player setVariable ["_TC_sound", true,true];
        [_soundDummy, [selectRandom Misery_EnhancedAmbsoundscape_Listed_audio, 250]] remoteExec ["say3D", 0, _soundDummy];
        [{
            !(_player getVariable ["_TC_sound", false])
        },{
            deleteVehicle _this;
        }, _soundDummy] call CBA_fnc_waitUntilAndExecute;

        sleep 60 + random 120;
    };
};
