#include "script_component.hpp"

if (isServer) then {
    ["Misery_Forge", "init", {
        params ["_forge"];
        _forge call EFUNC(audio,forgeAudio);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
};