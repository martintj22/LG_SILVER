
//[_location] remoteExec ["client_fnc_startSecurity",_player];
//[getpos player,] remoteExec ["client_fnc_startGarbage",_player];
// use lexus with directionals only.
if(myjob != "none" && myjob != "bus") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };

myjob = "bus";

[] call client_fnc_hudwork; 

private ["_warning","_JobBase"];

if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		taskrunning = true;
		busStoparray = [[[6297.1,1343.93,1.05324],"South Silver Lake City"],[[6578.3,2126.49,1.05263],"Central Silver Lake"],[[7754.72,2567.81,1.0542],"North Silver Lake City"],[[9767.67,3439.07,0.00143814],"North Silver Lake Housing"],[[9608.97,4133.95,0.00143814],"Ivywood Hospital"],[[9403,5476.09,0.00148773],"Ivywood Courthouse"],[[8661.25,6934.1,0.00143814],"Colchester City"],[[5420.71,6286.56,0.00109863],"Silver Lake Jail"],[[6728.49,4552.73,0.00143862],"Morrison Casino"],[[5493.53,3786.18,0.00143886],"Morrison Central"],[[4973.07,2483.28,0.00143886],"Morrison South"],[[4130.93,2167.28,0.00133896],"Skystead Turnoff"],[[3444.73,1343.02,0.00145721],"Francis Airport"],[[4964.65,1213.92,0.00143814],"South Silver Lake Housing"]];
		_warnings = 0;
		uisleep 30;

		while{taskrunning && myjob == "bus"} do {
			uisleep 3;

			if(playertasks isequalto []) then {

				["Generating Task", true] spawn domsg;

				[(busStopArray select 0) select 0,(busStopArray select 0) select 1] spawn client_fnc_startBus;

				if(_warnings > 10) then { 
					taskrunning = false; 
					["You have been laid off from your job!", true] spawn domsg; 
				};


			} else {

				if(_warnings > 10) then { 
					taskrunning = false; 
					["You have been laid off from your job!", true] spawn domsg; 
				};

				if(player distance vehspawned > 20) then { _warnings = _warnings + 1; };
				if(isNull vehspawned) then { _warnings = _warnings + 1; };


				if(player distance ((playertasks select 0) select 0) < 15) then {

					["You have arrived, wait a few seconds for passengers!", true] spawn domsg;
					paycheck = paycheck + 135;

					_pia = [[6297.1,1343.93,1.05324],[6578.3,2126.49,1.05263],[7754.72,2567.81,1.0542],[9767.67,3439.07,0.00143814],[9608.97,4133.95,0.00143814],[9403,5476.09,0.00148773],
		[8661.25,6934.1,0.00143814],[5420.71,6286.56,0.00109863],[6728.49,4552.73,0.00143862],[5493.53,3786.18,0.00143886],[4973.07,2483.28,0.00143886],[4130.93,2167.28,0.00133896],
		[3444.73,1343.02,0.00145721],[4964.65,1213.92,0.00143814]] FIND ((playertasks select 0) select 0);

					playertasks = [];

					if(_pia == 13) then { _pia == -1; };

					busStopArray select (_pia + 1) spawn client_fnc_startBus;

					uisleep 5;
					deletemarkerlocal format["job%1",getPlayerUID player];

					["add","Karma",1,"Taxi Driver"] call client_fnc_sustain;

					_level_check = (client_level_array select 9);
					_amount = 0;
					if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 6; };
					if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 5; };
					if(_level_check > 599) then { _amount = _level_check / 4; };

					_amount = round(_amount);

					if(_amount > 0) then {
						if(_amount > 150) then { _amount = 150; };
						[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
						[_amount,true,true] call Client_fnc_addMoneyToPlayer;
					};


				} else {




					if(random(100) > 90) then { _nearPlayers = player nearEntities ["man", 30]; {_nearplayers pushback _x; }foreach crew vehicle player; [format["%1 is the next stop!",((playertasks select 0) select 1)],false] remoteexec ["domsg",_nearPlayers]; };
					
					[((playertasks select 0) select 0)] call client_fnc_jobMarker;			
					uisleep 5;
				};

			};

		};

		[0] call client_fnc_jobEnd; 

	};

};

if(taskrunning) then { 
	playertasks pushback [_this select 0,_this select 1]; 
	_nearPlayers = player nearEntities ["man", 30]; {_nearplayers pushback _x; }foreach crew vehicle player; [format["%1 is the next stop!",((playertasks select 0) select 1)],false] remoteexec ["domsg",_nearPlayers];
};



