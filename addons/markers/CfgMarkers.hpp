class CfgMarkers {
    class GVAR(ammo): GVAR(ammo) {
        color[] = {0, 0, 0, 1};
        icon = QPATHTOF(data\ammo.paa);
        markerClass = QGVAR(map);
        name = "Ammo";
        scope = 2;
        shadow = 0;
        size = 32;
    };

    class GVAR(banker): GVAR(ammo) {
        icon = QPATHTOF(data\banker.paa);
        name = "Banker";
    };

    class GVAR(base_materials): GVAR(ammo) {
        icon = QPATHTOF(data\basematerial.paa);
        name = "Base Materials";
    };

    class GVAR(base_trader): GVAR(ammo) {
        icon = QPATHTOF(data\basetrader.paa);
        name = "Base Trader";
    };

    class GVAR(ecologists): GVAR(ammo) {
        icon = QPATHTOF(data\gasmask.paa);
        name = "Ecologists";
    };

    class GVAR(forge_anvil): GVAR(ammo) {
        icon = QPATHTOF(data\anvil.paa);
        name = "Forge & Anvil";
    };

    class GVAR(fuel): GVAR(ammo) {
        icon = QPATHTOF(data\fuel.paa);
        name = "Fuel";
    };

    class GVAR(heli_wreck): GVAR(ammo) {
        icon = QPATHTOF(data\heliwreck.paa);
        name = "Helicopter Wreck";
    };

    class GVAR(lumber_mill): GVAR(ammo) {
        icon = QPATHTOF(data\lumber.paa);
        name = "Lumber Mill";
    };

    class GVAR(mechanic): GVAR(ammo) {
        icon = QPATHTOF(data\mechanic.paa);
        name = "Mechanic";
    };

    class GVAR(medical): GVAR(ammo) {
        icon = QPATHTOF(data\medical.paa);
        name = "Medical";
    };

    class GVAR(military): GVAR(ammo) {
        icon = QPATHTOF(data\military.paa);
        name = "Military Zone";
    };

    class GVAR(mining): GVAR(ammo) {
        icon = QPATHTOF(data\mining.paa);
        name = "Mining";
    };

    class GVAR(radiation_zone): GVAR(ammo) {
        icon = QPATHTOF(data\radzone.paa);
        name = "Radiation Zone";
    };

    class GVAR(safezone): GVAR(ammo) {
        icon = QPATHTOF(data\safezone.paa);
        name = "Safezone";
    };

    class GVAR(skull): GVAR(ammo) {
        icon = QPATHTOF(data\skull.paa);
        name = "Skull";
    };

    class GVAR(trader_presence): GVAR(ammo) {
        icon = QPATHTOF(data\trader.paa);
        name = "Trader";
    };
};
