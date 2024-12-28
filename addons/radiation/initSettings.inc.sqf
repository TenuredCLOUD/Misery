            [
            QGVAR(enabled), 
            "CHECKBOX", 
            ["Radiation", "Enable Radiation exposure once in radiation zones?"], 
            ["Misery","Zone Logics"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(leadContainers), 
            "CHECKBOX", 
            ["Leadlined container actions", "Enable Lead container actions? (Adds safe transportation of artifacts if artifact exposure is enabled)"], 
            ["Misery","Radiation & Artifacts"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(healingVal), 
            "SLIDER", 
            ["Radiation healing", "Radiation decrease every cycle"], 
            ["Misery","Radiation & Artifacts"], 
            [1, 10, 0.1, 2], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(enhancedExposure), 
            "CHECKBOX", 
            ["Advanced Radiation exposure", "Enable more serious radiation poisoning? (Enables shaking, coughing, and extra hunger and thirst drainage from radiation poisoning - scales with exposure)"], 
            ["Misery","Radiation & Artifacts"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(enhancedArtifiacts), 
            "CHECKBOX", 
            ["Artifact Radiation exposure", "Enable radiation exposure from artifacts? (If the player possesses an artifact of any type they are exposed to radiation, unless the artifact is placed in a lead lined container)"], 
            ["Misery","Radiation & Artifacts"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;
