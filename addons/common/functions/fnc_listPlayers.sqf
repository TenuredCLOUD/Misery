/*
Active players lister for zone checks, etc..
Utilizes CBA for player checks, removes the need to also check if they are headless
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_players"];
_players= call CBA_fnc_players;

{
	if !(alive _x) then {
		_players=_players-[_x]
	};
	
}forEach _players;

_players