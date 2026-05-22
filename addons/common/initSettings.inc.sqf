private _category = format ["Misery %1", localize LSTRING(Component)];
[
    QGVAR(debugMode),
    "LIST",
    [LSTRING(DebugMode), LSTRING(DebugModeDesc)],
    _category,
    [
        [0, 1, 2],
        [LSTRING(Disabled), LSTRING(SystemChats), LSTRING(SystemChatsRpt)],
        0
    ],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(combatLogPreventionEnabled),
    "CHECKBOX",
    [LSTRING(CombatLog), LSTRING(CombatLogDesc)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(promptSizes),
    "SLIDER",
    [LSTRING(PromptSize), LSTRING(PromptSizeDesc)],
    _category,
    [0.5, 1, 0.7, 2],
    2
] call CBA_fnc_addSetting;
