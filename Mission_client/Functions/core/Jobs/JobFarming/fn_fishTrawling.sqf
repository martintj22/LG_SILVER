
if(myjob != "none" && myjob != "trawling") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };

myjob = "trawling";

[] call client_fnc_hudwork;

private ["_warning","_JobBase"];

_spawnpoints = [[6854.59,733.527,-1.5944],[6854.59,783.372,-1.54719],[6854.59,733.527,-1.60363],[6854.59,733.527,-1.60363],[6858.47,411.41,-1.62621],[6853.44,318.771,-1.55205],[6865.46,204.989,-1.61237]];
vehspawned = "D41_Trawler" createvehicle [random(10),random(10),random(5000)];

["Your boat is being docked, please wait a moment.", true] spawn domsg;

_n = 0;
while{true} do {
	_nearobjects = nearestobjects[(_spawnpoints select _n),["car","air","ship","boat","D41_Trawler"],10];
	if(count _nearobjects == 0) exitwith { vehspawned setpos (_spawnpoints select _n); vehspawned setdir 260; };
	uisleep 0.1;
	_n = _n + 1;
	if(_n > count _spawnpoints) then { _n == 0; ["Your boat is being docked, please wait a moment.", true] spawn domsg; };
};

player moveInDriver vehspawned;


if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		truckCapacity = 0;
		taskrunning = true;
		_crop = objNull;
		_warnings = 0;
		while{taskrunning && myjob == "trawling"} do {
			uisleep 3;
			if(playertasks isequalto []) then {
				["You have no current jobs, hang around safely until a task is generated!", true] spawn domsg;
				uisleep 3;


				if(truckCapacity > 50) then {
					playertasks pushback [[7053.74,812.719,-1.58111],"finishdelivery"];
				} else {

					_roll1 = [0,0,0];
					_roll2 = [0,0,0];	
					if(random(5) > 3) then { _roll1 = 8311.28 + random(500); } else { _roll1 = 8311.28 - random(500); };
					if(random(5) > 3) then { _roll2 = 946.567 + random(500); } else { _roll2 = 946.567 - random(500); };
					playertasks pushback [[_roll1,_roll2,-1.54772],"standard"];
				};
					

				[((playertasks select 0) select 0)] call client_fnc_jobMarker;		

			} else {

				if(_warnings > 30) then { 
					taskrunning = false; 
					["You have been laid off from your job!", true] spawn domsg; 
				};

				if(vehspawned distance player > 30) then { _warnings = _warnings + 1; };
				if(isNull vehspawned) then { _warnings = _warnings + 1; };

				_level_check = (client_level_array select 8);

				if(player distance ((playertasks select 0) select 0) < 15 && ((playertasks select 0) select 1) != "finishdelivery") then {

					["You are close, Be sure to run over the marker until it is removed.", true] spawn domsg;


					_amount = 0;
					if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 11; };
					if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 9; };
					if(_level_check > 599) then { _amount = _level_check / 8; };

					_amount = round(_amount);

					if(_amount > 0) then {
						if(_amount > 50) then { _amount = 50; };
						[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
						[_amount,true,true] call Client_fnc_addMoneyToPlayer;
					};


					if(_level_check > -1 && _level_check < 300) then { truckCapacity = truckCapacity + 5; paycheck = paycheck + 150; };
					if(_level_check > 299 && _level_check < 600) then { truckCapacity = truckCapacity + 8; paycheck = paycheck + 250; };
					if(_level_check > 599) then { truckCapacity = truckCapacity + 10; paycheck = paycheck + 350; };
					["add","Karma",3,"Farming"] call client_fnc_sustain;
					playertasks deleteat 0;
					uisleep 3;
					deletemarkerlocal format["job%1",getPlayerUID player];
				};


				if(player distance ((playertasks select 0) select 0) < 25 && ((playertasks select 0) select 1) == "finishdelivery") then {
					truckCapacity = 0;
					["You finished a full round, your next paycheck will be bigger & received a bonus.", true] spawn domsg;
					playertasks deleteat 0;
					vehspawned setfuel 1;
					uisleep 3;
					deletemarkerlocal format["job%1",getPlayerUID player];

					["add","Karma",20,"Farming"] call client_fnc_sustain;

					_amount = 0;
					if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 3; };
					if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 2; };
					if(_level_check > 599) then { _amount = _level_check / 1; };

					_amount = round(_amount);

					if(_amount > 0) then {
						if(_amount > 550) then { _amount = 550; };
						[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
						[_amount,true,true] call Client_fnc_addMoneyToPlayer;
					};

				};


			};
		};
		[0] call client_fnc_jobEnd;
	};
};

if(taskrunning) then { 
	_location = _this select 0;
	playertasks pushback [_location]; 
};





