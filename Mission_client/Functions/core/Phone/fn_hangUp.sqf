playSound "cgphone_hangup";

if(myJob == "Radio") exitwith {
	callInProgress = false;
	[myphonecall] remoteexec ["client_fnc_clearRadio",RadioConnected];
};

if(player == myCallOwner) exitwith {
	[] call client_fnc_resetcall;
	callInProgress = false;
};
_total = myCallOwner getVariable "PhonecallNumber";
_total = _total - 1;
myCallOwner setvariable["PhoneCallNumber",_total,true];
[] call client_fnc_resetcall;
callInProgress = false;


_radios = player call TFAR_fnc_radiosList;

if(count _radios > 0 && radioGiven) then {
	_myradio = call TFAR_fnc_ActiveSwRadio;
	player unassignitem _myradio;
	radioGiven = false;
	player removeitem _myradio;
};
