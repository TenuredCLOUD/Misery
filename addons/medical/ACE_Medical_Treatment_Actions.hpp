class ACE_Medical_Treatment_Actions {
    class Morphine;

    class CLASS(electrolyte): Morphine {
        displayName = "Inject Electrolyte solution";
        displayNameProgress = "Injecting solution...";
        icon = "z\ace\addons\medical_gui\ui\auto_injector.paa";
        medicRequired = 0;
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        category = "medication";
        items[] = {QCLASS(electrolyte)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackSuccess = QFUNC(logEvent);
        // animationMedic = "AinvPknlMstpSlayWpstDnon_medicOther";
        // animationMedicProne = "";
        // animationMedicSelf = "AinvPknlMstpSlayWpstDnon_medic";
        // animationMedicSelfProne = "";
        sounds[] = {{"z\ace\addons\medical_treatment\sounds\Inject.ogg", 1, 1, 50}};
        litter[] = {{"MedicalGarbage_01_Injector_F"}};
    };

    class CLASS(glucose): Morphine {
        displayName = "Inject Glucose";
        displayNameProgress = "Injecting glucose...";
        icon = "z\ace\addons\medical_gui\ui\auto_injector.paa";
        medicRequired = 0;
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        category = "medication";
        items[] = {QCLASS(glucose)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackSuccess = QFUNC(logEvent);
        // animationMedic = "AinvPknlMstpSlayWpstDnon_medicOther";
        // animationMedicProne = "";
        // animationMedicSelf = "AinvPknlMstpSlayWpstDnon_medic";
        // animationMedicSelfProne = "";
        sounds[] = {{"z\ace\addons\medical_treatment\sounds\Inject.ogg", 1, 1, 50}};
        litter[] = {{"MedicalGarbage_01_Injector_F"}};
    };

    class CLASS(clozapine): Morphine {
        displayName = "Inject Clozapine";
        displayNameProgress = "Injecting clozapine...";
        icon = "z\ace\addons\medical_gui\ui\auto_injector.paa";
        medicRequired = 0;
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        category = "medication";
        items[] = {QCLASS(clozapine)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackSuccess = QFUNC(logEvent);
        // animationMedic = "AinvPknlMstpSlayWpstDnon_medicOther";
        // animationMedicProne = "";
        // animationMedicSelf = "AinvPknlMstpSlayWpstDnon_medic";
        // animationMedicSelfProne = "";
        sounds[] = {{"z\ace\addons\medical_treatment\sounds\Inject.ogg", 1, 1, 50}};
        litter[] = {{"MedicalGarbage_01_Injector_F"}};
    };

    class CLASS(clozapineBox): Morphine {
        displayName = "Administer Clozapine";
        displayNameProgress = "Administering clozapine...";
        icon = "z\ace\addons\medical_gui\ui\painkillers.paa";
        medicRequired = 0;
        allowedSelections[] = {"Head"};
        category = "medication";
        items[] = {QCLASS(clozapineBox)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackStart = QUOTE(['Land_VitaminBottle_F'] call EFUNC(animations,process));
        callbackSuccess = QFUNC(logEvent);
        animationMedic = "";
        animationMedicProne = "";
        animationMedicSelf = "";
        animationMedicSelfProne = "";
        sounds[] = {{QPATHTOEF(audio,sounds\items\caffetinBoxOpen.ogg), 1, 1, 50}};
        litter[] = {};
    };

    class CLASS(thrombomodulin): Morphine {
        displayName = "Inject Thrombomodulin";
        displayNameProgress = "Injecting thrombomodulin...";
        icon = "z\ace\addons\medical_gui\ui\auto_injector.paa";
        medicRequired = 0;
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        category = "medication";
        items[] = {QCLASS(thrombomodulin)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackSuccess = QFUNC(logEvent);
        // animationMedic = "AinvPknlMstpSlayWpstDnon_medicOther";
        // animationMedicProne = "";
        // animationMedicSelf = "AinvPknlMstpSlayWpstDnon_medic";
        // animationMedicSelfProne = "";
        sounds[] = {{"z\ace\addons\medical_treatment\sounds\Inject.ogg", 1, 1, 50}};
        litter[] = {{"MedicalGarbage_01_Injector_F"}};
    };

    class CLASS(thrombomodulin_Stimpack): Morphine {
        displayName = "Inject Thrombomodulin Stimpack";
        displayNameProgress = "Injecting thrombomodulin stimpack...";
        icon = "z\ace\addons\medical_gui\ui\auto_injector.paa";
        medicRequired = 0;
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        category = "medication";
        items[] = {QCLASS(thrombomodulin_Stimpack)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackSuccess = QFUNC(logEvent);
        // animationMedic = "AinvPknlMstpSlayWpstDnon_medicOther";
        // animationMedicProne = "";
        // animationMedicSelf = "AinvPknlMstpSlayWpstDnon_medic";
        // animationMedicSelfProne = "";
        sounds[] = {{"z\ace\addons\medical_treatment\sounds\Inject.ogg", 1, 1, 50}};
        litter[] = {{"MedicalGarbage_01_Injector_F"}};
    };

    class CLASS(cocaine): Morphine {
        displayName = "Snort Cocaine";
        displayNameProgress = "Snorting cocaine...";
        icon = "z\ace\addons\medical_gui\ui\painkillers.paa";
        medicRequired = 0;
        allowedSelections[] = {"Head"};
        category = "medication";
        items[] = {QCLASS(cocaine)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 3;
        treatmentTimeTrained = 2;
        callbackSuccess = QACEFUNC(medical_treatment,medication); //QFUNC(logEvent);
        animationMedic = "";
        animationMedicProne = "";
        animationMedicSelf = "";
        animationMedicSelfProne = "";
        sounds[] = {{QPATHTOEF(audio,sounds\items\sniff.ogg), 1, 1, 50}};
        litter[] = {};
    };

    class CLASS(antibiotic): Morphine {
        displayName = "Administer Antibiotics";
        displayNameProgress = "Administering antibiotics...";
        icon = "z\ace\addons\medical_gui\ui\painkillers.paa";
        medicRequired = 0;
        allowedSelections[] = {"Head"};
        category = "medication";
        consumeItem = 0;
        items[] = {QCLASS(antibiotic)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackStart = QUOTE(['Land_Antibiotic_F'] call EFUNC(animations,process));
        callbackSuccess = QFUNC(logEvent);
        animationMedic = "";
        animationMedicProne = "";
        animationMedicSelf = "";
        animationMedicSelfProne = "";
        sounds[] = {{QPATHTOEF(audio,sounds\items\caffetinBoxOpen.ogg), 1, 1, 50}};
        litter[] = {};
    };

    class CLASS(antidote): Morphine {
        displayName = "Inject Antidote";
        displayNameProgress = "Injecting antidote...";
        icon = "z\ace\addons\medical_gui\ui\auto_injector.paa";
        medicRequired = 0;
        allowedSelections[] = {"Head"};
        category = "medication";
        items[] = {QCLASS(antidote)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackSuccess = QFUNC(logEvent);
        // animationMedic = "AinvPknlMstpSlayWpstDnon_medicOther";
        // animationMedicProne = "";
        // animationMedicSelf = "AinvPknlMstpSlayWpstDnon_medic";
        // animationMedicSelfProne = "";
        sounds[] = {{"z\ace\addons\medical_treatment\sounds\Inject.ogg", 1, 1, 50}};
        litter[] = {{"MedicalGarbage_01_Injector_F"}};
    };

    class CLASS(antiparasitic): Morphine {
        displayName = "Administer Antiparasitics";
        displayNameProgress = "Administering antiparasitics...";
        icon = "z\ace\addons\medical_gui\ui\painkillers.paa";
        medicRequired = 0;
        allowedSelections[] = {"Head"};
        category = "medication";
        consumeItem = 0;
        items[] = {QCLASS(antiparasitic)};
        treatmentLocations = 0;
        condition = "";
        treatmentTime = 5;
        treatmentTimeTrained = 3;
        callbackStart = QUOTE(['Land_Antibiotic_F'] call EFUNC(animations,process));
        callbackSuccess = QFUNC(logEvent);
        animationMedic = "";
        animationMedicProne = "";
        animationMedicSelf = "";
        animationMedicSelfProne = "";
        sounds[] = {{QPATHTOEF(audio,sounds\items\caffetinBoxOpen.ogg), 1, 1, 50}};
        litter[] = {};
    };
};
