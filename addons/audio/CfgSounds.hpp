// Classnames are: misery_audio_sound_X
// Macro is: filename,directory
#define MACRO_SOUNDS(var,dir) \
    class GVAR(sound_##var) { \
        name = QUOTE(var); \
        sound[] = {QPATHTOF(sounds\dir\var.ogg), 1, 1}; \
        titles[] = {}; \
    }


class CfgSounds {
    sounds[] = {};

    class CLASS(heart_5)
    {
        name = QUOTE(heart_5);
        sound[] = {"a3\sounds_f\characters\human-sfx\other\heart_4_1.wss", 0.7, 1};
    };

    class CLASS(heart_6)
    {
        name = QUOTE(heart_6);
        sound[] = {"a3\sounds_f\characters\human-sfx\other\heart_4_2.wss", 0.7, 1};
    };

    class CLASS(heart_7)
    {
        name = QUOTE(heart_7);
        sound[] = {"a3\sounds_f\characters\human-sfx\other\heart_4_3.wss", 0.7, 1};
    };

    class CLASS(heart_8)
    {
        name = QUOTE(heart_8);
        sound[] = {"a3\sounds_f\characters\human-sfx\other\heart_4_4.wss", 0.7, 1};
    };

    class CLASS(heart_9)
    {
        name = QUOTE(heart_9);
        sound[] = {"a3\sounds_f\characters\human-sfx\other\heart_4_5.wss", 0.7, 1};
    };

    class CLASS(breath_high_01)
    {
        name = QUOTE(breath_high_01);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_01.wss", 0.7, 1};
    };

    class CLASS(breath_high_02)
    {
        name = QUOTE(breath_high_02);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_02.wss", 0.7, 1};
    };

    class CLASS(breath_high_03)
    {
        name = QUOTE(breath_high_03);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_03.wss", 0.7, 1};
    };

    class CLASS(breath_high_04)
    {
        name = QUOTE(breath_high_04);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_04.wss", 0.7, 1};
    };

    class CLASS(breath_high_05)
    {
        name = QUOTE(breath_high_05);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_05.wss", 0.7, 1};
    };

    class CLASS(breath_high_06)
    {
        name = QUOTE(breath_high_06);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_06.wss", 0.7, 1};
    };

    class CLASS(breath_high_07)
    {
        name = QUOTE(breath_high_07);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_07.wss", 0.7, 1};
    };

    class CLASS(breath_high_08)
    {
        name = QUOTE(breath_high_08);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_08.wss", 0.7, 1};
    };

    class CLASS(breath_high_09)
    {
        name = QUOTE(breath_high_09);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_09.wss", 0.7, 1};
    };

    class CLASS(breath_high_10)
    {
        name = QUOTE(breath_high_10);
        sound[] = {"a3\sounds_f\characters\human-sfx\person3\p3_breath_high_10.wss", 0.7, 1};
    };

    // Ambience Sounds - Day
    MACRO_SOUNDS(ambienceDay,ambience);
    MACRO_SOUNDS(dayAmbience1,ambience);
    MACRO_SOUNDS(dayAmbience2,ambience);
    MACRO_SOUNDS(dayAmbience3,ambience);
    MACRO_SOUNDS(dayAmbience4,ambience);
    MACRO_SOUNDS(dayAmbience5,ambience);
    MACRO_SOUNDS(whisperDay,ambience);
    MACRO_SOUNDS(ambienceNight,ambience);
    MACRO_SOUNDS(nightAmbience1,ambience);
    MACRO_SOUNDS(nightAmbience2,ambience);
    MACRO_SOUNDS(nightAmbience3,ambience);
    MACRO_SOUNDS(nightAmbience4,ambience);
    MACRO_SOUNDS(nightAmbience5,ambience);
    MACRO_SOUNDS(whisperNight,ambience);
    MACRO_SOUNDS(wanderingSoul,ambience);

    // Blow Out Warning
    MACRO_SOUNDS(blowOutWarning,blowoutwarning);

    // Cave Ambience
    MACRO_SOUNDS(cave,cave);
    MACRO_SOUNDS(cave01,cave);
    MACRO_SOUNDS(cave02,cave);
    MACRO_SOUNDS(cave03,cave);
    MACRO_SOUNDS(cave04,cave);
    MACRO_SOUNDS(cave05,cave);
    MACRO_SOUNDS(cave06,cave);
    MACRO_SOUNDS(cave07,cave);
    MACRO_SOUNDS(cave08,cave);

    // EAS
    MACRO_SOUNDS(easPhantoms,eas);

    // ERU
    MACRO_SOUNDS(chirpBeep,eru);
    MACRO_SOUNDS(powerDownBeep,eru);
    MACRO_SOUNDS(powerUpBeep,eru);

    // Fire
    MACRO_SOUNDS(fireBig,fire);

    // Forest
    MACRO_SOUNDS(behindYou,forest);
    MACRO_SOUNDS(carefulNow,forest);
    MACRO_SOUNDS(creeping,forest);
    MACRO_SOUNDS(doNotBelong,forest);
    MACRO_SOUNDS(hello,forest);
    MACRO_SOUNDS(helpMe,forest);
    MACRO_SOUNDS(iCanSeeYou,forest);
    MACRO_SOUNDS(illKillYou,forest);
    MACRO_SOUNDS(iWillKillYou,forest);
    MACRO_SOUNDS(run,forest);
    MACRO_SOUNDS(running,forest);
    MACRO_SOUNDS(runningHello,forest);
    MACRO_SOUNDS(runNow,forest);
    MACRO_SOUNDS(runNow2,forest);
    MACRO_SOUNDS(walking,forest);

    // Geiger
    MACRO_SOUNDS(geigerOff,geiger);
    MACRO_SOUNDS(geigerOn,geiger);
    MACRO_SOUNDS(geiger01,geiger);
    MACRO_SOUNDS(geiger02,geiger);
    MACRO_SOUNDS(geiger03,geiger);
    MACRO_SOUNDS(geiger04,geiger);
    MACRO_SOUNDS(geiger05,geiger);
    MACRO_SOUNDS(geiger06,geiger);
    MACRO_SOUNDS(geiger07,geiger);
    MACRO_SOUNDS(geiger08,geiger);
    MACRO_SOUNDS(geiger09,geiger);
    MACRO_SOUNDS(geiger10,geiger);

    // Generator
    MACRO_SOUNDS(dieselRunning,generator);
    MACRO_SOUNDS(dieselStart,generator);
    MACRO_SOUNDS(dieselStop,generator);
    MACRO_SOUNDS(kvaRunning,generator);
    MACRO_SOUNDS(kvaStart,generator);
    MACRO_SOUNDS(kvaStop,generator);
    MACRO_SOUNDS(petrolRunning,generator);
    MACRO_SOUNDS(petrolStart,generator);
    MACRO_SOUNDS(petrolStop,generator);

    // Green Mountain
    MACRO_SOUNDS(gmBeep,greenmountain);
    MACRO_SOUNDS(gmChatter,greenmountain);
    MACRO_SOUNDS(gmStatic,greenmountain);

    // Immersion
    MACRO_SOUNDS(artifactSound,immersion);
    MACRO_SOUNDS(beer,immersion);
    MACRO_SOUNDS(cauterizing,immersion);
    MACRO_SOUNDS(dryGrass,immersion);
    MACRO_SOUNDS(gasmaskBreathing,immersion);
    MACRO_SOUNDS(gasPump,immersion);
    MACRO_SOUNDS(gasPump30,immersion);
    MACRO_SOUNDS(gasPumpRunning,immersion);
    MACRO_SOUNDS(gasPumpStart,immersion);
    MACRO_SOUNDS(gasPumpStop,immersion);
    MACRO_SOUNDS(gatheringFirewood,immersion);
    MACRO_SOUNDS(i25m,immersion);
    MACRO_SOUNDS(i50m,immersion);
    MACRO_SOUNDS(i150m,immersion);
    MACRO_SOUNDS(i250m,immersion);
    MACRO_SOUNDS(i350m,immersion);
    MACRO_SOUNDS(i500m,immersion);
    MACRO_SOUNDS(iSawmill,immersion);
    MACRO_SOUNDS(lighter,immersion);
    MACRO_SOUNDS(lighterSmoking,immersion);
    MACRO_SOUNDS(match,immersion);
    MACRO_SOUNDS(matchSmoking,immersion);
    MACRO_SOUNDS(meatRoasted,immersion);
    MACRO_SOUNDS(shower,immersion);
    MACRO_SOUNDS(staticBasic,immersion);
    MACRO_SOUNDS(staticWeird01,immersion);
    MACRO_SOUNDS(staticWeird02,immersion);
    MACRO_SOUNDS(staticWeird03,immersion);
    MACRO_SOUNDS(staticWeird04,immersion);
    MACRO_SOUNDS(staticWeird05,immersion);
    MACRO_SOUNDS(staticWeird06,immersion);
    MACRO_SOUNDS(staticWeird07,immersion);
    MACRO_SOUNDS(staticWeird08,immersion);
    MACRO_SOUNDS(staticWeird09,immersion);
    MACRO_SOUNDS(staticWeird10,immersion);
    MACRO_SOUNDS(vodka,immersion);
    MACRO_SOUNDS(waterBoiling,immersion);
    MACRO_SOUNDS(waterBottle,immersion);

    // Inventory
    MACRO_SOUNDS(drop01,inventory);
    MACRO_SOUNDS(drop02,inventory);
    MACRO_SOUNDS(inventoryClose,inventory);
    MACRO_SOUNDS(inventoryOpen,inventory);
    MACRO_SOUNDS(pickup,inventory);
    MACRO_SOUNDS(rummaging,inventory);
    MACRO_SOUNDS(unzipping,inventory);
    MACRO_SOUNDS(zipping,inventory);

    // Items
    MACRO_SOUNDS(caffetinBoxOpen,items);
    MACRO_SOUNDS(canOpener,items);
    MACRO_SOUNDS(canTab,items);
    MACRO_SOUNDS(chainsaw1,items);
    MACRO_SOUNDS(chainsaw2,items);
    MACRO_SOUNDS(chainsaw3,items);
    MACRO_SOUNDS(chainsawSplit,items);
    MACRO_SOUNDS(chopWood,items);
    MACRO_SOUNDS(crinklingPlastic,items);
    MACRO_SOUNDS(drink,items);
    MACRO_SOUNDS(eat,items);
    MACRO_SOUNDS(electricSaw,items);
    MACRO_SOUNDS(hammerSound,items);
    MACRO_SOUNDS(hammerWood,items);
    MACRO_SOUNDS(pillBottleOpen,items);
    MACRO_SOUNDS(sniff,items);
    MACRO_SOUNDS(sodaTab,items);

    // Mining
    MACRO_SOUNDS(anvilHammer,mining);
    MACRO_SOUNDS(coal,mining);
    MACRO_SOUNDS(furnaceFire,mining);
    MACRO_SOUNDS(gold,mining);
    MACRO_SOUNDS(iron,mining);
    MACRO_SOUNDS(metalSmelt,mining);
    MACRO_SOUNDS(pickaxe,mining);
    MACRO_SOUNDS(pickaxe60,mining);
    MACRO_SOUNDS(stone,mining);

    // Monster
    MACRO_SOUNDS(distantGhost,monster);
    MACRO_SOUNDS(distantHellspawn,monster);
    MACRO_SOUNDS(distantScream01,monster);
    MACRO_SOUNDS(distantScream02,monster);
    MACRO_SOUNDS(distantScream03,monster);
    MACRO_SOUNDS(distantScream04,monster);
    MACRO_SOUNDS(moan,monster);
    MACRO_SOUNDS(monsterCall,monster);
    MACRO_SOUNDS(monsterDistant,monster);
    MACRO_SOUNDS(monsterScream,monster);

    // NWAF
    MACRO_SOUNDS(brainScorcher,nwaf);

    // Radio
    MACRO_SOUNDS(eas,radio);
    MACRO_SOUNDS(radio,radio);
    MACRO_SOUNDS(song01,radio);
    MACRO_SOUNDS(song02,radio);
    MACRO_SOUNDS(song03,radio);

    // Rumbles
    MACRO_SOUNDS(rumble,rumbles);

    // Sickness
    MACRO_SOUNDS(coldShiver,sickness);
    MACRO_SOUNDS(cough,sickness);
    MACRO_SOUNDS(coughing,sickness);
    MACRO_SOUNDS(coughMask01,sickness);
    MACRO_SOUNDS(coughMask02,sickness);
    MACRO_SOUNDS(coughMask03,sickness);
    MACRO_SOUNDS(coughMask04,sickness);
    MACRO_SOUNDS(coughMask05,sickness);
    MACRO_SOUNDS(coughMask06,sickness);
    MACRO_SOUNDS(coughMask07,sickness);
    MACRO_SOUNDS(coughMask08,sickness);
    MACRO_SOUNDS(coughMuffled,sickness);
    MACRO_SOUNDS(sneeze,sickness);
    MACRO_SOUNDS(stomachGrowl,sickness);

    // Skin
    MACRO_SOUNDS(boneSaw,skin);
    MACRO_SOUNDS(cut01,skin);
    MACRO_SOUNDS(cut02,skin);
    MACRO_SOUNDS(cut03,skin);
    MACRO_SOUNDS(skinning01,skin);
    MACRO_SOUNDS(skinning02,skin);
    MACRO_SOUNDS(skinning03,skin);

    // Spooky
    MACRO_SOUNDS(spookyAlpha01,spooky);
    MACRO_SOUNDS(spookyAlpha02,spooky);
    MACRO_SOUNDS(spookyAlpha03,spooky);
    MACRO_SOUNDS(spookyBravo01,spooky);
    MACRO_SOUNDS(spookyBravo02,spooky);
    MACRO_SOUNDS(spookyBravo03,spooky);
    MACRO_SOUNDS(spookyBravo04,spooky);
    MACRO_SOUNDS(spookyBravo05,spooky);
    MACRO_SOUNDS(spookyCharlie01,spooky);
    MACRO_SOUNDS(spookyCharlie02,spooky);
    MACRO_SOUNDS(spookyCharlie03,spooky);
    MACRO_SOUNDS(spookyCharlie04,spooky);
    MACRO_SOUNDS(spookyCharlie05,spooky);
    MACRO_SOUNDS(spookyCharlie06,spooky);
    MACRO_SOUNDS(spookyCharlie07,spooky);
    MACRO_SOUNDS(stage01,spooky);

    // Zones
    MACRO_SOUNDS(altarAlarm,zones);
    MACRO_SOUNDS(choking,zones);
    MACRO_SOUNDS(submergedShort,zones);
};
