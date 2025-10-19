class CLASS(maintenance_ui)
{
    idd = 274839;
    onLoad = QUOTE([274839] call EFUNC(common,menuBlurEffect); [] call EFUNC(maintenance,listed); [] call EFUNC(maintenance,updateIcon));

    class ControlsBackground
    {
        class CLASS(maintenance_background): CLASS(RscText)
        {
            idc = 1800;
            x = -5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 49.5 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class CLASS(maintenance_prompt): RscText
        {
            idc = 1000;
            text = "Vehicle Maintenance"; //--- ToDo: Localize;
            x = -4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_name): RscText
        {
            idc = 1002;
            x = 32 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_icon): RscPicture
        {
            idc = 1200;
            x = 35 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
        };
    };
    class Controls
    {
        class CLASS(maintenance_list): RscListBox
        {
            idc = 1500;
            x = -4 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20.5 * GUI_GRID_W;
            h = 12.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_addBattery): RscButton
        {
            idc = 1607;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Add battery"; //--- ToDo: Localize;
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,addBattery));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_removeBattery): RscButton
        {
            idc = 1606;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Remove battery"; //--- ToDo: Localize;
            x = 29.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,removeBattery));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_addOil): RscButton
        {
            idc = 1604;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Add oil"; //--- ToDo: Localize;
            x = 22 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,addOil));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_removeOil): RscButton
        {
            idc = 1609;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Remove oil"; //--- ToDo: Localize;
            x = 22 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,removeOil));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_addCoolant): RscButton
        {
            idc = 1605;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Add coolant"; //--- ToDo: Localize;
            x = 22 * GUI_GRID_W + GUI_GRID_X;
            y = 14 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,addCoolant));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_removeCoolant): RscButton
        {
            idc = 1610;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Remove coolant"; //--- ToDo: Localize;
            x = 22 * GUI_GRID_W + GUI_GRID_X;
            y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,removeCoolant));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_repair): RscButton
        {
            idc = 1600;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Repair"; //--- ToDo: Localize;
            x = 37 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(
                private _dialog = ctrlParent (_this select 0);
                private _list = _dialog displayCtrl 1500;
                private _selected = lbCurSel _list;
                if (_selected isEqualTo -1) exitWith {ctrlSetText [ARR_2(1001, 'No repair option selected...')]};
                private _hitpoint = _list lbData _selected;
                [ARR_2(_hitpoint, _selected)] call EFUNC(maintenance,repair);
            );
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_refuel): RscButton
        {
            idc = 1601;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Refuel"; //--- ToDo: Localize;
            x = 37 * GUI_GRID_W + GUI_GRID_X;
            y = 14 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,refuel));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_syphon): RscButton
        {
            idc = 1608;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Syphon"; //--- ToDo: Localize;
            x = 37 * GUI_GRID_W + GUI_GRID_X;
            y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(call EFUNC(maintenance,syphon));
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_scavenge): RscButton
        {
            idc = 1602;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Scavenge"; //--- ToDo: Localize;
            x = 37 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(
                private _dialog = ctrlParent (_this select 0);
                private _list = _dialog displayCtrl 1500;
                private _selected = lbCurSel _list;
                if (_selected isEqualTo -1) exitWith {ctrlSetText [ARR_2(1001, 'No scavenge option selected...')]};
                private _hitpoint = _list lbData _selected;
                [ARR_2(_hitpoint, _selected)] call EFUNC(maintenance,scavenge);
            );
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_exit): RscButton
        {
            idc = 1603;
            colorFocused[] = {0.5,0.5,0.5,0.7};
            text = "Exit"; //--- ToDo: Localize;
            x = 37 * GUI_GRID_W + GUI_GRID_X;
            y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            colorBackground[] = {0.2,0.2,0.2,0.7};
            colorActive[] = {0.5,0.5,0.5,0.7};
            onButtonClick = QUOTE(closeDialog 2);
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_battery_info): RscText
        {
            idc = 1003;
            x = 5 * GUI_GRID_W + GUI_GRID_X;
            y = 15 * GUI_GRID_H + GUI_GRID_Y;
            w = 12.5 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_infoBox): RscText
        {
            idc = 1001;
            x = -4 * GUI_GRID_W + GUI_GRID_X;
            y = 21 * GUI_GRID_H + GUI_GRID_Y;
            w = 35 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_fuel_progressBar): CLASS(RscProgress)
        {
            idc = 2000;
            x = -0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 16 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_power_progressBar): CLASS(RscProgress)
        {
            idc = 2001;
            x = -0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 17 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_oil_progressBar): CLASS(RscProgress)
        {
            idc = 2002;
            x = -0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 18 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_coolant_progressBar): CLASS(RscProgress)
        {
            idc = 2003;
            x = -0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 19 * GUI_GRID_H + GUI_GRID_Y;
            w = 5 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
        };
        class CLASS(maintenance_fuelText): RscText
        {
            idc = 2010;
            text = "Fuel:"; //--- ToDo: Localize;
            x = -5 * GUI_GRID_W + GUI_GRID_X;
            y = 15 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_powerText): RscText
        {
            idc = 2011;
            text = "Power:"; //--- ToDo: Localize;
            x = -5 * GUI_GRID_W + GUI_GRID_X;
            y = 16 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_oilText): RscText
        {
            idc = 2012;
            text = "Oil:"; //--- ToDo: Localize;
            x = -5 * GUI_GRID_W + GUI_GRID_X;
            y = 17 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
        class CLASS(maintenance_coolantText): RscText
        {
            idc = 2013;
            text = "Coolant:"; //--- ToDo: Localize;
            x = -5 * GUI_GRID_W + GUI_GRID_X;
            y = 18 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            font = UI_MACRO_FONT;
            sizeEx = UI_MACRO_TEXTSIZE;
        };
    };
};
