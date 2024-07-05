 /* -----------------------------------
Misery RF detector batteries
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if !("Misery_lithiumbattery" in items player) then {

  playSound3D ["STALKERsounds\sounds\pda\pda_dead.ogg", player, false, getPosASL player, 4, 1, 5];

   titleText ["It's completely dead...", "PLAIN DOWN"];

}else{

titleText ["You add a battery to your RF detector...", "PLAIN DOWN"];

player removeitem "Misery_RFHighNobattery";
player removeitem "Misery_lithiumbattery";

if (alive player) then {

    player additem "Misery_RFHighrangeOFF";
    };
  };
