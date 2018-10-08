

class openMessages {
	idd = 9999;
	name= "openMessages";
	onLoad = "uiNamespace setVariable [""phonemenu"", _this select 0]; [""nobg""] spawn client_fnc_fadephone; ";	
	movingEnable = 0;
	enableSimulation = 1;

	class controls {


		class phoneMain: RscPicture
		{
			idc = 85441;
			text = "\cg_phone\Images\bgblack.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};


		class gohome: RscButtonSilent
		{
			idc = 5989;
			text = "";
			x = 0.45;
			y = 0.82;
			w = 0.1;
			h = 0.1;
			action = "closedialog 0; createdialog ""phoneHUD"" ";
		};

 		class SelectInformationControlsGroup : client_RscControlsGroup {
			x = 0.75; 
			y = 0.183;
			w = 0.312; 
			h = 0.518;
            class controls {
				class SelectInformation: client_RscStructuredText
				{
					idc = 9110;
					type=CT_STRUCTURED_TEXT;
					style=ST_LEFT;
					shadow=0;
					fadein=1;
					fadeout=1;

					font="PuristaLight";
					text = "No message selected.";
					size = 0.035;
					sizeEx = 0.05;
					x = 0;
					y = 0;
					w = 0.312; 
					h = 0.3;
					ColorBackground[] = {0, 0, 0, 0.5};
				};
            };
        };
		class OpenMessages : client_RscListBoxClear
		{
			idc = 9001;
			text = "";
			onLBSelChanged = "[] spawn client_fnc_openMessages; [(findDisplay 9999) displayCtrl 9001] call BIS_fnc_ctrlFitToTextHeight;";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.52;
		};

		class SendSMS : client_RscButtonMenu {
			idc = 1115;
			text = "Send";
			onButtonClick = " [0] spawn client_fnc_phoneSys; ";
			x = 0.37;
			y = 0.75;
			w = 0.1;
			h = 0.05;
		};	

		class ReplySMS : client_RscButtonMenu {
			idc = 1115;
			text = "Reply";
			onButtonClick = " [1] spawn client_fnc_phoneSys; ";
			x = 0.52;
			y = 0.75;
			w = 0.1;
			h = 0.05;
		};	

		class CTRL_PHONE_BG: RscStructuredText
		{    
			idc = 5017;
			text = "";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.635;
			ColorBackground[] = {0, 0, 0, 1};
		}; 


		class phoneglare: RscPicture
		{
			idc = 88889;
			text = "\cg_phone\Images\phoneglare.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};


	};
};





class client_findSMS {
	idd = 1111;
	name= "client_findSMS";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable [""phonemenu"", _this select 0]; [] spawn client_fnc_findPlayersALL; [""nobg""] spawn client_fnc_fadephone;";
	class controls {
		
		class phoneMain: RscPicture
		{
			idc = 85441;
			text = "\cg_phone\Images\bgblack.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};


		class gohome: RscButtonSilent
		{
			idc = 5989;
			text = "";
			x = 0.45;
			y = 0.82;
			w = 0.1;
			h = 0.1;
			action = "closedialog 0; createdialog ""phoneHUD"" ";
		};

		class CraftList : client_RscListBoxClear
		{
			idc = 1113;
			text = "";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.52;
		};

		class MessageText : Client_RscEdit 
		{
			idc = 9331;
			ColorBackground[] = {0, 0, 0, 0.8};
			text = "Enter a Message";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.75; 
			y = 0.183;
			w = 0.312; 
			h = 0.518;
		};

		class HomeOption : client_RscButtonMenu {
			idc = 1115;
			text = "Send";
			onButtonClick = "[0] spawn client_fnc_chooseUserMessage;";
			x = 0.52;
			y = 0.75;
			w = 0.1;
			h = 0.05;
		};	

		class CTRL_PHONE_BG: RscStructuredText
		{    
			idc = 5017;
			text = "";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.635;
			ColorBackground[] = {0, 0, 0, 1};
		}; 

		class phoneglare: RscPicture
		{
			idc = 88889;
			text = "\cg_phone\Images\phoneglare.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};

	};
};




class client_findSMSAnon {
	idd = 1111;
	name= "client_findSMSAnon";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable [""phonemenu"", _this select 0]; [] spawn client_fnc_findPlayersALL; [""nobg""] spawn client_fnc_fadephone;";
	class controls {
		
		class phoneMain: RscPicture
		{
			idc = 85441;
			text = "\cg_phone\Images\bgblack.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};


		class gohome: RscButtonSilent
		{
			idc = 5989;
			text = "";
			x = 0.45;
			y = 0.82;
			w = 0.1;
			h = 0.1;
			action = "closedialog 0; createdialog ""phoneHUD"" ";
		};

		class CraftList : client_RscListBoxClear
		{
			idc = 1113;
			text = "";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.52;
		};

		class MessageText : Client_RscEdit 
		{
			idc = 9331;
			ColorBackground[] = {0, 0, 0, 0.8};
			text = "Enter a Message";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.75; 
			y = 0.183;
			w = 0.312; 
			h = 0.518;
		};

		class HomeOption : client_RscButtonMenu {
			idc = 1115;
			text = "Send";
			onButtonClick = "[1] spawn client_fnc_chooseUserMessage;";
			x = 0.52;
			y = 0.75;
			w = 0.1;
			h = 0.05;
		};	

		class CTRL_PHONE_BG: RscStructuredText
		{    
			idc = 5017;
			text = "";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.635;
			ColorBackground[] = {0, 0, 0, 1};
		}; 

		class phoneglare: RscPicture
		{
			idc = 88889;
			text = "\cg_phone\Images\phoneglare.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};

	};
};


class client_tweet {
	idd = 1111;
	name= "client_tweet";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable [""phonemenu"", _this select 0]; [""nobg""] spawn client_fnc_fadephone;";
	class controls {
		
		class phoneMain: RscPicture
		{
			idc = 85441;
			text = "\cg_phone\Images\bgblack.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};


		class gohome: RscButtonSilent
		{
			idc = 5989;
			text = "";
			x = 0.45;
			y = 0.82;
			w = 0.1;
			h = 0.1;
			action = "closedialog 0; createdialog ""phoneHUD"" ";
		};

		class CraftList : client_RscListBoxClear
		{
			idc = 1113;
			text = "";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.52;
		};

		class MessageText : Client_RscEdit 
		{
			idc = 9331;
			ColorBackground[] = {0, 0, 0, 0.8};
			text = "Enter your Tweet.";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.545;
		};

		class HomeOption : client_RscButtonMenu {
			idc = 1115;
			text = "Tweet";
			onButtonClick = "[] spawn client_fnc_tweetSend;";
			x = 0.52;
			y = 0.75;
			w = 0.1;
			h = 0.05;
		};	

		class phoneglare: RscPicture
		{
			idc = 88889;
			text = "\cg_phone\Images\phoneglare.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};

	};
};



class client_Advertise {
	idd = 1111;
	name= "client_Advertise";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable [""phonemenu"", _this select 0]; [""nobg""] spawn client_fnc_fadephone;";
	class controls {
		
		class phoneMain: RscPicture
		{
			idc = 85441;
			text = "\cg_phone\Images\bgblack.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};


		class gohome: RscButtonSilent
		{
			idc = 5989;
			text = "";
			x = 0.45;
			y = 0.82;
			w = 0.1;
			h = 0.1;
			action = "closedialog 0; createdialog ""phoneHUD"" ";
		};

		class CraftList : client_RscListBoxClear
		{
			idc = 1113;
			text = "";
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.52;
		};

		class MessageText : Client_RscEdit 
		{
			idc = 9331;
			ColorBackground[] = {0, 0, 0, 0.8};
			text = "Enter Advertisement Message, Keep it short and add your name.";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.35;
			y = 0.175;
			w = 0.301;
			h = 0.545;
		};

		class HomeOption : client_RscButtonMenu {
			idc = 1115;
			text = "Send";
			onButtonClick = "[] spawn client_fnc_advertiseSend;";
			x = 0.52;
			y = 0.75;
			w = 0.1;
			h = 0.05;
		};	

		class phoneglare: RscPicture
		{
			idc = 88889;
			text = "\cg_phone\Images\phoneglare.paa";
			style = 2096;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};

	};
};




class client_phoneBET {
	idd = 1111;
	name= "client_phoneBET";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn client_fnc_horseCheckOdds;";
	class controls {
		


		class gohome: RscButtonSilent
		{
			idc = 5989;
			text = "";
			x = 0.45;
			y = 0.82;
			w = 0.1;
			h = 0.1;
			action = "closedialog 0; createdialog ""phoneHUD"" ";
		};

		class horseList : client_RscListBoxClear
		{
			idc = 1113;
			text = "";
			ColorBackground[] = {0, 0, 0, 0.5};
			x = 0.05;
			y = 0.175;
			w = 0.701;
			h = 0.35;
		};

		class MessageText : Client_RscEdit 
		{
			idc = 9331;
			ColorBackground[] = {0, 0, 0, 0.8};
			text = "100";
			autocomplete = "";
			sizeEx = 0.030;
			x = 0.52;
			y = 0.85;
			w = 0.1;
			h = 0.05;
		};

		class HomeOption : client_RscButtonMenu {
			idc = 1115;
			text = "Bet on Place";
			onButtonClick = "[0] spawn client_fnc_horseProcessBet;";
			x = 0.52;
			y = 0.65;
			w = 0.3;
			h = 0.05;
		};	

		class HomeOption2 : client_RscButtonMenu {
			idc = 1116;
			text = "Bet on Win";
			onButtonClick = "[1] spawn client_fnc_horseProcessBet;";
			x = 0.52;
			y = 0.75;
			w = 0.3;
			h = 0.05;
		};	
	};
};