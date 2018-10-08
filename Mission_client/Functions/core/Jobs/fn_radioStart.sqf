_pia = serverRadioPlayers FIND objNull;

if(_pia == -1) exitwith { ["Sorry, 5 radio stations are already active.", true] spawn domsg; }; //howd they get here? slow clicker virgin or w/e.
if(myJob != "none") exitwith { ["You already have a paying job!", true] spawn domsg; };
serverRadioPlayers SET [_pia,player];

publicVariable "serverRadioPlayers";


//serverRadios = [99.1,99.2,99.3,99.4,99.5];
//serverRadioPlayers = [CIV_69,civ_34,objNull,objNull,objNull];


_freq = serverRadios select _pia;
myphonecall = _freq;
player setvariable["PhoneCallNumber",_freq,true];
player setvariable["PhoneID",_freq,true];
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, _freq] call TFAR_fnc_SetChannelFrequency;
callInProgress = false;
myCallOwner = player;
player setVariable ["tf_unable_to_use_radio", false];
call TFAR_fnc_HideHint;
["You are on a radio station!", false] spawn domsg;

myJob = "Radio";

if(isnil "taskrunning") then { taskrunning = false; };

[] call client_fnc_hudwork;
private ["_warning","_JobBase"];
if(!taskrunning) then {

	[] spawn {

		taskrunning = true;

		_warnings = 0;
		while{taskrunning && myjob == "Radio"} do {

			if( random(2) > 1 ) then {
				["add","Karma",1,"Radio Presenter"] call client_fnc_sustain;
			};

			uisleep 120;

			_level_check = (client_level_array select 3);
			_amount = 0;
			if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 14; };
			if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 12; };
			if(_level_check > 599) then { _amount = _level_check / 10; };

			_amount = round(_amount);

			if(_amount > 0) then {
				if(_amount > 150) then { _amount = 150; };
				[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
				[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			};

			paycheck = paycheck + 35;
		};
		[0] call client_fnc_jobEnd;
	};
};

taskrunning = false;