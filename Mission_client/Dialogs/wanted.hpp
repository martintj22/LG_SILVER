
class yn_Menu {

	idd = 9999;
	name= "yn_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controls {

		class QuestionToAsk : client_RscStructuredText
		{
			type = 13;
			style = 0;
			text = "You have been summoned for Jury Duty - do you wish to accept? Payment is $2000.";
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1, 1, 1, 1.0};
			colorBackground[]={0,0,0,0.5};
			
			class Attributes {
				font = "PuristaMedium";
				color = "#ffffff";
				align = "center";
				shadow = 1;
			};			

			idc = 9339;
			sizeEx = 0.030;
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.456074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.047851 * safezoneH;

		};

		class YESOption : RSCButton {

			idc = 9995;
			text = "YES";
			onButtonClick = "closedialog 0; JuryDuty = true;"; 
			x = 0.40029 * safezoneW + safezoneX;
			y = 0.706497 * safezoneH + safezoneY;
			w = 0.0867957 * safezoneW;
			h = 0.0461907 * safezoneH;

		};	

		class noOption : RSCButton {

			idc = 9996;
			text = "NO";
			onButtonClick = "closedialog 0; JuryDuty = false;";
			x = 0.511518 * safezoneW + safezoneX;
			y = 0.706043 * safezoneH + safezoneY;
			w = 0.0878542 * safezoneW;
			h = 0.0461907 * safezoneH;

		};	

	};

};



class licenseCheck {
	idd = 9999;
	name= "licenseCheck";
	movingEnable = 0;
	enableSimulation = 1;

	class controls {

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
			text = "\np_dialogs1\Images\licenseCheck.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  


		class QuantityText : Client_RscEdit 
		{
			idc = 9339;
			text = "1";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.453178 * safezoneW + safezoneX;
			y = 0.656167 * safezoneH + safezoneY;
			w = 0.103332 * safezoneW;
			h = 0.0307935 * safezoneH;
		};

		class PurchaseOption : RSCButton {
			idc = 9995;
			text = "Search";
			onButtonClick = "[] spawn client_fnc_searchLicense;"; 
			x = 0.40029 * safezoneW + safezoneX;
			y = 0.706497 * safezoneH + safezoneY;
			w = 0.0867957 * safezoneW;
			h = 0.0461907 * safezoneH;
		};	

		class CloseOption : RSCButton {
			idc = 9996;
			text = "Close";
			onButtonClick = "closedialog 0;";
			x = 0.511518 * safezoneW + safezoneX;
			y = 0.706043 * safezoneH + safezoneY;
			w = 0.0878542 * safezoneW;
			h = 0.0461907 * safezoneH;
		};	
	};
};




class wanted {
	idd = 5111;
	name= "wanted";
	onLoad = "[player,1] remoteExec [""Server_fnc_wantedList"",2];";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {


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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class wanted : client_RscListBoxClear
		{
			idc = 911;
			text = "";
			onLBSelChanged = "[] spawn client_fnc_wantedinformationupdate; ";
			x = 0.306125 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.1815 * safezoneW;
			h = 0.341581 * safezoneH;
			ColorBackground[] = {0, 0, 0, 0.5};
		};
 		class SelectInformationControlsGroup : client_RscControlsGroup {
			x = 0.506084 * safezoneW + safezoneX;
			y = 0.30002 * safezoneH + safezoneY;
			w = 0.178406 * safezoneW;
			h = 0.242 * safezoneH;
            class controls {
				class SelectInformation: client_RscStructuredText
				{
					idc = 1119;
					type=CT_STRUCTURED_TEXT;
					style=ST_LEFT;
					shadow=0;
					fadein=1;
					fadeout=1;

					font="PuristaLight";
					text = "No crime selected.";
					size = 0.035;
					sizeEx = 0.05;
					x = 0;
					y = 0;
					w = 0.178406 * safezoneW;
					h = 0.3;
				};
            };
        };
		class PLAYERTOADD :  client_RscListBoxClear
		{
			idc = 1120;
			text = "";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.55962 * safezoneH + safezoneY;
			w = 0.1815 * safezoneW;
			h = 0.044926 * safezoneH;
		};

		class APB : client_RscButtonMenu {
			idc = 1400;
			text = "Create APB";
			onButtonClick = "[] spawn client_fnc_addAPB;";
			x = 0.406091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LicCheck : client_RscButtonMenu {
			idc = 1120;
			text = "Licenses";
			onButtonClick = "[] spawn client_fnc_licensecheck;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};		

		class RaidShop : client_RscButtonMenu {
			idc = 1121;
			text = "Search Shop";
			onButtonClick = "[] spawn client_fnc_raidshop;";
			x = 0.606091 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LookupCrimes : client_RscButtonMenu {
			idc = 1005;
			text = "Lookup Crimes";
			onButtonClick = "[] spawn client_fnc_wantedUser;";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	


		class Update : client_RscButtonMenu {
			idc = 1115;
			text = "Archive Crime";
			onButtonClick = "[] call client_fnc_wantedRemove; closedialog 0;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class INSERT : client_RscButtonMenu {
			idc = 1116;
			text = "Warrant";
			onButtonClick = "[] spawn client_fnc_wantedredirect;";
			x = 0.606091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class refresh : client_RscButtonMenu {
			idc = 1119;
			text = "Refresh Active";
			onButtonClick = "[player,1] remoteExec [""Server_fnc_wantedList"",2];";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class checkwanted : client_RscButtonMenu {
			idc = 1154;
			text = "Wanted Status";
			onButtonClick = "[] spawn client_fnc_checkwanted;";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.73892 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class Evidence : client_RscButtonMenu { 
			idc = 1117;
			text = "Search Home";
			onButtonClick = "[] spawn client_fnc_raidhouse;";
			x = 0.406091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LoadOld : client_RscButtonMenu {
			idc = 1118;
			text = "Past Crimes";
			onButtonClick = "[player,0] remoteExec [""Server_fnc_wantedList"",2];";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LicenseCheck : client_RscButtonMenu {
			idc = 1119;
			text = "Plate";
			onButtonClick = "closedialog 0; createdialog ""licenseCheck""; ";
			x = 0.606091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};

		class ViewHome : client_RscButtonMenu { 
			idc = 1145;
			text = "View Home";
			onButtonClick = "[] spawn client_fnc_viewhouse;";
			x = 0.406091 * safezoneW + safezoneX;
			y = 0.73892 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class ViewShop : client_RscButtonMenu { 
			idc = 1146;
			text = "View Shop";
			onButtonClick = "[] spawn client_fnc_viewshop;";
			x = 0.506084 * safezoneW + safezoneX;
			y = 0.73892 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};		

		class ViewOffice : client_RscButtonMenu { 
			idc = 1147;
			text = "View Office";
			onButtonClick = "[] spawn client_fnc_viewoffice;";
			x = 0.6061161 * safezoneW + safezoneX;
			y = 0.73892 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};		


	};
};


class wanted2 {
	idd = 5111;
	name= "wanted2";
	onLoad = "[player,1] remoteExec [""Server_fnc_wantedList"",2];";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {


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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class wanted : client_RscListBoxClear
		{
			idc = 911;
			text = "";
			onLBSelChanged = "[] spawn client_fnc_wantedinformationupdate;";
			x = 0.306125 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.1815 * safezoneW;
			h = 0.341581 * safezoneH;
			ColorBackground[] = {0, 0, 0, 0.5};
		};
 		class SelectInformationControlsGroup : client_RscControlsGroup {
			x = 0.506084 * safezoneW + safezoneX;
			y = 0.30002 * safezoneH + safezoneY;
			w = 0.178406 * safezoneW;
			h = 0.242 * safezoneH;
            class controls {
				class SelectInformation: client_RscStructuredText
				{
					idc = 1119;
					type=CT_STRUCTURED_TEXT;
					style=ST_LEFT;
					shadow=0;
					fadein=1;
					fadeout=1;

					font="PuristaLight";
					text = "No crime selected.";
					size = 0.035;
					sizeEx = 0.05;
					x = 0;
					y = 0;
					w = 0.178406 * safezoneW;
					h = 0.3;
				};
            };
        };
		class PLAYERTOADD :  client_RscListBoxClear
		{
			idc = 1120;
			text = "";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.55962 * safezoneH + safezoneY;
			w = 0.1815 * safezoneW;
			h = 0.044926 * safezoneH;
		};

		class LookupCrimes : client_RscButtonMenu {
			idc = 1005;
			text = "Lookup Crimes";
			onButtonClick = "[] spawn client_fnc_wantedUser;";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class refresh : client_RscButtonMenu {
			idc = 1119;
			text = "Refresh Active";
			onButtonClick = "[player,1] remoteExec [""Server_fnc_wantedList"",2];";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class PayTicket : client_RscButtonMenu {
			idc = 1115;
			text = "Pay Ticket";
			onButtonClick = "[] call client_fnc_ticketResult; ";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LoadOld : client_RscButtonMenu {
			idc = 1118;
			text = "Past Crimes";
			onButtonClick = "[player,0] remoteExec [""Server_fnc_wantedList"",2];";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

	};
};


class wanted3 { //  judges
	idd = 5111;
	name= "wanted3";
	onLoad = "[player,1] remoteExec [""Server_fnc_wantedList"",2];";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {


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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class wanted : client_RscListBoxClear
		{
			idc = 911;
			text = "";
			onLBSelChanged = "[] spawn client_fnc_wantedinformationupdate;";
			x = 0.306125 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.1815 * safezoneW;
			h = 0.341581 * safezoneH;
			ColorBackground[] = {0, 0, 0, 0.5};
		};

 		class SelectInformationControlsGroup : client_RscControlsGroup {
			x = 0.506084 * safezoneW + safezoneX;
			y = 0.30002 * safezoneH + safezoneY;
			w = 0.178406 * safezoneW;
			h = 0.242 * safezoneH;
            class controls {
				class SelectInformation: client_RscStructuredText
				{
					idc = 1119;
					type=CT_STRUCTURED_TEXT;
					style=ST_LEFT;
					shadow=0;
					fadein=1;
					fadeout=1;

					font="PuristaLight";
					text = "No crime selected.";
					size = 0.035;
					sizeEx = 0.05;
					x = 0;
					y = 0;
					w = 0.178406 * safezoneW;
					h = 0.3;
				};
            };
        };

		class PLAYERTOADD :  client_RscListBoxClear
		{
			idc = 1120;
			text = "";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.55962 * safezoneH + safezoneY;
			w = 0.1815 * safezoneW;
			h = 0.044926 * safezoneH;
		};

		class WARRANT : client_RscButtonMenu {
			idc = 1117;
			text = "Warrant";
			onButtonClick = "[] spawn client_fnc_wantedredirect;";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.73892 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LicCheck : client_RscButtonMenu {
			idc = 1120;
			text = "License Check";
			onButtonClick = "[] spawn client_fnc_licensecheck;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};		

		class LookupCrimes : client_RscButtonMenu {
			idc = 1005;
			text = "Lookup Crimes";
			onButtonClick = "[] spawn client_fnc_wantedUser;";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	


		class Update : client_RscButtonMenu {
			idc = 1115;
			text = "Archive Crime";
			onButtonClick = "[] call client_fnc_wantedRemove; closedialog 0;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class INSERT : client_RscButtonMenu {
			idc = 1116;
			text = "Approve";
			onButtonClick = "[] spawn client_fnc_acceptWarrant;";
			x = 0.606091 * safezoneW + safezoneX;
			y = 0.663346 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class refresh : client_RscButtonMenu {
			idc = 1119;
			text = "Refresh Active";
			onButtonClick = "[player,1] remoteExec [""Server_fnc_wantedList"",2];";
			x = 0.306091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LoadOld : client_RscButtonMenu {
			idc = 1118;
			text = "Past Crimes";
			onButtonClick = "[player,0] remoteExec [""Server_fnc_wantedList"",2];";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

		class LicenseCheck : client_RscButtonMenu {
			idc = 1119;
			text = "Plate Check";
			onButtonClick = "closedialog 0; createdialog ""licenseCheck""; ";
			x = 0.606091 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.05;
		};	

	};
};


class insertCriminal { // cops and da - arrest warrant
	idd = 5111;
	name= "insertCriminal";
	onLoad = "[] spawn client_fnc_loadwantedProcessing;";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {

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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class charges : Client_RscEdit 
		{
			idc = 1116;
			text = "Enter the charges.";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.517817 * safezoneW + safezoneX;
			y = 0.28933 * safezoneH + safezoneY;
			w = 0.164036 * safezoneW;
			h = 0.391581 * safezoneH;
		};

		class Process : client_RscButtonMenu {
			idc = 1117;
			text = "Process";
			onButtonClick = "[0] call client_fnc_wantedAdd;";
			x = 0.401967 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	

		class CloseDialog : client_RscButtonMenu {
			idc = 1118;
			text = "Close";
			onButtonClick = "CLOSEDIALOG 0;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	
	};
};


class insertPBA { // cops and da - arrest warrant
	idd = 5111;
	name= "insertPBA";
	onLoad = "";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {

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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class charges : Client_RscEdit 
		{
			idc = 1116;
			text = "This is an official court document. You have to describe the events leading up to the arrest of this person. Do not include the charges. You have to be brief and descriptive. Failure to abide by the correct format will lead to disciplinary action as well the denial of the arrest and conviction of the suspect.";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.517817 * safezoneW + safezoneX;
			y = 0.28933 * safezoneH + safezoneY;
			w = 0.164036 * safezoneW;
			h = 0.391581 * safezoneH;
		};

		class Process : client_RscButtonMenu {
			idc = 1117;
			text = "Submit";
			onButtonClick = "[4] call client_fnc_wantedAdd;";
			x = 0.401967 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	

		class CloseDialog : client_RscButtonMenu {
			idc = 1118;
			text = "Close";
			onButtonClick = "CLOSEDIALOG 0;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	
	};
};


class insertAPB { // cops
	idd = 5111;
	name= "insertAPB";
	onLoad = "[] spawn client_fnc_loadwantedProcessing;";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {

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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class charges : Client_RscEdit 
		{
			idc = 1116;
			text = "Be on the lookout for ";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.517817 * safezoneW + safezoneX;
			y = 0.28933 * safezoneH + safezoneY;
			w = 0.164036 * safezoneW;
			h = 0.391581 * safezoneH;
		};

		class Process : client_RscButtonMenu {
			idc = 1117;
			text = "Process";
			onButtonClick = "[1] call client_fnc_wantedAdd;";
			x = 0.401967 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	

		class CloseDialog : client_RscButtonMenu {
			idc = 1118;
			text = "Close";
			onButtonClick = "CLOSEDIALOG 0;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	
	};
};



class insertSearchHouse { // cops and da - arrest warrant
	idd = 5111;
	name= "insertSearchHouse";
	onLoad = "[] spawn client_fnc_loadwantedProcessing;";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {

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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class charges : Client_RscEdit 
		{
			idc = 1116;
			text = "Enter reason for Search and Seizure Warrant of person's house.";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.517817 * safezoneW + safezoneX;
			y = 0.28933 * safezoneH + safezoneY;
			w = 0.164036 * safezoneW;
			h = 0.391581 * safezoneH;
		};

		class Process : client_RscButtonMenu {
			idc = 1117;
			text = "Process";
			onButtonClick = "[2] call client_fnc_wantedAdd;";
			x = 0.401967 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	

		class CloseDialog : client_RscButtonMenu {
			idc = 1118;
			text = "Close";
			onButtonClick = "CLOSEDIALOG 0;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	
	};
};



class insertSearchShop { // cops and da - arrest warrant
	idd = 5111;
	name= "insertSearchShop";
	onLoad = "[] spawn client_fnc_loadwantedProcessing;";	
	movingEnable = 0;
	enableSimulation = 1;
	class controls {

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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  

		class charges : Client_RscEdit 
		{
			idc = 1116;
			text = "Enter reason for Search and Seizure Warrant of person's shop.";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.517817 * safezoneW + safezoneX;
			y = 0.28933 * safezoneH + safezoneY;
			w = 0.164036 * safezoneW;
			h = 0.391581 * safezoneH;
		};

		class Process : client_RscButtonMenu {
			idc = 1117;
			text = "Process";
			onButtonClick = "[3] call client_fnc_wantedAdd;";
			x = 0.401967 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	

		class CloseDialog : client_RscButtonMenu {
			idc = 1118;
			text = "Close";
			onButtonClick = "CLOSEDIALOG 0;";
			x = 0.506091 * safezoneW + safezoneX;
			y = 0.703346 * safezoneH + safezoneY;
			w = 0.0899712 * safezoneW;
			h = 0.0483903 * safezoneH;
		};	
	};
};


















class revoke_Menu {
	idd = 9999;
	name= "revoke_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controls {


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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  


		class HideButton
		{
		    colorBorder[] = {0,0,0,0.35};
		    access = 0;
		    type = CT_BUTTON;
		    text = "";
		    colorText[] = {1, 1, 1, 0.7};
		    colorActive[] = {1, 1, 1, 0.7};
		    colorTextSelect[] = {1, 1, 1, 0.7};
		    colorDisabled[] = {1, 1, 1, 0.7};
		    colorBackground[] = {0, 0, 0, 0.6};
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

		class LicenseList : client_RscListBox 
		{
			idc = 9001;
			text = "";
			onLBSelChanged = "";
			x = 0.311121 * safezoneW + safezoneX;
			y = 0.293241 * safezoneH + safezoneY;
			w = 0.178 * safezoneW;
			h = 0.343181 * safezoneH;
		};

		class RemoveOption : HideButton {
			idc = 9995;
			text = "Revoke";
			onButtonClick = "[] spawn client_fnc_revoke;";
			x = 0.40229 * safezoneW + safezoneX;
			y = 0.659497 * safezoneH + safezoneY;
			w = 0.0878542 * safezoneW;
			h = 0.023 * safezoneH;
		};

		class CloseOption : HideButton {
			idc = 9996;
			text = "Close";
			onButtonClick = "closedialog 0;";
			x = 0.40229 * safezoneW + safezoneX;
			y = 0.679497 * safezoneH + safezoneY;
			w = 0.0878542 * safezoneW;
			h = 0.023 * safezoneH;
		};
	};
};




class giveCert_Menu {
	idd = 9999; 
	name= "giveCert_Menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controls {


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
			text = "\np_dialogs1\Images\wantedMenu.paa";
			x = 0.275605 * safezoneW + safezoneX;
			y = 0.126074 * safezoneH + safezoneY;
			w = 0.447732 * safezoneW;
			h = 0.747851 * safezoneH;
		};  


		class HideButton
		{
		    colorBorder[] = {0,0,0,0.35};
		    access = 0;
		    type = CT_BUTTON;
		    text = "";
		    colorText[] = {1, 1, 1, 0.7};
		    colorActive[] = {1, 1, 1, 0.7};
		    colorTextSelect[] = {1, 1, 1, 0.7};
		    colorDisabled[] = {1, 1, 1, 0.7};
		    colorBackground[] = {0, 0, 0, 0.6};
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

		class LicenseList : client_RscListBox 
		{
			idc = 9001;
			text = "";
			onLBSelChanged = "";
			x = 0.311121 * safezoneW + safezoneX;
			y = 0.293241 * safezoneH + safezoneY;
			w = 0.178 * safezoneW;
			h = 0.343181 * safezoneH;
		};

		class RemoveOption : HideButton {
			idc = 9995;
			text = "Grant";
			onButtonClick = "[] spawn client_fnc_grant;";
			x = 0.40229 * safezoneW + safezoneX;
			y = 0.659497 * safezoneH + safezoneY;
			w = 0.0878542 * safezoneW;
			h = 0.023 * safezoneH;
		};

		class CloseOption : HideButton {
			idc = 9996;
			text = "Close";
			onButtonClick = "closedialog 0;";
			x = 0.40229 * safezoneW + safezoneX;
			y = 0.679497 * safezoneH + safezoneY;
			w = 0.0878542 * safezoneW;
			h = 0.023 * safezoneH;
		};
	};
};



