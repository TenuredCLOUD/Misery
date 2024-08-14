// Classnames are: misery_audio_music_X

#define MACRO_MUSIC(var) \
    class GVAR(music_##var) { \
        name = QUOTE(var); \
        sound[] = {QPATHTOF(music\var.ogg), 1, 1}; \
        GVAR(isMusic) = 1; \
    }

class CfgMusic {
    tracks[] = {};
    MACRO_MUSIC(atmospheric);
    MACRO_MUSIC(crimsonSunset);
    MACRO_MUSIC(elysium);
    MACRO_MUSIC(eternalOhm);
    MACRO_MUSIC(ethereal);
    MACRO_MUSIC(extinctionEntity);
    MACRO_MUSIC(limbo);
    MACRO_MUSIC(myColdBones);
    MACRO_MUSIC(notAlone);
    MACRO_MUSIC(oldWorld);
    MACRO_MUSIC(passingThroughTheLight);
    MACRO_MUSIC(plaguedLands);
    MACRO_MUSIC(playground);
    MACRO_MUSIC(razorBurn);
    MACRO_MUSIC(sacredForest);
    MACRO_MUSIC(scars);
    MACRO_MUSIC(sullenSkies);
    MACRO_MUSIC(tectonic);
    MACRO_MUSIC(theBeginning);
    MACRO_MUSIC(theBurningRain);
    MACRO_MUSIC(theySeeYou);
    MACRO_MUSIC(wendingo);
};
