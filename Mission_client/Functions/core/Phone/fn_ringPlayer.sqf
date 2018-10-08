	CurrentCaller = _this select 0;
	_type = _this select 1;
	_haltphone = false;
	_radios = player call TFAR_fnc_radiosList;
	
	if(myjob == "Radio") exitwith { ["A player has been added to your available radio connection list", true] spawn domsg; RadioConnections pushback currentcaller; ["You have been added to the radio host call back list",true] remoteExec ["domsg",currentCaller]; };

	if(count _radios > 0) then {
		if(_type == 1) then {
			if( phoneDisabled ) exitwith { _haltphone = true; currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["A call from %1 went to your message bank! (Phone Disabled)","Anonymous"], false] spawn domsg; };	
			if( callInProgress || PhonesRinging ) exitwith { _haltphone = true; currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["A call from %1 went to your message bank! (In a Call) ","Anonymous"], false] spawn domsg; };	
			if( client_battery < 5 ) exitwith { _haltphone = true; currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["A call from %1 went to your message bank! (Low Battery) ","Anonymous"], false] spawn domsg; };

			["anonymous", format["%1 (%2) called %3 (%4)", name CurrentCaller, getplayeruid CurrentCaller, name player, getplayeruid player]] remoteExec ["server_fnc_log",2];
		} else {
			if( phoneDisabled ) exitwith { _haltphone = true; currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["A call from %1 went to your message bank! (Phone Disabled)",name CurrentCaller], false] spawn domsg; };	
			if( callInProgress || PhonesRinging ) exitwith { _haltphone = true; currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["A call from %1 went to your message bank! (In a Call) ",name CurrentCaller], false] spawn domsg; };	
			if( client_battery < 5 ) exitwith { _haltphone = true; currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["A call from %1 went to your message bank! (Low Battery) ",name CurrentCaller], false] spawn domsg; };
		};
		PhonesRinging = true;
		_endme = 0;
		if(_haltphone) exitwith {};
		while{PhonesRinging} do {
			if(myjob != "Radio") then {
				playSound "cgphone_call";
			};
			if(_type == 1) then {
				[format["You are being called by %1!","Anonymous"], false] spawn domsg; 
			} else {
				[format["You are being called by %1!",name currentcaller], false] spawn domsg; 
			};
			sleep 5;
			_endme = _endme + 5;
			playSound "cgphone_call";

			if(_endme > 20 && _type == 1) exitwith { 
				[format["You missed a call from %1.","Anonymous"], false] spawn domsg; 
   		 		[player,format["You missed a call from %1.",name currentcaller],"Missed Call"] remoteExec ["server_fnc_sendMessage",2];
				
			};

			if(_endme > 20 && _type == 0) exitwith { 
				[format["You missed a call from %1.",name currentcaller], false] spawn domsg; 
   		 		[player,format["You missed a call from %1.",name currentcaller],"Missed Call"] remoteExec ["server_fnc_sendMessage",2];
				
			};
		};

		PhonesRinging = false;		
	} else {
		currentCaller remoteExec ["fnc_busyAnswer",currentCaller];
		["You missed a call!", false] spawn domsg; 
	};