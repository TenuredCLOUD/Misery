#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Adds Ambient Forge Audio
 *
 * Arguments:
 * 0: Forge <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_audio_forgeAudio
*/

params ["_forge"];

if (!GVAR(forgeAmbience)) exitWith {};

private _soundSource = createSoundSource [QGVAR(sfx_v_furnace), getPosATL _forge, [], 0];
_forge setVariable [QGVAR(forgeSoundSource), _soundSource];

// Delete Sound Source if Forge disappears
_forge addEventHandler ["Deleted", {
    params ["_forge"];
    private _soundSource = _forge getVariable [QGVAR(forgeSoundSource), objNull];
    deleteVehicle _soundSource;
}];
