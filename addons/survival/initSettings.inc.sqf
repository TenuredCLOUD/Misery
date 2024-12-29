            [
            QGVAR(cycle), 
            "SLIDER", 
            ["survival Cycle length", "Seconds between updates / calculations (Misery hunger, thirst, temperature calculations, etc...) (note: very low cycle values may cause lag)"], 
            ["Misery","Survival framework"], 
            [1, 300, 30, 0], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(thirstIncrement), 
            "SLIDER", 
            ["Thirst increment", "Thirst increase every cycle"], 
            ["Misery","Survival framework"], 
            [0.01, 100, 0.05, 2], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(hungerIncrement), 
            "SLIDER", 
            ["Hunger increment", "Hunger increase every cycle"], 
            ["Misery","Survival framework"], 
            [0.01, 100, 0.05, 2], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(weightDeficiency), 
            "CHECKBOX", 
            ["Weight penalty", "Enable a penalty for players gear weight? (Enables a deficiency to hunger / thirst for player weight, also increases tired calc values in SP - Dynamically calculated)"], 
            ["Misery","Penalties"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(temperatureDeficiency), 
            "CHECKBOX", 
            ["Temperature penalty", "Enable a penalty for players Temperature? (Cold - hunger increase / Hot or fever thirst increase - Dynamically calculated)"], 
            ["Misery","Penalties"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(energyDeficitIncrement), 
            "SLIDER", 
            ["Energy deficit increment", "Energy loss every cycle (SP only)"], 
            ["Misery","Sleep & Fatigue"], 
            [0.01, 100, 0.1, 2], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(toxicityHealing), 
            "SLIDER", 
            ["Poison healing", "Poison decrease every cycle"], 
            ["Misery","Disease & infection"], 
            [0.01, 100, 0.1, 2], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(infectionHealing), 
            "SLIDER", 
            ["Infection healing", "Infection decrease every cycle"], 
            ["Misery","Disease & infection"], 
            [0.01, 100, 0.1, 2], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(blackoutChance), 
            "SLIDER", 
            ["Blackout chance", "% chance per cycle to blackout when Tired (SP only)"], 
            ["Misery","Sleep & Fatigue"], 
            [1, 100, 30, 0], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(ailments), 
            "CHECKBOX", 
            ["Misery Ailments", "Enable Ailments? (Enables bacterial infections, parasites, etc...)"], 
            ["Misery","Disease & infection"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(turbidWaterChance), 
            "SLIDER", 
            ["Turbid water disease chance", "% chance Turbid water consumption causes disease (0 to disable)"], 
            ["Misery","Disease & infection"], 
            [0, 100, 0, 0], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(meatDiseaseChance), 
            "SLIDER", 
            ["Raw meat disease chance", "% chance Raw meat consumption causes disease (0 to disable)"], 
            ["Misery","Disease & infection"], 
            [0, 100, 0, 0], 
            1 
            ] call CBA_fnc_addSetting;
