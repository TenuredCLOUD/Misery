#define COMPONENT animations
#define COMPONENT_BEAUTIFIED Animations
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#define MACRO_PROCESS_ITEM_ACTION(ITEM_CLASS) \
    private _config = GVAR(itemData) getOrDefault [ITEM_CLASS, []]; \
    if (_config isEqualTo []) exitWith {[QUOTE(COMPONENT_BEAUTIFIED), format ["No data for %1", ITEM_CLASS]] call EFUNC(common,debugMessage)}; \
    \
    _config params ["_offset", "_vectors", "_time", "_anim"]; \
    \
    if (gestureState player in [MACRO_ANIMATION_GESTURES]) exitWith {}; \
    \
    if (cameraView isEqualTo "EXTERNAL") then { \
        GVAR(currentActionProp) = ITEM_CLASS createVehicleLocal (getPos player); \
        GVAR(currentActionProp) attachTo [player, _offset, "LeftHand", true]; \
        GVAR(currentActionProp) setVectorDirAndUp _vectors; \
        player playAction _anim; \
        [{ \
            if (!isNull GVAR(currentActionProp)) then { \
                deleteVehicle GVAR(currentActionProp); \
                GVAR(currentActionProp) = objNull; \
            }; \
        }, [], _time] call CBA_fnc_waitAndExecute; \
    } else { \
        player playAction _anim; \
    };

#ifdef DEBUG_ENABLED_ANIMATIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ANIMATIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ANIMATIONS
#endif

#include "\z\misery\addons\main\script_macros.hpp"
