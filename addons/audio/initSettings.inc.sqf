// Enhanced Character Effects
[
    QGVAR(enhancedCharacterEffects),
    "CHECKBOX",
    [
        "Character Enhanced effects",
        "Enable Extra Character Immersion? (Enables Player coughing, sneezing when sick or cold, and stomach growling if you are starting to get hungry.)"
    ],
    "Misery - Audio",
    false, 1,
    {
        params ["_value"];
        if (hasInterface) then {
            call EFUNC(survival,hungerImmersion);
            call EFUNC(temperature,coldImmersion);
            call EFUNC(temperature,feverImmersion);
        };
    }
] call CBA_fnc_addSetting;

// Enhanced Inventory Sounds
[
    QGVAR(enhancedInventorySounds),
    "CHECKBOX",
    [
        "Enhanced Inventory sounds",
        "Enable Inventory audio overhaul?"
    ],
    "Misery - Audio",
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Ambient Sound Scape
[
    QGVAR(ambientSoundScape),
    "CHECKBOX",
    [
        "Ambient audio soundscape overhaul", "Enable Extra world audio with input sounds? (must utilize the 'Ambient soundscape array' data)"
    ],
    "Misery - Audio",
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Forge Ambience
[
    QGVAR(forgeAmbience),
    "CHECKBOX",
    [
        "Ambient audio for Forges", "Enable Audio loop for forges? (Makes them crackle & hum - immersion)"
    ],
    "Misery - Audio",
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Additional ambient soundscape sounds
[
    QGVAR(ambientSoundScapeExtras),
    "EDITBOX",
    [
        "Ambient soundscape array", "Listed sounds to play randomly around players (Format: Mysound_1,Mysound_2,etc...)"
    ],
    "Misery - Audio",
    "", 1,
    {
        params ["_value"];
        GVAR(ambientSoundScapeExtras) = _value splitString ",";
    }
] call CBA_fnc_addSetting;

[
    QGVAR(ambientMusicExtras),
    "EDITBOX",
    [
        "Ambient Music array", "Listed music to play randomly for players (Format: Mymusic_1,Mymusic_2,etc...)"
    ],
    "Misery - Audio",
    "", 1,
    {
        params ["_value"];
        GVAR(ambientMusicExtras) = _value splitString ",";
    }
] call CBA_fnc_addSetting;
