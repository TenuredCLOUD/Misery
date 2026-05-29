class CfgSFX {
    class GVAR(sfx_portableRunning) {
        sound0[] = {QPATHTOEF(audio,sounds\generator\petrolRunning.ogg), 3, 1, 50, 1, -1, -1, -1};
        sounds[] = {"sound0"};
        empty[] = {"", 0, 0, 0, 0, -1, -1, -1};
    };
    class GVAR(sfx_dieselRunning): GVAR(sfx_portableRunning) {
        sound0[] = {QPATHTOEF(audio,sounds\generator\dieselRunning.ogg), 3, 1, 100, 1, -1, -1, -1};
    };
    class GVAR(sfx_kvaRunning): GVAR(sfx_portableRunning) {
        sound0[] = {QPATHTOEF(audio,sounds\generator\kvaRunning.ogg), 3, 1, 500, 1, -1, -1, -1};
    };
};
