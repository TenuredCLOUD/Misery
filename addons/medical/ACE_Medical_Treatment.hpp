class ACE_Medical_Treatment {
    class Medication;

    class CLASS(electrolyte): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 1;
        timeTillMaxEffect = 1;
        maxDose = 100;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(glucose): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 1;
        timeTillMaxEffect = 1;
        maxDose = 100;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(clozapine): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 120;
        timeTillMaxEffect = 5;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {
            QCLASSACE(morphine),
            QCLASSACE(glucose),
            QCLASSACE(electrolyte),
            QCLASSACE(epinephrine),
            QCLASS(cocaine)
        };
        viscosityChange = 0;
    };

    class CLASS(clozapineBox): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 120;
        timeTillMaxEffect = 5;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {
            QCLASSACE(morphine),
            QCLASS(glucose),
            QCLASS(electrolyte),
            QCLASSACE(epinephrine),
            QCLASS(cocaine)
        };
        viscosityChange = 0;
    };

    class Radiation_Stims_Base : Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 300;
        timeTillMaxEffect = 15;
        maxDose = 10;
        incompatibleMedication[] = {
            QCLASSACE(epinephrine),
            QCLASSACE(adenosine)
        };
        viscosityChange = 0.1;
    };

    class CLASS(thrombomodulin) : Radiation_Stims_Base {
        dose = 1;
    };

    class CLASS(thrombomodulin_Stimpack) : Radiation_Stims_Base {
        dose = 4;
    };

    class CLASS(cocaine): Medication {
        painReduce = 0.5;
        hrIncreaseLow[] = {5, 10};
        hrIncreaseNormal[] = {15, 20};
        hrIncreaseHigh[] = {25, 30};
        timeInSystem = 1800;
        timeTillMaxEffect = 1200;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(antibiotic): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 3600;
        timeTillMaxEffect = 1800;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(antidote): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 3600;
        timeTillMaxEffect = 1800;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(antiparasitic): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 3600;
        timeTillMaxEffect = 1800;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(caffetin): Medication {
        painReduce = 0.15;
        hrIncreaseLow[] = {5, 10};
        hrIncreaseNormal[] = {10, 20};
        hrIncreaseHigh[] = {15, 30};
        timeInSystem = 3600;
        timeTillMaxEffect = 300;
        maxDose = 3;
        dose = 1;
        incompatibleMedication[] = {
            QCLASS(cocaine)
        };
        viscosityChange = 0;
    };

    class CLASS(caffeine): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {2, 5};
        hrIncreaseNormal[] = {5, 10};
        hrIncreaseHigh[] = {8, 15};
        timeInSystem = 3600;
        timeTillMaxEffect = 600;
        maxDose = 3;
        dose = 1;
        incompatibleMedication[] = {
            QCLASS(cocaine)
        };
        viscosityChange = 0;
    };

    class CLASS(cenestin): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 3600;
        timeTillMaxEffect = 120;
        maxDose = 1;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0.5;
    };

    class CLASS(charcoalTablets): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 3600;
        timeTillMaxEffect = 120;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

};
