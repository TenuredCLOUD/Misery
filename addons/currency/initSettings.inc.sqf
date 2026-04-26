private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(symbol),
    "EDITBOX",
    [LSTRING(Symbol), LSTRING(SymbolDesc)],
    _category,
    "$",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bankName),
    "EDITBOX",
    [LSTRING(BankName), LSTRING(BankNameDesc)],
    _category,
    "New World Bank",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bankTax),
    "LIST",
    [LSTRING(TaxesMode), LSTRING(TaxesModeDesc)],
    _category,
    [
        ["none", "stable", "recession", "hyperinflation", "collapse"],
        [
            localize LSTRING(DescNone),
            localize LSTRING(DescStable),
            localize LSTRING(DescRecession),
            localize LSTRING(DescHyperinflation),
            localize LSTRING(DescCollapse)
        ],
        0
    ],
    1,
    {
        params ["_value"];
        switch (_value) do {
            case "none": {
                GVAR(bankTax) = false;
                GVAR(bankDepositTax) = 0;
                GVAR(bankWithdrawTax) = 0;
            };
            case "stable": {
                GVAR(bankTax) = true;
                GVAR(bankDepositTax) = 0.5;
                GVAR(bankWithdrawTax) = 0.3;
            };
            case "recession": {
                GVAR(bankTax) = true;
                GVAR(bankDepositTax) = 2;
                GVAR(bankWithdrawTax) = 1.5;
            };
            case "hyperinflation": {
                GVAR(bankTax) = true;
                GVAR(bankDepositTax) = 20;
                GVAR(bankWithdrawTax) = 35;
            };
            case "collapse": {
                GVAR(bankTax) = true;
                GVAR(bankDepositTax) = 50;
                GVAR(bankWithdrawTax) = 75;
            };
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(corpseHasMoneyChance),
    "SLIDER",
    [LSTRING(AIMoneyChance), LSTRING(AIMoneyChanceDesc)],
    _category,
    [1, 100, 25, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(minAiMoney),
    "SLIDER",
    [LSTRING(MinAIMoney), LSTRING(MinAIMoneyDesc)],
    _category,
    [1, 5000, 1, -1, false],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxAiMoney),
    "SLIDER",
    [LSTRING(MaxAIMoney), LSTRING(MaxAIMoneyDesc)],
    _category,
    [1, 10000, 100, -1, false],
    1
] call CBA_fnc_addSetting;
