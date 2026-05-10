class ACE_Medical_Treatment {

    class Medication {

        class Radiation_Stims_Base {
            painReduce = 0;
            hrIncreaseLow[] = {2, 5};
            hrIncreaseNormal[] = {3, 6};
            hrIncreaseHigh[] = {4, 7};
            maxDose = 10;
            incompatibleMedication[] = {
                QUOTE(Epinephrine),
                QUOTE(Adenosine)
            };
            viscosityChange = -10;
        };

        class CLASS(thrombomodulin) : Radiation_Stims_Base {
            dose = 1;
            timeInSystem = 900;
            timeTillMaxEffect = 60;
        };

        class CLASS(thrombomodulin_Stimpack) : Radiation_Stims_Base {
            dose = 4;
            timeInSystem = 1800;
            timeTillMaxEffect = 60;
        };

        class CLASS(cocaine) {
            painReduce = 0.5;
            hrIncreaseLow[] = {5, 15};
            hrIncreaseNormal[] = {10, 20};
            hrIncreaseHigh[] = {15, 30};
            timeInSystem = 900;
            timeTillMaxEffect = 60;
            maxDose = 2;
            dose = 1;
            incompatibleMedication[] = {QUOTE(Morphine)};
            viscosityChange = 0;
        };

        class CLASS(antibiotic) {
            painReduce = 0;
            hrIncreaseLow[] = {1, 2};
            hrIncreaseNormal[] = {2, 3};
            hrIncreaseHigh[] = {3, 4};
            timeInSystem = 900;
            timeTillMaxEffect = 120;
            maxDose = 4;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = 0;
        };

        class CLASS(antidote) {
            painReduce = 0;
            hrIncreaseLow[] = {-1, -2};
            hrIncreaseNormal[] = {-3, -5};
            hrIncreaseHigh[] = {-4, -7};
            timeInSystem = 900;
            timeTillMaxEffect = 60;
            maxDose = 4;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = -10;
        };

        class CLASS(antiparasitic) {
            painReduce = 0;
            hrIncreaseLow[] = {1, 2};
            hrIncreaseNormal[] = {2, 3};
            hrIncreaseHigh[] = {3, 4};
            timeInSystem = 900;
            timeTillMaxEffect = 120;
            maxDose = 4;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = 0;
        };

        class CLASS(caffetin) {
            painReduce = 0.2;
            hrIncreaseLow[] = {2, 5};
            hrIncreaseNormal[] = {3, 6};
            hrIncreaseHigh[] = {4, 8};
            timeInSystem = 900;
            timeTillMaxEffect = 120;
            maxDose = 8;
            dose = 1;
            incompatibleMedication[] = {
                QCLASS(cocaine)
            };
            viscosityChange = 0;
        };

        class CLASS(caffeine) {
            painReduce = 0;
            hrIncreaseLow[] = {2, 5};
            hrIncreaseNormal[] = {4, 8};
            hrIncreaseHigh[] = {6, 10};
            timeInSystem = 900;
            timeTillMaxEffect = 120;
            maxDose = 20;
            dose = 1;
            incompatibleMedication[] = {
                QCLASS(cocaine)
            };
            viscosityChange = 0;
        };

        class CLASS(charcoalTablets) {
            painReduce = 0;
            hrIncreaseLow[] = {1, 2};
            hrIncreaseNormal[] = {2, 2};
            hrIncreaseHigh[] = {3, 3};
            timeInSystem = 450;
            timeTillMaxEffect = 120;
            maxDose = 20;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = 0;
        };

        class CLASS(clozapine) {
            painReduce = 0;
            hrIncreaseLow[] = {-2, -4};
            hrIncreaseNormal[] = {-4, -8};
            hrIncreaseHigh[] = {-6, -10};
            timeInSystem = 1200;
            timeTillMaxEffect = 60;
            maxDose = 2;
            dose = 1;
            incompatibleMedication[] = {
                QUOTE(Morphine),
                QCLASSACE(glucose),
                QCLASSACE(electrolyte),
                QUOTE(Epinephrine),
                QCLASS(cocaine)
            };
            viscosityChange = 0;
        };

        class CLASS(clozapineBox) {
            painReduce = 0;
            hrIncreaseLow[] = {-1, -2};
            hrIncreaseNormal[] = {-3, -5};
            hrIncreaseHigh[] = {-4, -7};
            timeInSystem = 600;
            timeTillMaxEffect = 120;
            maxDose = 4;
            dose = 1;
            incompatibleMedication[] = {
                QUOTE(Morphine),
                QCLASSACE(glucose),
                QCLASSACE(electrolyte),
                QUOTE(Epinephrine),
                QCLASS(cocaine)
            };
            viscosityChange = 0;
        };

        class CLASS(deconKit) {
            painReduce = 0;
            hrIncreaseLow[] = {0, 0};
            hrIncreaseNormal[] = {0, 0};
            hrIncreaseHigh[] = {0, 0};
            timeInSystem = 400;
            timeTillMaxEffect = 120;
            maxDose = 100;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = 0;
        };

        class CLASS(electrolyte) {
            painReduce = 0;
            hrIncreaseLow[] = {1, 2};
            hrIncreaseNormal[] = {2, 3};
            hrIncreaseHigh[] = {3, 4};
            timeInSystem = 400;
            timeTillMaxEffect = 60;
            maxDose = 8;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = 10;
        };

        class CLASS(glucose) {
            painReduce = 0;
            hrIncreaseLow[] = {2, 4};
            hrIncreaseNormal[] = {3, 5};
            hrIncreaseHigh[] = {4, 6};
            timeInSystem = 400;
            timeTillMaxEffect = 60;
            maxDose = 8;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = -10;
        };

        class CLASS(painkillers) {
            painReduce = 0.35;
            hrIncreaseLow[] = {-1, -2};
            hrIncreaseNormal[] = {-2, -3};
            hrIncreaseHigh[] = {-3, -4};
            timeInSystem = 500;
            timeTillMaxEffect = 120;
            maxDose = 4;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = 0;
        };

        class CLASS(potassiumIodate) {
            painReduce = 0;
            hrIncreaseLow[] = {1, 2};
            hrIncreaseNormal[] = {2, 3};
            hrIncreaseHigh[] = {3, 4};
            timeInSystem = 500;
            timeTillMaxEffect = 120;
            maxDose = 4;
            dose = 1;
            incompatibleMedication[] = {};
            viscosityChange = 0;
        };

        class CLASS(randomMedication) {
            painReduce = -2.0;
            hrIncreaseLow[] = {-5, -10};
            hrIncreaseNormal[] = {-6, -12};
            hrIncreaseHigh[] = {-7, -14};
            timeInSystem = 900;
            timeTillMaxEffect = 120;
            maxDose = 1;
            dose = 1;
            incompatibleMedication[] = {
                QCLASS(cocaine)
            };
            viscosityChange = 0;
        };

        class CLASS(sleepingPills) {
            painReduce = 0;
            hrIncreaseLow[] = {-1, -2};
            hrIncreaseNormal[] = {-2, -3};
            hrIncreaseHigh[] = {-3, -4};
            timeInSystem = 500;
            timeTillMaxEffect = 120;
            maxDose = 2;
            dose = 1;
            incompatibleMedication[] = {
                QCLASS(cocaine)
            };
            viscosityChange = 0;
        };
    };
};

