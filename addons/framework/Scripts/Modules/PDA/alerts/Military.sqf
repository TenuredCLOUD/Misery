/*
Misery Mil alert startup
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

_Check_items = items player;
if ("Misery_ERU" in _Check_items) then {

  playSound3D ["STALKERsounds\sounds\pda\pda_alarm.ogg", player, false, getPosASL player, 4, 1, 10];

  //HUD / hint display start:

      private _PDA = "Approaching Military Control Zone: Expect lethal force...";

      private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\assets\data\PDA.paa"];

      hintSilent parseText format ["
      <t size='1.15' align='center'> [PDA] %2</t><br/><br/>
      <t>%1</t><br/>
      <br/>
      %2
      ",
      _PDA,
      _PDAimage
      ];
      sleep 10;
      hintSilent ""; //<< removed HUD after 5 seconds

};