class Extended_PreInit_EventHandlers {
    class ADDON {
        Init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        Init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};