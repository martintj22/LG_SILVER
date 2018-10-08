//	[_location,_sender,_jobType,_message] remoteExec ["client_fnc_mailSystem",_player];
if(myjob != "none" && myjob != "mail") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };



myjob = "mail";
[] call client_fnc_hudwork;
private ["_warning","_JobBase","_housing"];




if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		taskrunning = true;
		_housing = ["Land_Nopixel_mailbox","Land_HouseDoubleAL","Land_HouseDoubleAL2","Land_Ranch_DED_Ranch_02_F","Land_Ranch_DED_Ranch_01_F","Land_HouseC_R","Land_HouseC1_L","Land_HouseA1_L","Land_HouseB1_L","Land_buildingCommercial1","Land_buildingCommercial2","Land_ivory_trailer_04","Land_ivory_trailer_01","Land_ivory_trailer_02","Land_ivory_trailer_03","Land_ivory_trailer_06","Land_ivory_trailer_05"];
		_randombuildings = nearestobjects [player,_housing,7000];
		_warnings = 0;
		_totaljobs = 0;
		uisleep 30;
		while{taskrunning && myjob == "mail"} do {
			uisleep 5;
			if(playertasks isequalto []) then {
				_totaljobs = _totaljobs + 1;
				if(_totaljobs > 10) then {
					_housing = ["Land_Nopixel_mailbox","Land_HouseDoubleAL","Land_HouseDoubleAL2","Land_Ranch_DED_Ranch_02_F","Land_Ranch_DED_Ranch_01_F","Land_HouseC_R","Land_HouseC1_L","Land_HouseA1_L","Land_HouseB1_L","Land_buildingCommercial1","Land_buildingCommercial2","Land_ivory_trailer_04","Land_ivory_trailer_01","Land_ivory_trailer_02","Land_ivory_trailer_03","Land_ivory_trailer_06","Land_ivory_trailer_05"];
					_randombuildings = nearestobjects [player,_housing,7000];
					_totaljobs = 0;
				};
				_randomlocation = _randombuildings call BIS_fnc_selectRandom;
				[getpos _randomlocation,"null","Automated Delivery","null"] spawn client_fnc_mailSystem;	

				if(_warnings > 10) then { 
					taskrunning = false; 
					["You have been laid off from your job!", true] spawn domsg; 
				};
				uisleep 3;
			} else {

				if(_warnings > 10) then { 
					taskrunning = false; 
					["You have been laid off from your job!", true] spawn domsg; 
				};


				if(vehspawned != vehicle player && player distance vehspawned > 20) then { _warnings = _warnings + 1; };
				if(isNull vehspawned) then { _warnings = _warnings + 1; };

				if(player distance ((playertasks select 0) select 0) < 15) then {
					["You successfully finished that job!", true] spawn domsg;


					["add","Karma",1,"Fedex Worker"] call client_fnc_sustain;
					_level_check = (client_level_array select 1);
					_amount = 0;
					if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 10; };
					if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 7; };
					if(_level_check > 599) then { _amount = _level_check / 5; };
					_amount = round(_amount);


					if(_amount > 0) then {
						if(_amount > 250) then { _amount = 250; };
						[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
						[_amount,true,true] call Client_fnc_addMoneyToPlayer;
					};

					paycheck = paycheck + 35;
					if(((playertasks select 0) select 2) == "Personal") then {
						[] remoteExec ["client_fnc_completemail",((playertasks select 0) select 1)];
					};
					playertasks deleteat 0;
					uisleep 3;
				} else {
					[format["Your current Job (Marked on the Map): Delivery Type - %1",(playertasks select 0) select 2], true] spawn domsg;	
					[((playertasks select 0) select 0)] call client_fnc_jobMarker;			
					uisleep 3;
				};
				uisleep 3;
			};
		};
			
			{
				if((_x select 3) == "Personal") then {
					[] remoteExec ["client_fnc_completemail",(_x select 1)];
				};
			} foreach playertasks;

			if(myjob == "mail") then { [0] call client_fnc_jobEnd; };
	};
};


if(taskrunning) then { 
	_location = _this select 0;
	_sender = _this select 1;
	_jobType = _this select 2;
	_message = _this select 3;
	playertasks pushback [_location,_sender,_jobtype,_message]; 
};