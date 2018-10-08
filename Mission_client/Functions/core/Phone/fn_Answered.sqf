playSound "cgphone_click";
["Person entered your call!", false] spawn domsg; 
	if(myjob == "Radio") exitwith {};
if(myJob IN ["doc","Cop","EMS","Fire","Biker"]) then {


	myPhoneCall = getPlayerUID player;

	if(mycallowner IN serverRadioPlayers) then { _radiofreqs = [99.1,99.2,99.3,99.4,99.5]; _pia = serverRadioPlayers FIND mycallowner; myphonecall = _radiofreqs SELECT _pia; };
		
	if(player IN serverRadioPlayers) then { _radiofreqs = [99.1,99.2,99.3,99.4,99.5]; _pia = serverRadioPlayers FIND player; myphonecall = _radiofreqs SELECT _pia; };


	player setvariable["PhoneID",myPhoneCall,true];
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, myPhoneCall] call TFAR_fnc_SetChannelFrequency;
	call TFAR_fnc_HideHint;		
	if(myjob == "Biker") then { player setVariable ["tf_sendingDistanceMultiplicator", 1]; };
	
};