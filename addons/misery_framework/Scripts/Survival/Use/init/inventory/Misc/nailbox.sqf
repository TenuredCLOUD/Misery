/*
Misery woodnail box
Has compat for iBuild if it's in use
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (MiseryUsingiBuild) exitwith {

titleText ["You take the nails out of the box...", "PLAIN DOWN"];
player removeitem "Misery_boxnails"; //<<-- remove early to prevent dooping
sleep 1;
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
player additem "NMIB_WoodNails_Itm";
};

if !(MiseryUsingiBuild) exitwith {

titleText ["You take the nails out of the box...", "PLAIN DOWN"];
player removeitem "Misery_boxnails"; //<<-- remove early to prevent dooping
sleep 1;
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
player additem "Misery_woodnail";
};