/*
Misery PDA reboot sequence
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (alive player) exitwith {

player removeitem "Misery_PDA_off";

playSound3D ["STALKERsounds\sounds\pda\pda_news.ogg", player, false, getPosASL player, 4, 1, 10];

    if (alive player) then {

    private _PDA = "Initial bootup...";

    private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\PDA.paa"];

    hintSilent parseText format ["
    <t size='1.15' align='center'> [PDA] %2</t><br/><br/>
    <t>%1</t><br/>
    ",
    _PDA,
    _PDAimage
    ];
    sleep 5;
    hintSilent ""; //<< removed HUD after 5 seconds
  };



playSound3D ["STALKERsounds\sounds\pda\pda_alarm.ogg", player, false, getPosASL player, 4, 1, 10];

    if (alive player) then {

    private _PDA = "Retrieving data...";

    private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\PDA.paa"];

    hintSilent parseText format ["
    <t size='1.15' align='center'> [PDA] %2</t><br/><br/>
    <t>%1</t><br/>
    ",
    _PDA,
    _PDAimage
    ];
    sleep 5;
    hintSilent ""; //<< removed HUD after 5 seconds
  };



playSound3D ["STALKERsounds\sounds\pda\pda_welcome.ogg", player, false, getPosASL player, 4, 1, 10];


    if (alive player) then {

    private _PDA = "Welcome to the Zone";

    private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\PDA.paa"];

    hintSilent parseText format ["
    <t size='1.15' align='center'> [PDA] %3</t><br/><br/>
    <t>%2, %1</t><br/>
    ",
    _PDA,
    profilename,
    _PDAimage
    ];
    player additem "Misery_PDA"; //End of boot cycle: adds PDA / Adds HUD 
    sleep 5;
    hintSilent ""; //<< removed HUD after 5 seconds
    };
  };