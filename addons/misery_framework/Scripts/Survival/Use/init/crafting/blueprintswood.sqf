
    if (alive player) then {

    private _Woodplankcraft = format ["<img shadow='0.1' size='1.3' image='%1'/>", "Misery\Scripts\Survival\Use\icons\sawmill.paa"] + "Electric hand saw with battery, x1 wooden log";

    hintSilent parseText format ["
    <t size='1.15' color='#1e6ffe' align='center'> Woodenplanks Blueprints: </t><br/><br/>
    <t>Woodplanks: %1</t><br/>
    ",
    _Woodplankcraft
    ];
    sleep 30;
    hintSilent ""; //<< removed HUD after 30 seconds
  };
