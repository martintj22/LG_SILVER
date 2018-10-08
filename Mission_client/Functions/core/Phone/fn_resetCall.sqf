if(myjob == "Cop") exitwith { 33.3 call client_fnc_changeFrequency; };
if(myjob == "doc") exitwith { 33.2 call client_fnc_changeFrequency; };
if(myjob == "EMS" || myjob == "Fire") exitwith { 33.1 call client_fnc_changeFrequency; };
if(player IN serverRadioPlayers) then { _radiofreqs = [99.1,99.2,99.3,99.4,99.5]; _pia = serverRadioPlayers FIND player; myphonecall = _radiofreqs SELECT _pia; };


	
playSound "cgphone_hangup";
player setvariable["PhoneCallNumber",0,true];
player setvariable["PhoneID",0,true];
callInProgress = false;
myCallOwner = player;
_mynumber = getPlayerUID player;
if(myjob != "Cop" && myjob != "EMS" && myjob != "Fire") then {
	player setVariable ["tf_unable_to_use_radio", true];
};
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, _mynumber] call TFAR_fnc_SetChannelFrequency;
call TFAR_fnc_HideHint;