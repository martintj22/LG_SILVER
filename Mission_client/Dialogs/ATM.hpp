class ATMGovt
{
	idd = 1015;
	onLoad = "[] spawn client_fnc_findplayersatm;";
	class controls 
	{


		class HideButton
		{
		    colorBorder[] = {0,0,0,0.05};
		    access = 0;
		    type = CT_BUTTON;
		    text = "";
		    colorText[] = {1, 1, 1, 0};
		    colorActive[] = {1, 1, 1, 0};
		    colorTextSelect[] = {1, 1, 1, 0};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0};
		    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 0.05};
		    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
		    colorFocused[] = {0, 0, 0, 0};
		    colorShadow[] = {0, 0, 0, 0};
		    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
		    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
		    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
		    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
		    style = 2;
		    x = 0;
		    y = 0;
		    w = 0.055589;
		    h = 0.039216;
		    shadow = 0;
		    font = "PuristaMedium";
		    sizeEx = 0.02921;
		    offsetX = 0.003;
		    offsetY = 0.003;
		    offsetPressedX = 0.002;
		    offsetPressedY = 0.002;
		    borderSize = 0.01;
		};


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
			text = "\LG_Custom_atm\texture\atmlg.paa";
			x = -0.25;
			y = -0.25;
			w = 1.5;
			h = 1.5;
		}; 
		
		class bank_01 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Bank saldo";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * 0.04444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Kontanter";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Vælg et beløb";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};		


		class RscButton_1600 : HideButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.463125;
			y = safeZoneY + safeZoneH * 0.30333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Hæv penge";
			colorBackground[] = {0.902,0.902,0.902,1};
			colorText[] = {0,0,0,1};
			action = [2] spawn Client_fnc_atmWithdraw;			
		};
		class RscButton_1601 : HideButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Indsæt penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [2] spawn Client_fnc_atmDeposit;
			
		};
		class RscButton_1602 : HideButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.25444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Send penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [2] spawn Client_fnc_atmTransfer;			
		};
		class kRscButton_1603 : HideButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.57625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02333334;
			text = "Luk atm";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			action = "closedialog 0";
			
		};
		class RscText_1004 : RscText 
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.341875;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.461875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorSelection[] = {1,0,0,1};
			
		};
		class PlayerListCombo : RscCombo 
		{
			idc = 1111;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02777778;
			sizeEx = 0.05;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class RscText_1002 : RscText 
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.34125;
			y = safeZoneY + safeZoneH * 0.25888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			
		};


	};
};

class ATMmafia
{
	idd = 1015;
	onLoad = "[] spawn client_fnc_findplayersatm;";
	class controls 
	{


	class HideButton
		{
		    colorBorder[] = {0,0,0,0.05};
		    access = 0;
		    type = CT_BUTTON;
		    text = "";
		    colorText[] = {1, 1, 1, 0};
		    colorActive[] = {1, 1, 1, 0};
		    colorTextSelect[] = {1, 1, 1, 0};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0};
		    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 0.05};
		    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
		    colorFocused[] = {0, 0, 0, 0};
		    colorShadow[] = {0, 0, 0, 0};
		    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
		    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
		    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
		    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
		    style = 2;
		    x = 0;
		    y = 0;
		    w = 0.055589;
		    h = 0.039216;
		    shadow = 0;
		    font = "PuristaMedium";
		    sizeEx = 0.02921;
		    offsetX = 0.003;
		    offsetY = 0.003;
		    offsetPressedX = 0.002;
		    offsetPressedY = 0.002;
		    borderSize = 0.01;
		};


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
			text = "\LG_Custom_atm\texture\atmlg.paa";
			x = -0.25;
			y = -0.25;
			w = 1.5;
			h = 1.5;
		}; 
		
		class bank_01 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Bank saldo";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * 0.04444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Kontanter";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Vælg et beløb";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};		


		class RscButton_1600 : HideButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.463125;
			y = safeZoneY + safeZoneH * 0.30333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Hæv penge";
			colorBackground[] = {0.902,0.902,0.902,1};
			colorText[] = {0,0,0,1};
			action = [1] spawn Client_fnc_atmWithdraw;			
		};
		class RscButton_1601 : HideButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Indsæt penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [1] spawn Client_fnc_atmDeposit;
			
		};
		class RscButton_1602 : HideButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.25444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Send penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [1] spawn Client_fnc_atmTransfer;			
		};
		class kRscButton_1603 : HideButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.57625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02333334;
			text = "Luk atm";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			action = "closedialog 0";
			
		};
		class RscText_1004 : RscText 
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.341875;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.461875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorSelection[] = {1,0,0,1};
			
		};
		class PlayerListCombo : RscCombo 
		{
			idc = 1111;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02777778;
			sizeEx = 0.05;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class RscText_1002 : RscText 
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.34125;
			y = safeZoneY + safeZoneH * 0.25888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			
		};


	};
};

class ATMbiker
{
	idd = 1015;
	onLoad = "[] spawn client_fnc_findplayersatm;";
	class controls 
	{


		class HideButton
		{
		    colorBorder[] = {0,0,0,0.05};
		    access = 0;
		    type = CT_BUTTON;
		    text = "";
		    colorText[] = {1, 1, 1, 0};
		    colorActive[] = {1, 1, 1, 0};
		    colorTextSelect[] = {1, 1, 1, 0};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0};
		    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 0.05};
		    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
		    colorFocused[] = {0, 0, 0, 0};
		    colorShadow[] = {0, 0, 0, 0};
		    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
		    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
		    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
		    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
		    style = 2;
		    x = 0;
		    y = 0;
		    w = 0.055589;
		    h = 0.039216;
		    shadow = 0;
		    font = "PuristaMedium";
		    sizeEx = 0.02921;
		    offsetX = 0.003;
		    offsetY = 0.003;
		    offsetPressedX = 0.002;
		    offsetPressedY = 0.002;
		    borderSize = 0.01;
		};


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
			text = "\LG_Custom_atm\texture\atmlg.paa";
			x = -0.25;
			y = -0.25;
			w = 1.5;
			h = 1.5;
		}; 
		
		class bank_01 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Bank saldo";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * 0.04444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Kontanter";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Vælg et beløb";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};		


		class RscButton_1600 : HideButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.463125;
			y = safeZoneY + safeZoneH * 0.30333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Hæv penge";
			colorBackground[] = {0.902,0.902,0.902,1};
			colorText[] = {0,0,0,1};
			action = [3] spawn Client_fnc_atmWithdraw;			
		};
		class RscButton_1601 : HideButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Indsæt penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [3] spawn Client_fnc_atmDeposit;
			
		};
		class RscButton_1602 : HideButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.25444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Send penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [3] spawn Client_fnc_atmTransfer;			
		};
		class kRscButton_1603 : HideButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.57625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02333334;
			text = "Luk atm";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			action = "closedialog 0";
			
		};
		class RscText_1004 : RscText 
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.341875;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.461875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorSelection[] = {1,0,0,1};
			
		};
		class PlayerListCombo : RscCombo 
		{
			idc = 1111;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02777778;
			sizeEx = 0.05;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class RscText_1002 : RscText 
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.34125;
			y = safeZoneY + safeZoneH * 0.25888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			
		};


	};
};

class ATMMobster
{
	idd = 1015;
	onLoad = "[] spawn client_fnc_findplayersatm;";
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
			text = "\LG_Custom_atm\texture\atmlg.paa";
			x = -0.25;
			y = -0.25;
			w = 1.5;
			h = 1.5;
		}; 
		
		class bank_01 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Bank saldo";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * 0.04444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Kontanter";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Vælg et beløb";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};		

			class HideButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.27375;
			y = safeZoneY + safeZoneH * 0.17444445;
			w = safeZoneW * 0.023125;
			h = safeZoneH * 0.02111112;
			style = 2;
			text = "";
			borderSize = 0.01;
			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.05};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBorder[] = {0,0,0,0.05};
			colorDisabled[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,0};
			font = "PuristaMedium";
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			offsetX = 0.003;
			offsetY = 0.003;
			sizeEx = 0.02921;
			soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1.0};
			soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1.0};
			soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1.0};
			soundPush[] = {"\ca\ui\data\sound\new1",0.0,0.0};
			access = 0;
			shadow = 0;
			
		};
		class RscButton_1600 : HideButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.463125;
			y = safeZoneY + safeZoneH * 0.30333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Hæv penge";
			colorBackground[] = {0.902,0.902,0.902,1};
			colorText[] = {0,0,0,1};
			action = [5] spawn Client_fnc_atmWithdraw;			
		};
		class RscButton_1601 : HideButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Indsæt penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [5] spawn Client_fnc_atmDeposit;
			
		};
		class RscButton_1602 : HideButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.25444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Send penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [5] spawn Client_fnc_atmTransfer;			
		};
		class kRscButton_1603 : HideButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.57625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02333334;
			text = "Luk atm";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			action = "closedialog 0";
			
		};
		class RscText_1004 : RscText 
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.341875;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.461875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorSelection[] = {1,0,0,1};
			
		};
		class PlayerListCombo : RscCombo 
		{
			idc = 1111;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02777778;
			sizeEx = 0.05;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class RscText_1002 : RscText 
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.34125;
			y = safeZoneY + safeZoneH * 0.25888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			
		};


	};
};

class CasinoVault
{
	idd = 1015;
	onLoad = "[] spawn client_fnc_findplayersatm;";
	class controls 
	{


		class HideButton
		{
		    colorBorder[] = {0,0,0,0.05};
		    access = 0;
		    type = CT_BUTTON;
		    text = "";
		    colorText[] = {1, 1, 1, 0};
		    colorActive[] = {1, 1, 1, 0};
		    colorTextSelect[] = {1, 1, 1, 0};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0};
		    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 0.05};
		    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
		    colorFocused[] = {0, 0, 0, 0};
		    colorShadow[] = {0, 0, 0, 0};
		    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
		    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
		    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
		    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
		    style = 2;
		    x = 0;
		    y = 0;
		    w = 0.055589;
		    h = 0.039216;
		    shadow = 0;
		    font = "PuristaMedium";
		    sizeEx = 0.02921;
		    offsetX = 0.003;
		    offsetY = 0.003;
		    offsetPressedX = 0.002;
		    offsetPressedY = 0.002;
		    borderSize = 0.01;
		};


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
			text = "\LG_Custom_atm\texture\atmlg.paa";
			x = -0.25;
			y = -0.25;
			w = 1.5;
			h = 1.5;
		}; 
		
		class bank_01 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Bank saldo";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * 0.04444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Kontanter";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Vælg et beløb";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};		

	
		class RscButton_1600 : HideButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.463125;
			y = safeZoneY + safeZoneH * 0.30333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Hæv penge";
			colorBackground[] = {0.902,0.902,0.902,1};
			colorText[] = {0,0,0,1};
			action = [4] spawn Client_fnc_atmWithdraw;			
		};
		class RscButton_1601 : HideButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Indsæt penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [4] spawn Client_fnc_atmDeposit;
			
		};
		class RscButton_1602 : HideButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.25444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Send penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [4] spawn Client_fnc_atmTransfer;			
		};
		class kRscButton_1603 : HideButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.57625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02333334;
			text = "Luk atm";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			action = "closedialog 0";
			
		};
		class RscText_1004 : RscText 
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.341875;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.461875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorSelection[] = {1,0,0,1};
			
		};
		class PlayerListCombo : RscCombo 
		{
			idc = 1111;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02777778;
			sizeEx = 0.05;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class RscText_1002 : RscText 
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.34125;
			y = safeZoneY + safeZoneH * 0.25888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			
		};


	};
};


class ATM
{
	idd = 1015;
	onLoad = "[] spawn client_fnc_findplayersatm;";
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
			text = "\LG_Custom_atm\texture\atmlg.paa";
			x = -0.25;
			y = -0.25;
			w = 1.5;
			h = 1.5;
		}; 
		
		class bank_01 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Bank saldo";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * 0.04444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Kontanter";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Vælg et beløb";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};		

			class HideButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.27375;
			y = safeZoneY + safeZoneH * 0.17444445;
			w = safeZoneW * 0.023125;
			h = safeZoneH * 0.02111112;
			style = 2;
			text = "";
			borderSize = 0.01;
			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.05};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBorder[] = {0,0,0,0.05};
			colorDisabled[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,0};
			font = "PuristaMedium";
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			offsetX = 0.003;
			offsetY = 0.003;
			sizeEx = 0.02921;
			soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1.0};
			soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1.0};
			soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1.0};
			soundPush[] = {"\ca\ui\data\sound\new1",0.0,0.0};
			access = 0;
			shadow = 0;
			
		};
		class RscButton_1600 : HideButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.463125;
			y = safeZoneY + safeZoneH * 0.30333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Hæv penge";
			colorBackground[] = {0.902,0.902,0.902,1};
			colorText[] = {0,0,0,1};
			action = [0] spawn Client_fnc_atmWithdraw;			
		};
		class RscButton_1601 : HideButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Indsæt penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [0] spawn Client_fnc_atmDeposit;
			
		};
		class RscButton_1602 : HideButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.25444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Send penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [0] spawn Client_fnc_atmTransfer;			
		};
		class kRscButton_1603 : HideButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.57625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02333334;
			text = "Luk atm";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			action = "closedialog 0";
			
		};
		class RscText_1004 : RscText 
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.341875;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.461875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorSelection[] = {1,0,0,1};
			
		};
		class PlayerListCombo : RscCombo 
		{
			idc = 1111;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02777778;
			sizeEx = 0.05;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class RscText_1002 : RscText 
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.34125;
			y = safeZoneY + safeZoneH * 0.25888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			
		};


	};
};


class DirtyMoney
{
	idd = 1015;
	onLoad = "[] spawn client_fnc_findplayersatm;";
	class controls 
	{


		class HideButton
		{
		    colorBorder[] = {0,0,0,0.05};
		    access = 0;
		    type = CT_BUTTON;
		    text = "";
		    colorText[] = {1, 1, 1, 0};
		    colorActive[] = {1, 1, 1, 0};
		    colorTextSelect[] = {1, 1, 1, 0};
		    colorDisabled[] = {1, 1, 1, 0};
		    colorBackground[] = {0, 0, 0, 0};
		    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 0.05};
		    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
		    colorFocused[] = {0, 0, 0, 0};
		    colorShadow[] = {0, 0, 0, 0};
		    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
		    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
		    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
		    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
		    style = 2;
		    x = 0;
		    y = 0;
		    w = 0.055589;
		    h = 0.039216;
		    shadow = 0;
		    font = "PuristaMedium";
		    sizeEx = 0.02921;
		    offsetX = 0.003;
		    offsetY = 0.003;
		    offsetPressedX = 0.002;
		    offsetPressedY = 0.002;
		    borderSize = 0.01;
		};


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
			text = "\LG_Custom_atm\texture\atmlg.paa";
			x = -0.25;
			y = -0.25;
			w = 1.5;
			h = 1.5;
		}; 
		
		class bank_01 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Bank saldo";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.33375;
			y = safeZoneY + safeZoneH * 0.04444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Kontanter";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};
		class bank_01_copy1_copy1 : RscText 
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * -0.03555555;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "Vælg et beløb";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			shadow = 2;
			
		};		

			
		class RscButton_1600 : HideButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.463125;
			y = safeZoneY + safeZoneH * 0.30333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Hæv penge";
			colorBackground[] = {0.902,0.902,0.902,1};
			colorText[] = {0,0,0,1};
			action = [6] spawn Client_fnc_atmWithdraw;			
		};
		class RscButton_1601 : HideButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Indsæt penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [6] spawn Client_fnc_atmDeposit;
			
		};
		class RscButton_1602 : HideButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.25444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "Send penge";
			colorBackground[] = {0.8,0.8,0.8,1};
			colorText[] = {0,0,0,1};
			action = [6] spawn Client_fnc_atmTransfer;			
		};
		class kRscButton_1603 : HideButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.57625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02333334;
			text = "Luk atm";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			action = "closedialog 0";
			
		};
		class RscText_1004 : RscText 
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.341875;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.461875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03333334;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorSelection[] = {1,0,0,1};
			
		};
		class PlayerListCombo : RscCombo 
		{
			idc = 1111;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.02777778;
			sizeEx = 0.05;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class RscText_1002 : RscText 
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.34125;
			y = safeZoneY + safeZoneH * 0.25888889;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.04333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			
		};


	};
};