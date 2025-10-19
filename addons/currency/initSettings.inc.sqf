private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(symbol),
    "EDITBOX",
    ["Money Symbol", "Symbol to use for currency"],
    _category,
    "$",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bankName),
    "EDITBOX",
    ["Bank name", "Name of the centralized bank network"],
    _category,
    "New World Bank",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bankTax),
    "LIST",
    ["Bank Taxes Mode", "Sets the difficulty of bank transaction taxes, reflecting economic conditions"],
    _category,
    [
        ["none", "stable", "recession", "hyperinflation", "collapse"],
        [
            "Transactions are free (0% tax)",
            "Minimal taxes for deposits and withdrawals",
            "Moderate taxes, deposits slightly costlier",
            "High taxes, withdrawals heavily penalized",
            "Crippling taxes, banking is a last resort"
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
    ["AI Money Chance", "Chance that an AI will have money."],
    _category,
    [1, 100, 25, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(minAiMoney),
    "SLIDER",
    ["Minimum AI Money", "The minimum AI can potentially have for cash. (Capped at 5,000)"],
    _category,
    [1, 5000, 1, -1, false],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxAiMoney),
    "SLIDER",
    ["Maximum AI Money", "The maximum AI can potentially have for cash. (Capped at 10,000)"],
    _category,
    [1, 10000, 100, -1, false],
    1
] call CBA_fnc_addSetting;
