#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"misery_main"}; // Include addons from this mod that contain code or assets you depend on. Affects loadorder. Including main as an example here.
        authors[] = {"TenuredCLOUD"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class ArgumentsBaseUnits
        {
            class Units;
        };
        class AttributesBase
        {
            class Default;
            class Edit; //Text input
            class Combo; //Drop down list
            class CheckBox; //Checkbox that returns true or false
            class CheckboxNumber; //Checkbox that returns 1 or 0
            class ModuleDescription; //Description of module
        };
        class ModuleDescription
        {
            class Anything;
        };
    };

class Misery_CustomItemAction: Module_F
    {
        scope=2;
        displayName="Custom item usage";
        icon = QPATHTOEF(icons,data\swap_ca.paa);
        category="Misery_faction";
        function="Misery_fnc_ModuleCustomItemAction";
        functionPriority=1;
        isGlobal=0;
        isTriggerActivated=0;
        isDisposable=0;
        class Attributes: AttributesBase
        {
            class Misery_ClassName: Edit
            {
                property="Misery_ClassName";
                displayName="Class name";
                tooltip="The class name of the item (ex. FirstAidKit - doesn't require qoutes '')";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_Script: Edit
            {
                property="Misery_Script";
                displayName="Script path";
                tooltip="Path to a script that will be run when this item is clicked on (ex. Myscripts\myscript.sqf - doesn't require qoutes '')";
                typeName="STRING";
                defaultValue="""""";
            };
            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description[]=
            {
                "**Requires utilization of the Misery framework, cannot use this with Ravage**",
                "Class name and path of custom item actions when the inventory item is double-clicked.",
                "Place as many of these modules as you want, or for each inventory item you want to have an action.",
                "Syncing and location have no effect."
            };
            //position=0;
            duplicate=1;
        };
    };
};
