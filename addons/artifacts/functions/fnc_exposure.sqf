#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Fallout glass radiation exposure
 * Doses player with radiation no matter what protection they have, scales with item count
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_exposure;
 *
*/

[{[[QCLASS(fallout_glass)]] call EFUNC(common,hasItem)}, {
    [{
        params ["_args", "_handle"];

        if !([[QCLASS(fallout_glass)]] call EFUNC(common,hasItem)) exitWith {
            call FUNC(exposure);
            _handle call CBA_fnc_removePerFrameHandler;
        };

        private _itemCount = [QCLASS(fallout_glass)] call EFUNC(common,countItem);

        private _dosage = _itemCount * 0.0025;

        [_dosage, "radiation"] call EFUNC(common,addStatusModifier);

        [QUOTE(COMPONENT_BEAUTIFIED), format ["Effective Fallout glass Radiation Dose: %1", _dosage]] call EFUNC(common,debugMessage);
    }, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
