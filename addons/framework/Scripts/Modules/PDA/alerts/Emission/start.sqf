/*
Misery Emission starting alert
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

_Check_items = items player;
if ("Misery_PDA" in _Check_items) then {

  playSound3D ["STALKERsounds\sounds\pda\pda_objective.ogg", player, false, getPosASL player, 4, 1, 10];

      private _PDA = "PRIORITY BROADCAST: ATTENTION SURVIVORS! EMMISSION STORM IMMINANT! SEEK SHELTER IMMEDIATELY! [Cognito Hazard class V]: NO PROTECTION AVAILABLE, SEEK SHELTER";

      private _image = format ["<img shadow='0.1' align='center' size='1.5' image='%1'/>", "\\z\misery\addons\framework\scripts\survival\data\psybrain.paa"];

      private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\assets\data\PDA.paa"];

      hintSilent parseText format ["
      <t size='1.15' align='center'> [PDA] %3</t><br/><br/>
      <t>%1</t><br/>
      <br/>
      %2
      ",
      _PDA,
      _image,
      _PDAimage
      ];
      sleep 10;
      hintSilent "";


  playSound3D ["STALKERsounds\sounds\pda\pda_communication_lost.ogg", player, false, getPosASL player, 4, 1, 10];

      private _PDA = "GOING OFFLINE...";

      private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\assets\data\PDA.paa"];

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