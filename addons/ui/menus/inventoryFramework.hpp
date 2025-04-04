class CLASS(inventoryFramework_ui)
{
    idd = 982377;
    onLoad = QUOTE([] call EFUNC(vitals,status); _this call EFUNC(inventory,initInventoryDialog));

    class ControlsBackground
    {
        class CLASS(inventoryFramework_actions_background): CLASS(RscText)
        {
            idc = -1;
            x = -26 * GUI_GRID_W + GUI_GRID_X;
            y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 31.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(inventoryFramework_vitals_background): CLASS(RscText)
        {
            idc = -1;
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 16.5 * GUI_GRID_W;
            h = 31.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(inventoryFramework_prompt): RscText
        {
            idc = -1;
            text = "Actions:";
            x = -25.5 * GUI_GRID_W + GUI_GRID_X;
            y = -3 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_items_prompt): RscText
        {
            idc = -1;
            text = "Items:";
            x = -25.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_buffs): RscText
        {
            idc = -1;
            text = "Buffs:";
            x = 50.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_ailments): RscText
        {
            idc = -1;
            text = "Ailments:";
            x = 58.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class CLASS(inventoryFramework_actionList): RscListBox
        {
            idc = 1500;
            x = -25 * GUI_GRID_W + GUI_GRID_X;
            y = -1 * GUI_GRID_H + GUI_GRID_Y;
            w = 14.5 * GUI_GRID_W;
            h = 9.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_actionButton): RscButton
        {
            idc = 1600;
            text = "Confirm Selection";
            x = -17.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
            colorFocused[] = {0.5,0.5,0.5,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([true] call EFUNC(actions,selectAction));
        };
        class CLASS(inventoryFramework_itemsList): RscListBox
        {
            idc = 1503;
            x = -25 * GUI_GRID_W + GUI_GRID_X;
            y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 14.5 * GUI_GRID_W;
            h = 9.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_itemsSelect): RscCombo
        {
            idc = 2100;
            x = -25 * GUI_GRID_W + GUI_GRID_X;
            y = 12 * GUI_GRID_H + GUI_GRID_Y;
            w = 15 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_itemsSelection): RscButton
        {
            idc = 1601;
            text = "Use";
            x = -17 * GUI_GRID_W + GUI_GRID_X;
            y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
            colorFocused[] = {0.5,0.5,0.5,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE([ctrlParent (_this select 0)] call EFUNC(inventory,handleItemUse));
        };
        class CLASS(inventoryFramework_status_health): RscText
        {
            idc = 1008;
            text = "Blood:";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_healthBar): CLASS(RscProgress)
        {
            idc = 1011;
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_hunger): RscText
        {
            idc = 1003;
            text = "Hunger:";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_hungerBar): CLASS(RscProgress)
        {
            idc = 1012;
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_thirst): RscText
        {
            idc = 1005;
            text = "Thirst:";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_thirstBar): CLASS(RscProgress)
        {
            idc = 1013;
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_fatigue): RscText
        {
            idc = 1006;
            text = "Fatigue:";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_fatigueBar): CLASS(RscProgress)
        {
            idc = 1014;
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.8 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_funds): RscText
        {
            idc = 1009;
            text = "Funds";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_gasMask): RscText
        {
            idc = 1016;
            text = "Gas Mask:";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_gasMask_cartridge): RscText
        {
            idc = 1017;
            text = "None";
            x = 53.12 * GUI_GRID_W + GUI_GRID_X;
            y = 7.25 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_temperature): RscText
        {
            idc = 1015;
            text = "Temperature:";
            x = 49.5 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_temperature_exposure): RscText
        {
            idc = 1010;
            text = "No ERU";
            x = 54.12 * GUI_GRID_W + GUI_GRID_X;
            y = 8.53 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
        class CLASS(inventoryFramework_status_buffs_list): RscListBox
        {
            idc = 1501;
            x = 50.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            onLBSelChanged = QUOTE(_this call EFUNC(vitals,processStatus));
        };
        class CLASS(inventoryFramework_status_ailments_list): RscListBox
        {
            idc = 1502;
            x = 58.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
            onLBSelChanged = QUOTE(_this call EFUNC(vitals,processStatus));
        };
        class CLASS(inventoryFramework_noteBox): RscStructuredText
        {
            idc = 1022;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 26 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 4.5 * GUI_GRID_H;
            sizeEx = 0.7 * GUI_GRID_H;
        };
    };
};
