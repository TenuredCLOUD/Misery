#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * BreathFog cycle
 * For players (runs on clients only)
 * Breath speeds are from player's fatigue
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_breathFog;
 *
 * Public: No
*/

while {true} do {

    player setVariable [QCLASS(breathCondensationEffect), true];

    if ((((call FUNC(environment)) select 2) == 0) || (!MiseryBreathFogAllowed) || (!alive player)) exitWith {
        if(EGVAR(common,debug))then{systemChat "Misery Breathfog cycle terminated..."};
        player setVariable [QCLASS(breathCondensationEffect), nil];
    };

    private ["_delay","_pfatigue","_MisFogObject","_FogEffect","_FogBreath"];

        if !(player getVariable [QCLASS(breathCondensation), false]) then {
        _pfatigue = (getFatigue player) * 100; //Fatigue calc
        if (_pfatigue >= 75) then {_delay=(1 + random 1);};
        if (_pfatigue >= 50 && _pfatigue < 75) then {_delay=(2 + random 2);};
        if (_pfatigue >= 25 && _pfatigue < 50) then {_delay=(3 + random 3);};
        if (_pfatigue < 25) then {_delay=(4 + random 4);};
        sleep _delay;
            if (((call FUNC(environment)) select 2) == 1) then {
                player setVariable [QCLASS(breathCondensation), true];
                _MisFogObject = "logic" createVehicleLocal (getPos player);
                _FogEffect = "#particlesource" createVehicleLocal getPos _MisFogObject;
                _FogEffect setParticleParams [["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 13,0],
                "", "Billboard", 0.5, 0.5, [0,0,0],    [0, 0.2, -0.2], 1, 1.275,    1, 0.2, [0, 0.2,0],
                [[1,1,1, 0.0001], [1,1,1, 0.01], [1,1,1, 0]], [1000], 1, 0.04, "", "", _MisFogObject];
                _FogEffect setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
                _FogEffect setDropInterval 0.001;
                _MisFogObject attachTo [player, [0,0.16,0], "neck", true];
                sleep 0.5;
                deleteVehicle _MisFogObject;
                player setVariable [QCLASS(breathCondensation), false];
            };
        };
    if(EGVAR(common,debug))then{systemChat "Misery BreathFog cycle..."};
    sleep 1;
};


