
    if (alive player) then {

    private _ironore = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\ingot.paa"] + "x2 Coal ore, x2 Iron ore";

    private _ironpieces = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\ingot.paa"] + "x4 Iron ore pieces, x2 Coal ore";

    private _goldore = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\ingot.paa"] + "x2 Coal ore, x2 Gold ore";

    private _goldorepieces = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\ingot.paa"] + "x4 Gold ore pieces, x2 Coal ore";

    hintSilent parseText format ["
    <t size='1.15' color='#1e6ffe' align='center'> Forge Blueprints: </t><br/><br/>
    <t>Iron ore: %1</t><br/>
    <br/>
    <t>Iron ore pieces: %2</t><br/>
    <br/>
    <t>Gold ore: %3</t><br/>
    <br/>
    <t>Gold ore pieces: %4</t><br/>
    <br/>
    <t>Make sure to have enough inventory space BEFORE crafting, especially some larger items.</t><br/>
    ",
    _ironore,
    _ironpieces,
    _goldore,
    _goldorepieces
    ];
    sleep 30;
    hintSilent ""; //<< removed HUD after 30 seconds
  };
