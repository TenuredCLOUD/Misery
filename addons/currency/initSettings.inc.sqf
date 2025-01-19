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
    QGVAR(corpseHasMoneyChance),
    "SLIDER",
    ["AI Money Chance", "Chance that an AI will have money."],
    _category,
    [0.1, 1, 0.5, 0, true],
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
