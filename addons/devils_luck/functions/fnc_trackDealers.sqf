#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Dealers Tracking
 * Simulates AI gambling by adjusting dealers funds
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_trackDealers;
 *
*/

if (!isServer) exitWith {};

[{count GVAR(activeDealers) > 0}, {
    [{
        params ["_args", "_handle"];
        private _players = call EFUNC(common,listPlayers);
        _players = _players - (entities "HeadlessClient_F");

        {
            private _player = _x;
            {
                private _dealer = _x;
                if (isNull _dealer) then {
                    [QUOTE(COMPONENT_BEAUTIFIED), "Null dealer found in activeDealers"] call EFUNC(common,debugMessage);
                    continue;
                };

                if (_player distance _dealer > 1000) then {
                    private _funds = _dealer getVariable [QGVAR(dealerFunds), 50000];

                    if ([50] call EFUNC(common,rollChance)) then {
                        private _simulatedBet = (floor(random 500)) + 10;

                        // Simulated AI winning / losing bets
                        if ([40] call EFUNC(common,rollChance)) then {
                            _dealer setVariable [QGVAR(dealerFunds), (_funds - _simulatedBet) max 0, true];
                        } else {
                            _dealer setVariable [QGVAR(dealerFunds), _funds + _simulatedBet, true];
                        };
                    };
                };
            } forEach GVAR(activeDealers);
        } forEach _players;
    }, 1800, []] call CBA_fnc_addPerFrameHandler;
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Started trackDealers PFH with %1 dealers, cycle: 30mins", count GVAR(activeDealers)]] call EFUNC(common,debugMessage);
}, []] call CBA_fnc_waitUntilAndExecute;
