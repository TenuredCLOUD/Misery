
    if (alive player) then {

    private _Ghilliecraft = format ["<img shadow='0.1' size='1.3' image='%1'/>", "Misery\Scripts\Survival\Use\icons\ghillieicon.paa"] + "x4 camo netting, x2 Rope, x1 Needle and thread";

    private _LargeIED = format ["<img shadow='0.1' size='1.3' image='%1'/>", "Misery\Scripts\Survival\Use\icons\ied.paa"] + "x4 copper wire, x1 9V battery, x1 Lithium battery, x1 Automotive battery, x1 Empty plastic bottle, x1 broken phone, x1 pliers, x1 duct tape";

    private _SmallIED = format ["<img shadow='0.1' size='1.3' image='%1'/>", "Misery\Scripts\Survival\Use\icons\ied.paa"] + "x2 copper wire, x1 9V battery, x1 Lithium battery, x1 Empty plastic bottle, x1 broken phone, x1 pliers, x1 duct tape";

    private _Toolkit = format ["<img shadow='0.1' size='1.3' image='%1'/>", "Misery\Scripts\Survival\Use\icons\toolkit.paa"] + "x1 Ball peen hammer, x1 wrench, x1 pliers, x1 phillips screwdriver, x1 flathead screwdriver, x1 duct tape";

    private _Camovest = format ["<img shadow='0.1' size='1.3' image='%1'/>", "Misery\Scripts\Survival\Use\icons\vest.paa"] + "x2 camo netting, x1 Rope, x1 Needle and thread";

    private _CBRNDIS = format ["<img shadow='0.1' size='1.3' image='%1'/>", "Misery\Scripts\Survival\Use\icons\cbrndisassemble.paa"] + "DIS-ASSEMBLE: ANY CBRN suit, Toolkit | RE-ASSEMBLE: CBRN parts, and a Toolkit.";

    hintSilent parseText format ["
    <t size='1.15' color='#1e6ffe' align='center'> Workbench Crafting Blueprints: </t><br/><br/>
    <t>GHILLIE: %1</t><br/>
    <br/>
    <t>LARGEIED: %2</t><br/>
    <br/>
    <t>SMALLIED: %3</t><br/>
    <br/>
    <t>TOOLKIT: %4</t><br/>
    <br/>
    <t>CAMOVEST: %5</t><br/>
    <br/>
    <t>CBRN: %6</t><br/>
    <br/>
    <t>Make sure to have enough inventory space BEFORE crafting, especially some larger items.</t><br/>
    ",
    _Ghilliecraft,
    _LargeIED,
    _SmallIED,
    _Toolkit,
    _Camovest,
    _CBRNDIS
    ];
    sleep 30;
    hintSilent ""; //<< removed HUD after 30 seconds
  };