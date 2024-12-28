            [
            QGVAR(deficiencyCycle), 
            "SLIDER", 
            ["Gasmask deficiency cycle", "Defines when Cartridge capacity decreases (Requires Enhanced gasmasks)"], 
            ["Misery","Radiation & Artifacts"], 
            [1, 300, 15, 0], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(enhanced), 
            "CHECKBOX", 
            ["Enhanced gasmasks", "Enable enhanced gasmasks? (Makes all gasmasks vulnerable to cartridge failure, while gasmasks are worn cartridges deplete. If a rebreather is equipped, this isn't active due to using a rebreather for supplied air)"], 
            ["Misery","Radiation & Artifacts"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;
