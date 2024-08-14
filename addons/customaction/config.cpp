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

class Misery_CustomAction: Module_F
    {
        scope=2;
        displayName="Custom action";
        icon = QPATHTOEF(icons,data\action_ca.paa);
        category="Misery_faction";
        function="Misery_fnc_ModuleCustomAction";
        functionPriority=1;
        isGlobal=0;
        isTriggerActivated=0;
        isDisposable=0;
        class Attributes: AttributesBase
        {
            class Misery_Description: Edit
            {
                property="Misery_Description";
                displayName="Description";
                tooltip="The text that will appear in the player inventory menu (eg. My custom action)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_Script: Edit
            {
                property="Misery_Script";
                displayName="Script path";
                tooltip="Path to a script that will be run when this action is clicked on (eg. Myscripts\CustomAction1.sqf)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_WaitTime: Edit
            {
                property="Misery_WaitTime";
                displayName="Wait time";
                tooltip="Delay in seconds before adding this action (shorter wait means high in the list).";
                typeName="NUMBER";
                defaultValue="0";
            };
            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description[]=
            {
                "Description and path of custom actions to add to the player inventory menu.",
                "If no units are synced, all players have access to this action.",
                "If units are synced, only they will have access to this action.",
                "Place as many of these modules as you want."
            };
            //position=0;
            duplicate=1;
        };
    };
};
