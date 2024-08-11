
private ["_found"];

_found=FALSE;

_Check_items = items player;
if (vehicle player == player) then {

    if (count (nearestObjects [player,
                ["Misery_Anvil"], 1.5, true, true]) > 0) then {
        _found = TRUE;};

        if (_found)exitwith{};

        };
        _found //return val (Bool)
