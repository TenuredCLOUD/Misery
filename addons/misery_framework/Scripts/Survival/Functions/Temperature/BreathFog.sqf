/* -----------------------------------
Misery BreathFog cycle
BreathFog for players (runs on clients only)
Breath speeds are from player's fatigue 
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

while {TRUE} do {

	player setVariable ["MiseryBreathFogSim", true];

    if ((((call Misery_fnc_Temperature) select 2) == 0) || (MiseryBreathFogAllowed == false) || (!alive player)) exitWith {
        if(MiseryDebug)then{systemChat "Misery Breathfog cycle terminated..."};
		player setVariable ["MiseryBreathFogSim", nil];
    };

    private ["_delay","_pfatigue","_MisFogObject","_FogEffect","_FogBreath"];

        if !(player getVariable ["MiseryBreath", false]) then {
        _pfatigue = (getfatigue player) * 100; //Fatigue calc 
        if (_pfatigue >= 75) then {_delay=(1 + random 1);}; 
        if (_pfatigue >= 50 && _pfatigue < 75) then {_delay=(2 + random 2);};
        if (_pfatigue >= 25 && _pfatigue < 50) then {_delay=(3 + random 3);};
        if (_pfatigue < 25) then {_delay=(4 + random 4);}; 
        sleep _delay;
            if (((call Misery_fnc_Temperature) select 2) == 1) then {
				player setVariable ["MiseryBreath", true];
                _MisFogObject = "logic" createVehicleLocal (getPos player);
                _FogEffect = "#particlesource" createVehicleLocal getPos _MisFogObject;
                _FogEffect setParticleParams [["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 13,0],
                "", "Billboard", 0.5, 0.5, [0,0,0],	[0, 0.2, -0.2], 1, 1.275,	1, 0.2, [0, 0.2,0], 
                [[1,1,1, 0.0001], [1,1,1, 0.01], [1,1,1, 0]], [1000], 1, 0.04, "", "", _MisFogObject];
                _FogEffect setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
                _FogEffect setDropInterval 0.001;
                _MisFogObject attachTo [player, [0,0.16,0], "neck", true];
				sleep 0.5;
                deleteVehicle _MisFogObject;
                player setVariable ["MiseryBreath", false];
            };
    	};
    if(MiseryDebug)then{systemChat "Misery BreathFog cycle..."};
    sleep 1;
};


