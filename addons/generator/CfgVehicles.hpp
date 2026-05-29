class CfgVehicles {
    class Sound;

    class GVAR(sfx_v_petrolGenRun): Sound {
        author = "TenuredCLOUD";
        scope = 2;
        sound = QGVAR(sfx_portableRunning);
        displayName = "Petrol Generator Run Sound";
    };
    class GVAR(sfx_v_dieselGenRun): Sound {
        author = "TenuredCLOUD";
        scope = 2;
        sound = QGVAR(sfx_dieselRunning);
        displayName = "Diesel Generator Run Sound";
    };
    class GVAR(sfx_v_kvaGenRun): Sound {
        author = "TenuredCLOUD";
        scope = 2;
        sound = QGVAR(sfx_kvaRunning);
        displayName = "KVA Generator Run Sound";
    };
};
