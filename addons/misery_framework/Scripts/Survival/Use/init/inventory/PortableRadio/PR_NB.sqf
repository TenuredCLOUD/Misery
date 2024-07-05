/* -----------------------------------
Misery Portable radio batteries
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if !("Misery_9vbat" in items player) then {

   titleText ["It's completely dead...", "PLAIN DOWN"];

}else{

titleText ["You add a battery to your portable radio...", "PLAIN DOWN"];

player removeitem "Misery_PortableradioNobattery";
player removeitem "Misery_9vbat";

if (alive player) then {

    player additem "Misery_PortableradioOFF";
    };
  };
