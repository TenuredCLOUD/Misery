 /* -----------------------------------
Misery Emission ended alert
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

_Check_items = items player;
if ("Misery_PDA" in _Check_items) then {

  playSound3D ["STALKERsounds\sounds\pda\pda_welcome.ogg", player, false, getPosASL player, 4, 1, 10];

      private _PDA = "BACK ONLINE";

      private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\PDA.paa"];

      hintSilent parseText format ["
      <t size='1.15' align='center'> [PDA] %2</t><br/><br/>
      <t>%1</t><br/>
      ",
      _PDA,
      _PDAimage
      ];
      sleep 10;
      hintSilent "";


  playSound3D ["STALKERsounds\sounds\pda\pda_objective.ogg", player, false, getPosASL player, 4, 1, 10];

      private _PDA = "AN EMISSION STORM HAS RECENTLY OCCURED IN THE ZONE";

      private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\PDA.paa"];

      hintSilent parseText format ["
      <t size='1.15' align='center'> [PDA] %2</t><br/><br/>
      <t>%1</t><br/>
      ",
      _PDA,
      _PDAimage
      ];
      sleep 10;
      hintSilent ""; 
};