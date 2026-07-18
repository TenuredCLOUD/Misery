#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pings player with audible alerts if certain entity classes are nearby
 * Also pushes feedback to spectrum's GUI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_entityDetection
*/

[{[ACE_player] call FUNC(hasDetector)}, {
    [{
        params ["_args", "_handle"];

        if (!([ACE_player] call FUNC(hasDetector)) || !alive ACE_player) exitWith {
            call FUNC(entityDetection);
            _handle call CBA_fnc_removePerFrameHandler;
        };

        private _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;
        private _weaponHolders = nearestObjects [getPos ACE_player, ["WeaponHolderSimulated", "GroundWeaponHolder", "Default"], 25];

        if ("remnant" call EFUNC(common,isModLoaded)) then {
            switch (true) do {
                case ([[MACRO_PHANTOM_ENTITIES], 25] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i25m);
                    [QGVAR(setSpectrumValues), [1000, 2000], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[MACRO_PHANTOM_ENTITIES], 50] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i50m);
                    [QGVAR(setSpectrumValues), [1000, 1000], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[MACRO_PHANTOM_ENTITIES], 150] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i150m);
                    [QGVAR(setSpectrumValues), [1000, 750], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[MACRO_PHANTOM_ENTITIES], 250] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i250m);
                    [QGVAR(setSpectrumValues), [1000, 500], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[MACRO_PHANTOM_ENTITIES], 350] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i350m);
                    [QGVAR(setSpectrumValues), [1000, 250], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[MACRO_PHANTOM_ENTITIES], 500] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i500m);
                    [QGVAR(setSpectrumValues), [1000, 100], ACE_player] call CBA_fnc_targetEvent;
                };
            };
        };

        if ("DSA_Spooks" call EFUNC(common,isModLoaded)) then {
            switch (true) do {
                case ([[_spookArray], 25] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i25m);
                    [QGVAR(setSpectrumValues), [1000, 2000], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[_spookArray], 50] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i50m);
                    [QGVAR(setSpectrumValues), [1000, 1000], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[_spookArray], 150] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i150m);
                    [QGVAR(setSpectrumValues), [1000, 750], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[_spookArray], 250] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i250m);
                    [QGVAR(setSpectrumValues), [1000, 500], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[_spookArray], 350] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i350m);
                    [QGVAR(setSpectrumValues), [1000, 250], ACE_player] call CBA_fnc_targetEvent;
                };
                case ([[_spookArray], 500] call EFUNC(common,nearEntities)): {
                    playSound QEGVAR(audio,sound_i500m);
                    [QGVAR(setSpectrumValues), [1000, 100], ACE_player] call CBA_fnc_targetEvent;
                };
            };
        };

        switch (true) do {
            case ([ACE_player, 1] call FUNC(nearArtifact)): {
                playSound QEGVAR(audio,sound_artifactSound);
                [QGVAR(setSpectrumValues), [1000, 5000], ACE_player] call CBA_fnc_targetEvent;
            };
            case ([ACE_player, 5] call FUNC(nearArtifact)): {
                playSound QEGVAR(audio,sound_artifactSound);
                [QGVAR(setSpectrumValues), [1000, 2500], ACE_player] call CBA_fnc_targetEvent;
            };
            case ([ACE_player, 10] call FUNC(nearArtifact)): {
                playSound QEGVAR(audio,sound_artifactSound);
                [QGVAR(setSpectrumValues), [1000, 1000], ACE_player] call CBA_fnc_targetEvent;
            };
        };
    }, 0.5] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
