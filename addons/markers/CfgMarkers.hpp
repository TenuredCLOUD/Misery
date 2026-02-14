class CfgMarkers {
    class GVAR(ammo) {
        color[] = {1, 1, 1, 1};
        icon = QPATHTOF(data\container_ca.paa);
        markerClass = QGVAR(map);
        name = "Ammo";
        scope = 2;
        shadow = 0;
        size = 32;
    };

    class GVAR(banker): GVAR(ammo) {
        icon = QPATHTOF(data\vault_ca.paa);
        name = "Bank";
    };

    class GVAR(base_materials): GVAR(ammo) {
        icon = QPATHTOF(data\house_plus_ca.paa);
        name = "Base Materials";
    };

    class GVAR(base_trader): GVAR(ammo) {
        icon = QPATHTOF(data\tent_ca.paa);
        name = "Base Trader";
    };

    class GVAR(research): GVAR(ammo) {
        icon = QPATHTOF(data\flask_conical_ca.paa);
        name = "Research Team";
    };

    class GVAR(forge_anvil): GVAR(ammo) {
        icon = QPATHTOF(data\anvil_ca.paa);
        name = "Forge & Anvil";
    };

    class GVAR(fuel): GVAR(ammo) {
        icon = QPATHTOF(data\fuel_ca.paa);
        name = "Fuel";
    };

    class GVAR(mechanic): GVAR(ammo) {
        icon = QPATHTOF(data\wrench_ca.paa);
        name = "Mechanic";
    };

    class GVAR(medical): GVAR(ammo) {
        icon = QPATHTOF(data\pillbottle_ca.paa);
        name = "Medical";
    };

    class GVAR(military): GVAR(ammo) {
        icon = QPATHTOF(data\shield_user_ca.paa);
        name = "Military Zone";
    };

    class GVAR(mining): GVAR(ammo) {
        icon = QPATHTOF(data\stone_ca.paa);
        name = "Mining";
    };

    class GVAR(radiation_zone): GVAR(ammo) {
        icon = QPATHTOF(data\radiation_ca.paa);
        name = "Radiation Zone";
    };

    class GVAR(safezone): GVAR(ammo) {
        icon = QPATHTOF(data\shield_check_ca.paa);
        name = "Safezone";
    };

    class GVAR(skull): GVAR(ammo) {
        icon = QPATHTOF(data\skull_ca.paa);
        name = "Skull";
    };

    class GVAR(trader_presence): GVAR(ammo) {
        icon = QPATHTOF(data\hand_coins_ca.paa);
        name = "Trader";
    };
};
