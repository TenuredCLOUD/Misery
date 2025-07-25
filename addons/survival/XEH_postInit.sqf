#include "script_component.hpp"

GVAR(decayLevel) = 0;
GVAR(decayEffect) = ppEffectCreate ["colorCorrections", 1500];

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    [] call FUNC(loop);
}] call CBA_fnc_addEventHandler;

GVAR(energyModifiers) = 0;
GVAR(hungerModifiers) = 0;
GVAR(infectionModifiers) = 0;
GVAR(parasiteModifiers) = 0;
GVAR(radiationModifiers) = 0;
GVAR(thirstModifiers) = 0;
GVAR(toxicityModifiers) = 0;
