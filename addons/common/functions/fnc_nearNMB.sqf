private ["_found"];

_found=FALSE;

_Check_items = items player;
if (vehicle player == player) then {

    if (count (nearestObjects [player,
                [
"NMIB_Generic_Garage_B",
"NMIB_Generic_Garage_D",
"NMIB_Generic_Garage_A",
"NMIB_Generic_Garage_C",
"NMIB_Lockable_Garage_D",
"NMIB_Lockable_Garage_B",
"NMIB_Lockable_Garage_A",
"NMIB_Lockable_Garage_C",
"NMIB_Plot",
"NMIB_Generic_Door_D",
"NMIB_Generic_Door_A",
"NMIB_Generic_Door_B",
"NMIB_Generic_Door_C",
"NMIB_Lockable_Door_C",
"NMIB_Lockable_Door_A",
"NMIB_Lockable_Door_D",
"NMIB_Lockable_Door_B",
"NMIB_Generic_Floor_A",
"NMIB_Generic_Foundation",
"NMIB_Generic_Ladder",
"NMIB_Generic_Ramp_A",
"NMIB_Generic_Roof_E",
"NMIB_Barricaded_Window_C",
"NMIB_Barricaded_Window_B",
"NMIB_Barricaded_Window_D",
"NMIB_Barricaded_Window_A",
"NMIB_Generic_Doorway_D",
"NMIB_Generic_Doorway_C",
"NMIB_Generic_Doorway_A",
"NMIB_Generic_Doorway_B",
"NMIB_Generic_Wall0_A",
"NMIB_Generic_Wall0_B",
"NMIB_Generic_Wall0_C",
"NMIB_Generic_Wall0_D",
"NMIB_Generic_Wall1_A",
"NMIB_Generic_Wall1_D",
"NMIB_Generic_Wall1_B",
"NMIB_Generic_Wall1_C",
"NMIB_Generic_Wall2_C",
"NMIB_Generic_Wall2_D",
"NMIB_Generic_Wall2_B",
"NMIB_Generic_Wall2_A",
"NMIB_Generic_Wall3_A",
"NMIB_Generic_Wall3_B",
"NMIB_Generic_Wall3_C",
"NMIB_Generic_Wall3_D",
"NMIB_Generic_Window_A",
"NMIB_Generic_Window_B",
"NMIB_Generic_Window_C",
"NMIB_Generic_Window_D",
"NMIB_Plot_Workbench"], 5, true, true]) > 0) then {
        _found = TRUE;};

        if (_found)exitwith{};

        };
        _found
