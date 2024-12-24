#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Radiation Zone processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radiation_fnc_zone;
 *
*/

[{!isNil "MiseryinRadZone" && MiseryinRadZone},
{

[{
        params ["_args","_handle"];

        if ((!isNil "MiseryinRadZone" && !MiseryinRadZone) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Radiation cycle terminated..."};
            [] call FUNC(zone);
            if(EGVAR(common,debug))then{systemChat "Misery Radiation cycle checks re-initiated..."};
        };

        private _gear = player call EFUNC(common,getSimplifiedLoadout);

        _totalProtection = [0, 0, 0, 0];

        {
            _equipment = _x;

            if (_equipment isEqualTo "") then {
                _totalProtection = [0, 0, 0, 0];
            } else {
                {
                    if (_x select 0 == _equipment) then {
                        _totalProtection = _totalProtection vectorAdd (_x select 1);
                    };
                } forEach EGVAR(common,protectiveGear);
            };
        } forEach _gear;

        _skinProtection = _totalProtection select 0;
        _respiratoryProtection = _totalProtection select 1;
        _eyeProtection = _totalProtection select 2;

        private _protectionFactor = _skinProtection + _respiratoryProtection + _eyeProtection;

        private _baseDose = 1;
        private _effectiveDose = _baseDose * (1 - (_protectionFactor / 300));

        player setVariable ["MiseryRadiation", (player getVariable ["MiseryRadiation", 0]) + _effectiveDose];

        if (EGVAR(common,debug)) then {
            systemChat format ["Radiation Protection: Skin %1%2, Respiratory %3%4, Eye %5%6", _skinProtection, "%", _respiratoryProtection, "%", _eyeProtection, "%"];
            systemChat format ["Effective Radiation Dose: %1", _effectiveDose];
        };

        if(EGVAR(common,debug))then{systemChat "Misery Radiation cycle..."};

}, 0.25, []] call CBA_fnc_addPerFrameHandler; // Adjusted interval to 0.25 seconds
}, []] call CBA_fnc_waitUntilAndExecute;


