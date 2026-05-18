private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enabled", LSTRING(EnablePsychosisDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(textEnabled),
    "CHECKBOX",
    [LSTRING(TextNotifiers), LSTRING(TextNotifiersDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleTimer),
    "LIST",
    [LSTRING(PsychosisTimer), LSTRING(PsychosisTimerDesc)],
    _category,
    [[15, 30, 60], [ECSTRING(common,Interval15Sec), ECSTRING(common,Interval30Sec), ECSTRING(common,Interval60Sec)], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(night),
    "CHECKBOX",
    [LSTRING(PsychosisAtNight), LSTRING(PsychosisAtNightDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(decrease),
    "SLIDER",
    [LSTRING(PsychosisDecrease), LSTRING(PsychosisDecreaseDesc)],
    _category,
    [0.0001, 1, 0.005, 4],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nightIncrease),
    "SLIDER",
    [LSTRING(PsychosisNightInc), LSTRING(PsychosisNightIncDesc)],
    _category,
    [0.0001, 1, 0.0005, 4],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unnaturalIncrease),
    "SLIDER",
    [LSTRING(UnnaturalEntities), LSTRING(UnnaturalEntitiesDesc)],
    _category,
    [0.0001, 1, 0.0025, 4],
    1
] call CBA_fnc_addSetting;
