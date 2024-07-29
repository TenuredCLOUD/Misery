/*
Misery Radiation Zone processor
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

[{!isNil "MiseryinRadZone" && MiseryinRadZone == true}, 
{

[{
        params ["_args","_handle"];

        if ((!isNil "MiseryinRadZone" && MiseryinRadZone == false) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Radiation cycle terminated..."};
            [] execVM MIS_FILESYS(Modules\RadZone\RadZoneinit);
            if(MiseryDebug)then{systemChat "Misery Radiation cycle checks re-initiated..."};
        };

        private _gear = player call Misery_fnc_GetSimplifiedLoadout;

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
                } forEach Misery_ProtectiveGearRatings;
            };
        } forEach _gear;

        _skinProtection = _totalProtection select 0;
        _respiratoryProtection = _totalProtection select 1;
        _eyeProtection = _totalProtection select 2;

        private _protectionFactor = _skinProtection + _respiratoryProtection + _eyeProtection;

        private _baseDose = 1; 
        private _effectiveDose = _baseDose * (1 - (_protectionFactor / 300));

        player setVariable ["MiseryRadiation", (player getVariable ["MiseryRadiation", 0]) + _effectiveDose];

        if (MiseryDebug) then {
            systemChat format ["Radiation Protection: Skin %1%2, Respiratory %3%4, Eye %5%6", _skinProtection, "%", _respiratoryProtection, "%", _eyeProtection, "%"]; 
            systemChat format ["Effective Radiation Dose: %1", _effectiveDose];
        };

        if(MiseryDebug)then{systemChat "Misery Radiation cycle..."};

}, 0.25, []] call CBA_fnc_addPerFrameHandler; // Adjusted interval to 0.25 seconds
}, []] call CBA_fnc_waitUntilAndExecute;


