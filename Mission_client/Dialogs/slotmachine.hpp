/*
	File: slot_machine.hpp
        Author: Jacob "PapaBear" Tyler
	Description: Gui for slotmachine
*/


class SlotMachineGUI
{
	idd = 5780;
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
	
		class RscFrame_1800: client_RscText
		{
			idc = 5770;
			colorBackground[] = {0.3,0,0.2,0.33};
			x = 0 * 0.025 + 0;
			y = 0 * 0.04 + 0;
			w = 40 * 0.025;
			h = 25 * 0.04;
		};
		
		class RscText_1000: client_RscText
		{
			idc = 5774;
			text = "Payout: $"; //--- ToDo: Localize;
			x = 13 * 0.025 + 0;
			y = 21 * 0.04 + 0;
			w = 5 * 0.025;
			h = 2 * 0.04;
		};
		
		class RscText_1003: client_RscText
		{
			idc = 5783;
			text = "BET"; //--- ToDo: Localize;
			x = 6 * 0.025 + 0;
			y = 14 * 0.04 + 0;
			w = 2 * 0.025;
			h = 1 * 0.04;
		};
		class RscText_1004: client_RscText
		{
			idc = 5784;
			text = "BET"; //--- ToDo: Localize;
			x = 15 * 0.025 + 0;
			y = 14 * 0.04 + 0;
			w = 2 * 0.025;
			h = 1 * 0.04;
		};
		class RscText_1005: client_RscText
		{
			idc = 5786;
			text = "BET"; //--- ToDo: Localize;
			x = 23 * 0.025 + 0;
			y = 14 * 0.04 + 0;
			w = 2 * 0.025;
			h = 1 * 0.04;
		};
		class RscText_1006: client_RscText
		{
			idc = 5787;
			text = "BET"; //--- ToDo: Localize;
			x = 32 * 0.025 + 0;
			y = 14 * 0.04 + 0;
			w = 2 * 0.025;
			h = 1 * 0.04;
		};
		
		class RscText_1002: client_RscText
		{
			idc = 5776;
			text = "SLOTS"; //--- ToDo: Localize;
			x = 6 * 0.025 + 0;
			y = 0 * 0.04 + 0;
			w = 28 * 0.025;
			h = 3.5 * 0.04;
			sizeEx = 4 * 0.04;
		};
	};
	
	class controls
	{
		class SLOT_1: CLIENT_RscPicture
		{
			idc = 5771;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 4 * 0.025 + 0;
			y = 4 * 0.04 + 0;
			w = 8 * 0.025;
			h = 9 * 0.04;
		};
		class SLOT_2: CLIENT_RscPicture
		{
			idc = 5772;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 16 * 0.025 + 0;
			y = 4 * 0.04 + 0;
			w = 8 * 0.025;
			h = 9 * 0.04;
		};
		class SLOT_3: CLIENT_RscPicture
		{
			idc = 5773;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 28 * 0.025 + 0;
			y = 4 * 0.04 + 0;
			w = 8 * 0.025;
			h = 9 * 0.04;
		};
		
		class Winnings: client_RscText
		{
			idc = 5775;
			test = "";
			x = 18.5 * 0.025 + 0;
			y = 21 * 0.04 + 0;
			w = 7 * 0.025;
			h = 2 * 0.04;
		};
		
		class EXIT_BTN: client_RscButtonMenu
		{
			idc = -1;
			text = "EXIT"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 35.5 * 0.025 + 0;
			y = 0.5 * 0.04 + 0;
			w = 3.5 * 0.025;
			h = 1 * 0.04;
		};
		class BET_5K: client_RscButtonMenu
		{
			idc = 5778;
			text = "100 + FEE"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[100] spawn client_fnc_slotsSpin;";
			x = 5 * 0.025 + 0;
			y = 15 * 0.04 + 0;
			w = 4 * 0.025;
			h = 2 * 0.04;
		};

		class BET_10K: client_RscButtonMenu
		{
			idc = 5782;
			text = "250 + FEE"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[250] spawn client_fnc_slotsSpin;";
			x = 14 * 0.025 + 0;
			y = 15 * 0.04 + 0;
			w = 4 * 0.025;
			h = 2 * 0.04;
		};
		
		class BET_25K: client_RscButtonMenu
		{
			idc = 5781;
			text = "500 + FEE"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[500] spawn client_fnc_slotsSpin;";
			x = 22 * 0.025 + 0;
			y = 15 * 0.04 + 0;
			w = 4 * 0.025;
			h = 2 * 0.04;
		};

		class BET_50K: client_RscButtonMenu
		{
			idc = 5779;
			text = "1000 + FEE"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1000] spawn client_fnc_slotsSpin;";
			x = 31 * 0.025 + 0;
			y = 15 * 0.04 + 0;
			w = 4 * 0.025;
			h = 2 * 0.04;
		};

	};

};


