////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by TenuredCLOUD, v1.063, #Pevyne)
////////////////////////////////////////////////////////

class misery_refuelJerryCan_background: misery_RscText
{
	idc = -1;

	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
	colorBackground[] = {0.2,0.2,0.2,0.7};
};
class misery_refuelJerryCan_prompt: RscText
{
	idc = 1001;
	text = "Refuel Vehicle"; //--- ToDo: Localize;
	x = 1.6 * GUI_GRID_W + GUI_GRID_X;
	y = 0.24 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
class misery_refuelJerryCan_icon: RscPicture
{
	idc = 1602;

	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class misery_refuelJerryCan_name: RscText
{
	idc = 1603;

	x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class misery_refuelJerryCan_icon_2: RscPicture
{
	idc = 1604;

	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 30.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class misery_refuelJerryCan_list: RscListBox
{
	idc = 1500;

	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
};
class misery_refuelJerryCan_refill: RscButton
{
	idc = 1600;
	colorFocused[] = {0.5,0.5,0.5,0.7};
	onButtonClick = "[] call misery_fuel_fnc_processRefuel";

	text = "Refill"; //--- ToDo: Localize;
	x = 29.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {0.2,0.2,0.2,0.7};
	colorActive[] = {0.5,0.5,0.5,0.7};
};
class misery_refuelJerryCan_exit: RscButton
{
	idc = 1601;
	colorFocused[] = {0.5,0.5,0.5,0.7};
	onButtonClick = "closeDialog 2";

	text = "Exit"; //--- ToDo: Localize;
	x = 29.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {0.2,0.2,0.2,0.7};
	colorActive[] = {0.5,0.5,0.5,0.7};
};
class misery_refuelJerryCan_infoBox: RscText
{
	idc = 1001;

	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 37.5 * GUI_GRID_W;
	h = 6 * GUI_GRID_H;
};
class misery_refuelJerryCan_battery_icon: RscPicture
{
	idc = 1602;

	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 33 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class misery_refuelJerryCan_battery_amount: RscText
{
	idc = 1603;

	x = 32.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
