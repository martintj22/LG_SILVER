//[_location] remoteExec ["client_fnc_startSecurity",_player];
//[getpos player,] remoteExec ["client_fnc_startGarbage",_player];
// use lexus with directionals only.

if( myjob != "none" && myjob != "towtruck") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };

myjob = "towtruck";

[] call client_fnc_hudwork;
private ["_warning","_JobBase"];
if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		taskrunning = true;

		_warnings = 0;
		while{taskrunning && myjob == "towtruck"} do {
			uisleep 3;
			if(playertasks isequalto []) then {
				["You have no current jobs, please patrol for towable cars!", true] spawn domsg;
				uisleep 60;
			} else {


				if(_warnings > 10) then { 
					taskrunning = false; 
					["You have been laid off from your job!", true] spawn domsg; 
				};

				if(vehspawned distance player > 30) then { _warnings = _warnings + 1; };
				if(isNull vehspawned) then { _warnings = _warnings + 1; };
					

				if(player distance ((playertasks select 0) select 0) < 15) then {


					["You have arrived at your location!", true] spawn domsg;
					paycheck = paycheck + 250;
					playertasks deleteat 0;
					uisleep 3;
					deletemarkerlocal format["job%1",getPlayerUID player];

					["add","Karma",3,"Repairman"] call client_fnc_sustain;

					_level_check = (client_level_array select 7);
					_amount = 0;
					if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 9; };
					if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 7; };
					if(_level_check > 599) then { _amount = _level_check / 5; };

					_amount = (round(_amount) + 100);

					if(_amount > 0) then {
						if(_amount > 220) then { _amount = 220; };
						[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
						[_amount,true,true] call Client_fnc_addMoneyToPlayer;
					};


				} else {
					["Your current Job (Marked on the Map): Job Type - Tow Vehicle", true] spawn domsg;	
					[((playertasks select 0) select 0)] call client_fnc_jobMarker;			
					uisleep 3;
				};
			};
		};
		if(myjob == "towtruck") then { [0] call client_fnc_jobEnd; };
	};
};

if(taskrunning) then { 
	_location = _this select 0;
	playertasks pushback [_location]; 
};