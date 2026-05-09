class ACE_Medical_Treatment {
    class Medication;

    class Radiation_Stims_Base : Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 10;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(thrombomodulin) : Radiation_Stims_Base {
        dose = 1;
    };

    class CLASS(thrombomodulin_Stimpack) : Radiation_Stims_Base {
        dose = 4;
    };

    class CLASS(cocaine): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
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
        timeInSystem = 0;
        timeTillMaxEffect = 0;
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
        timeInSystem = 0;
        timeTillMaxEffect = 0;
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
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(caffetin): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 3;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(caffeine): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 3;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(charcoalTablets): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(clozapine): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(clozapineBox): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(deconKit): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(electrolyte): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(glucose): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(painkillers): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 4;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(potassiumIodate): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 4;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(randomMedication): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 1;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };

    class CLASS(sleepingPills): Medication {
        painReduce = 0;
        hrIncreaseLow[] = {0, 0};
        hrIncreaseNormal[] = {0, 0};
        hrIncreaseHigh[] = {0, 0};
        timeInSystem = 0;
        timeTillMaxEffect = 0;
        maxDose = 2;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = 0;
    };
};
