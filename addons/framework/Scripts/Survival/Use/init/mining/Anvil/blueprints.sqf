
    if (alive player) then {

    private _Pickaxecraft = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\anvil.paa"] + "x2 Iron ingots, x1 Woodnails, x1 Woodplanks, Hammer";

    private _Repairpickaxe = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\anvil.paa"] + "x1 Iron ingot, x1 Woodnails, Hammer, Broken pickaxe";

    private _Scrapmetal = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\anvil.paa"] + "x1 Iron ingot, Hammer";

    private _Castironpot = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\anvil.paa"] + "x2 Iron ingots, Hammer";

    private _Woodnails = format ["<img shadow='0.1' size='1.3' image='%1'/>", "\z\misery\addons\framework\scripts\survival\Use\icons\anvil.paa"] + "x1 Iron ingot, Hammer";

    hintSilent parseText format ["
    <t size='1.15' color='#1e6ffe' align='center'> Anvil Crafting Blueprints: </t><br/><br/>
    <t>Pickaxe: %1</t><br/>
    <br/>
    <t>Repairpickaxe: %2</t><br/>
    <br/>
    <t>Scrapmetal: %3</t><br/>
    <br/>
    <t>Castironpot: %4</t><br/>
    <br/>
    <t>Woodnails: %5</t><br/>
    <br/>
    <t>Make sure to have enough inventory space BEFORE crafting, especially some larger items.</t><br/>
    ",
    _Pickaxecraft,
    _Repairpickaxe,
    _Scrapmetal,
    _Castironpot,
    _Woodnails
    ];
    sleep 30;
    hintSilent ""; //<< removed HUD after 30 seconds
  };
