#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Detection loop for specialized hearing protection
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_cognito_hazard_fnc_detectorLoop
*/

[{
    params ["_args", "_handle"];

    private _staticHandle = ACE_player getVariable [QGVAR(staticAudioHandle), -1];
    private _weirdHandle = ACE_player getVariable [QGVAR(weirdAudioHandle), -1];

    if (!alive ACE_player || !(ACE_player getVariable [QGVAR(hasSHP), false]) || !([[QCLASS(shpKit)]] call EFUNC(common,hasItem)) || (ACE_player getVariable [QCLASSACE(hasEarPlugsIn), false])) exitWith {

        if (_staticHandle isNotEqualTo -1) then {
            stopSound _staticHandle;
            ACE_player setVariable [QGVAR(staticAudioHandle), -1];
        };

        if (_weirdHandle isNotEqualTo -1) then {
            stopSound _weirdHandle;
            ACE_player setVariable [QGVAR(weirdAudioHandle), -1];
        };

        // Turn off SHP
        if (ACE_player getVariable [QGVAR(hasSHP), false]) then {
            ACE_player setVariable [QGVAR(hasSHP), false]
        };

        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _pos = getPosATL ACE_player;
    private _cognitoThreat = 0;
    private _insideHazard = false;
    private _entityThreat = 0;

    {
        private _areaPos = getMarkerPos _x;
        private _areaRadius = selectMax (getMarkerSize _x);
        private _dist = ACE_player distance _areaPos;

        if (_dist <= _areaRadius) then {
            _cognitoThreat = 1;
            _insideHazard = true;
        } else {
            private _warningDistance = 100;
            private _distanceToArea = _dist - _areaRadius;

            if (_distanceToArea < _warningDistance) then {
                private _threat = (1 - (_distanceToArea / _warningDistance)) max 0;
                _cognitoThreat = _cognitoThreat max _threat;
            };
        };
    } forEach (EGVAR(cognito_hazard,areasCached));

    private _targetClasses = [];

    if ("DSA_Spooks" call EFUNC(common,isModLoaded)) then {
        _targetClasses append ([] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures);
    };

    if ("remnant" call EFUNC(common,isModLoaded)) then {
        _targetClasses append [MACRO_PHANTOM_ENTITIES];
    };

    if ("WBK_ZombieCreatures" call EFUNC(common,isModLoaded)) then {
        _targetClasses append [MACRO_WZC_ENTITIES];
    };

    if (_targetClasses isNotEqualTo []) then {
        switch (true) do {
            case ([_targetClasses, 25] call EFUNC(common,nearEntities)): { _entityThreat = 1; };
            case ([_targetClasses, 50] call EFUNC(common,nearEntities)): { _entityThreat = 0.75; };
            case ([_targetClasses, 100] call EFUNC(common,nearEntities)): { _entityThreat = 0.50; };
            case ([_targetClasses, 150] call EFUNC(common,nearEntities)): { _entityThreat = 0.25; };
            default { _entityThreat = 0; };
        };
    };

    if (_cognitoThreat > 0) then {
        private _staticPitch = 1.0;
        private _staticVolume = 0.3;

        if (_insideHazard) then {
            _staticPitch = selectRandom [0.2, 0.3, 1.8, 2.0, 0.1];
            _staticVolume = 1.0;
        } else {
            _staticPitch = 0.5 + (_cognitoThreat * 0.9);
            _staticVolume = 0.2 + (_cognitoThreat * 0.6);
        };

        if (_staticHandle isNotEqualTo -1) then {
            stopSound _staticHandle;
        };

        _staticHandle = playSoundUI [QEGVAR(audio,sound_staticBasic), _staticVolume, _staticPitch];
        ACE_player setVariable [QGVAR(staticAudioHandle), _staticHandle];
    } else {
        if (_staticHandle isNotEqualTo -1) then {
            stopSound _staticHandle;
            ACE_player setVariable [QGVAR(staticAudioHandle), -1];
        };
    };

    if (_entityThreat > 0) then {
        private _nextBeep = ACE_player getVariable [QGVAR(nextBeepTime), 0];

        if (time >= _nextBeep) then {
            private _interval = 1.2 - (_entityThreat * 1.05);
            ACE_player setVariable [QGVAR(nextBeepTime), time + _interval];

            private _pitch = 0.8 + (_entityThreat * 0.8);
            private _volume = 0.5 + (_entityThreat * 0.5);

            playSoundUI [QCLASS(minedetector_beep_01), _volume, _pitch];
        };
    };

    private _nextRadioEvent = ACE_player getVariable [QGVAR(nextRadioTime), 0];
    if (time >= _nextRadioEvent) then {
        ACE_player setVariable [QGVAR(nextRadioTime), time + 20 + (random 20)];

        if (_weirdHandle isNotEqualTo -1) then {
            stopSound _weirdHandle;
        };

        private _selectedWeirdSound = selectRandom [MACRO_STATICWEIRD_SOUNDS];
        private _weirdPitch = if (_insideHazard) then { selectRandom [0.3, 1.7] } else { 1.0 };

        _weirdHandle = playSoundUI [_selectedWeirdSound, 0.8, _weirdPitch];
        ACE_player setVariable [QGVAR(weirdAudioHandle), _weirdHandle];

        if ((_cognitoThreat > 0.3 || _entityThreat > 0.3) && {random 1 > 0.75} && {"remnant" call EFUNC(common,isModLoaded)}) then {
            private _grp = createGroup [civilian, true];
            private _spawnPos = _pos vectorAdd [(selectRandom [-35, 35]), (selectRandom [-35, 35]), 0];
            private _unit = (selectRandom [MACRO_PHANTOM_ENTITIES]) createUnit [_spawnPos, _grp];

            [{
                deleteVehicle _this;
            }, _unit, 30] call CBA_fnc_waitAndExecute;
        };
    };

}, 0.25, []] call CBA_fnc_addPerFrameHandler;
