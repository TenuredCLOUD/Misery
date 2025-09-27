private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

// Enhanced Character Effects
[
    QGVAR(enhancedCharacterEffects),
    "CHECKBOX",
    [
        "Character Enhanced effects",
        "Enable Extra Character Immersion? (Enables Player coughing, sneezing when sick or cold, and stomach growling if you are starting to get hungry.)"
    ],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Enhanced Inventory Sounds
[
    QGVAR(enhancedInventorySounds),
    "CHECKBOX",
    [
        "Enhanced Inventory sounds",
        "Enable Inventory audio overhaul?"
    ],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Ambient Sound Scape
[
    QGVAR(ambientSoundScape),
    "CHECKBOX",
    [
        "Ambient audio soundscape overhaul", "Enable Extra world audio with input sounds? (must utilize the 'Ambient soundscape array' data)"
    ],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Forge Ambience
[
    QGVAR(forgeAmbience),
    "CHECKBOX",
    [
        "Ambient audio for Forges", "Enable Audio loop for forges? (Makes them crackle & hum - immersion)"
    ],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Additional ambient soundscape sounds
[
    QGVAR(ambientSoundScapeExtras),
    "EDITBOX",
    [
        "Ambient soundscape array", "Listed sounds to play randomly around players (Format: Mysound_1,Mysound_2,etc...)"
    ],
    _category,
    "[]", 1,
    {
        params ["_value"];
        GVAR(ambientSoundScapeExtras) = parseSimpleArray _value;
    }
] call CBA_fnc_addSetting;

// Ambient Music
[
    QGVAR(ambientMusicEnabled),
    "CHECKBOX",
    [
        "Ambient music", "Enable Misery's OST (utilize Ambient Music array for more music to be played)"
    ],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

[
    QGVAR(ambientMusicExtras),
    "EDITBOX",
    [
        "Ambient Music array", "Listed music to play randomly for players (Format: Mymusic_1,Mymusic_2,etc...)"
    ],
    _category,
    "[]", 1,
    {
        params ["_value"];
        GVAR(ambientMusicExtras) = parseSimpleArray _value;
    }
] call CBA_fnc_addSetting;
