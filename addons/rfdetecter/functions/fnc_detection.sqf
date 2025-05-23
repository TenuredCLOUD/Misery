#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * RF detector loop (detection)
 * Runs audio samples + constant detection cycles
 * Detects entities as well as Artifacts in Ground weapon holders
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_rfdetector_fnc_detection;
 *
*/

[{(player getVariable [QCLASS(rfdetectorStatus), false])}, {
    [{
        params ["_args", "_handle"];

        if (!(player getVariable [QCLASS(rfdetectorStatus), false]) && (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        if ((player getVariable [QCLASS(rfdetectorStatus), false])) then {

            private _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;
            private _weaponHolders = nearestObjects [getPos player, ["WeaponHolderSimulated", "GroundWeaponHolder", "Default"], 25];

            //Remnant compat checks:
            if (EGVAR(common,remnant)) then {
                if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 25]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\25m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 50]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\50m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 150]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\150m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 250]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\250m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 350]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\350m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 500]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\500m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
            };

            //DSA compat checks:
            if (EGVAR(common,dsa)) then {
                if (count (player nearEntities [[_spookArray], 25]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\25m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [[_spookArray], 50]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\50m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [[_spookArray], 150]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\150m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [[_spookArray], 250]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\250m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [[_spookArray], 350]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\350m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
                if (count (player nearEntities [[_spookArray], 500]) > 0) then {
                    playSound3D [QPATHTOEF(audio,sounds\immersion\500m.ogg), player, false, getPosASL player, 1, 1, 50];
                };
            };

            {
                private _items = itemCargo _x;
                {
                    if (_x in _items) then {
                        playSound3D [QPATHTOEF(audio,sounds\immersion\ArtifactSOUND.ogg), player, false, getPosASL player, 1, 1, 50];
                        //   if (EGVAR(common,debug)) then {systemChat format ["'%1' found in weapon holder at position %2", _x, getPosATL _this]};
                    };
                } forEach [MACRO_ARTIFACTS];
            } forEach _weaponHolders;
        };
    }, 1] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;


