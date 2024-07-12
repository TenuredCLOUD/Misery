#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

/*
Misery RF detector reboot code
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (alive player) exitwith {

player removeitem "Misery_RFHighrangeOFF";

playSound3D ["Misery\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 4, 1, 10];

    if (alive player) then {

    private _RF = "Initial bootup...";

    private _RFimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\EMFdetectorhighrange.paa"];

    hintSilent parseText format ["
    <t size='1.15' align='center'> [RF Detector] %2</t><br/><br/>
    <t>%1</t><br/>
    ",
    _RF,
    _RFimage
    ];
    sleep 5;
    hintSilent ""; //<< removed HUD after 5 seconds
  };



playSound3D ["Misery\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 4, 1, 10];
sleep 0.5;
playSound3D ["Misery\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 4, 1, 10];

    if (alive player) then {

    private _RF = "Retrieving Radio frequencies...";
    private _RF2 = "Calibrating Electro-magnetic field sensors...";

    private _RFimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\EMFdetectorhighrange.paa"];

    hintSilent parseText format ["
    <t size='1.15' align='center'> [RF Detector] %2</t><br/><br/>
    <t>%1</t><br/>
    ",
    _RF,
    _RFimage,
    _RF2
    ];
    sleep 5;
    hintSilent ""; //<< removed HUD after 5 seconds
  };



playSound3D ["Misery\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 4, 1, 10];
sleep 0.5;
playSound3D ["Misery\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 4, 1, 10];
sleep 0.5;
playSound3D ["Misery\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 4, 1, 10];


    if (alive player) then {

    private _RF = "Power on cycle completed...";
    private _RF2 = "All sensors calibrated successfully...";
    private _RF3 = "Detector is ready for use";

    private _RFimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\Misery_items\data\EMFdetectorhighrange.paa"];

    hintSilent parseText format ["
    <t size='1.15' align='center'> [RF Detector] %2</t><br/><br/>
    <t>%1</t><br/>
    <t>%3</t><br/>
    <t>%4</t><br/>
    ",
    _RF,
    _RFimage,
    _RF2,
    _RF3
    ];
    player additem "Misery_RFHighrangeON"; //End of boot cycle: adds RF detector 
    sleep 5;
    hintSilent ""; //<< removed HUD after 5 seconds
    };
  };

  