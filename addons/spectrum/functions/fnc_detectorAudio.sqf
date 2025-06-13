#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Processes spectrum audio & dynamic pseudo entity events
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_detectorAudio
*/

[{[player] call FUNC(hasDetector)},
{
    [{
        params ["_args", "_handle"];

        private _randomAudio = round (random 10);
        private _randomRemnant = round (random 50);
        private _randomSpook = round (random 50);
        private _audioSource = objNull;

        if (_randomAudio isEqualTo 5) then {
            _audioSource = playSound selectRandom [MACRO_STATICWEIRD_SOUNDS];
        } else {
            _audioSource = playSound QEGVAR(audio,sound_staticBasic);
        };

        [_audioSource, _handle] call FUNC(audioLogic);

        if (_randomRemnant isEqualTo 25 && "remnant" call EFUNC(common,isModLoaded)) then {
            _group = creategroup [civilian, true];
            _pos = getPos player;
            _pos = [_pos select 0, _pos select 1, _pos select 2];
            _pos = _pos vectorAdd [50, 0, 0];
            _entity = [MACRO_PHANTOM_ENTITIES];
            (selectRandom _entity) createUnit [_pos, _group, QUOTE(_psuedoPhantom = this)];

            [{
                deleteVehicle _this;
            }, _psuedoPhantom, 30] call CBA_fnc_waitAndExecute;
        };

        if (_randomSpook isEqualTo 25 && "DSA_Spooks" call EFUNC(common,isModLoaded)) then {
            _group = creategroup [civilian, true];
            _pos = getPos player;
            _pos = [_pos select 0, _pos select 1, _pos select 2];
            _pos = _pos vectorAdd [50, 0, 0];
            _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;
            (selectRandom _spookArray) createUnit [_pos, _group, QUOTE(_psuedoSpook = this)];

            [{
                deleteVehicle _this;
            }, _psuedoSpook, 30] call CBA_fnc_waitAndExecute;
        };

    }, 59, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
