
private ["_found"];

_found=FALSE;

_Check_items = items player;
if (vehicle player == player) then {

    if (count (nearestObjects [player,
                ["Land_Workbench_01_F",
                    "Land_PortableDesk_01_olive_F",
                        "NMIB_Plot_Workbench"], 1.5, true, true]) > 0) then {
        _found = TRUE;
        };

        if (_found)exitwith{};

        };
        _found //return val (BOOL)
