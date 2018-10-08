class mod_shop 
{
	idd = 15000;
	name= "buycar";
	onLoad = "[_this, 'init'] call client_fnc_modShop;";	
	onunload = "[_this, 'exit'] call client_fnc_modShop;";
	movingEnable = 0;
	enableSimulation = 1;

	class controls 
	{
		class BASE
		{    
			shadow = 0;
			type = 0;
			style = 2096;
			sizeEx = 1;
			font = "PuristaMedium";
			colorBackground[] = {};
			colorText[] = {};
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			idc = 191911;
			text = "\np_dialogs1\Images\carMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class RscListbox_Vehicle_Upgrades: client_RscListbox
		{
			idc = 15001;
		    colorText[] = {1, 1, 1, 1};
		    colorActive[] = {0, 0, 0, 0.2};
		    colorTextSelect[] = {1, 1, 1, 0.2};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0.5};	
			x = 0.31 * safezoneW + safezoneX;
			y = 0.162 * safezoneH + safezoneY;
			w = 0.385 * safezoneW;
			h = 0.12 * safezoneH;
			onLBSelChanged = "[_this, 'upgrade'] call client_fnc_modShop;";
		};

		class RscListbox_Colour: RscListbox
		{
			idc = 15002;
		    colorText[] = {1, 1, 1, 1};
		    colorActive[] = {0, 0, 0, 0.2};
		    colorTextSelect[] = {1, 1, 1, 0.2};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0.5};				
			x = 0.307 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.193 * safezoneW;
			h = 0.085 * safezoneH;
			onLBSelChanged = "[_this, 'colour'] call client_fnc_modShop;";
		};

		class RscListbox_Finish: RscListbox
		{
			idc = 15003;
		    colorText[] = {1, 1, 1, 1};
		    colorActive[] = {0, 0, 0, 0.2};
		    colorTextSelect[] = {1, 1, 1, 0.2};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0.5};		
			x = 0.503 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.193 * safezoneW;
			h = 0.085 * safezoneH;
			onLBSelChanged = "[_this, 'finish'] call client_fnc_modShop;";
		};

		class RscListbox_Rims: RscListbox
		{
			idc = 15004;
		    colorText[] = {1, 1, 1, 1};
		    colorActive[] = {0, 0, 0, 0.2};
		    colorTextSelect[] = {1, 1, 1, 0.2};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0.5};		
			x = 0.503 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.193 * safezoneW;
			h = 0.085 * safezoneH;
			onLBSelChanged = "[_this, 'rims'] call client_fnc_modShop;";
		};

		class RscListbox_Tint_Window: client_RscXSliderH
		{
			idc = 15005;
			x = 0.699 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			onSliderPosChanged = "[_this, 'tint'] call client_fnc_modShop;";
		};

		class RscListbox_Tint_Window_Text: client_RscText
		{
			idc = 15006;
			x = 0.699 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			text = "Window Tint";			
		};

		class RscListbox_Tint_Wheel: client_RscXSliderH
		{
			idc = 15007;
			x = 0.895 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			onSliderPosChanged = "[_this, 'tint'] call client_fnc_modShop;";
		};

		class RscListbox_Tint_Window_Text: client_RscText
		{
			idc = 15008;
			x = 0.895 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			text = "Light Tint";		
		};

		class RscButtonMenu_Commit : client_RscButtonMenu 
		{
			idc = 15009;
			text = "Buy Car";
			onButtonClick = "[_this, 'commit'] call client_fnc_modShop;";
			x = 0.85;
			y = 0.95;
			w = 0.15;
			h = 0.05;
		};	
	};
};