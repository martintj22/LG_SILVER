PhonesRinging = false;	
myCallOwner = _this;

myPhoneCall = getPlayerUID myCallOwner;

if(mycallowner IN serverRadioPlayers) then { _radiofreqs = [99.1,99.2,99.3,99.4,99.5]; _pia = serverRadioPlayers FIND mycallowner; myphonecall = _radiofreqs SELECT _pia; };

if(player IN serverRadioPlayers) then { _radiofreqs = [99.1,99.2,99.3,99.4,99.5]; _pia = serverRadioPlayers FIND player; myphonecall = _radiofreqs SELECT _pia; };

player setvariable["PhoneID",myPhoneCall,true];
player setVariable ["tf_unable_to_use_radio", false];
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, myPhoneCall] call TFAR_fnc_SetChannelFrequency;
call TFAR_fnc_HideHint;
_total = myCallOwner getVariable "PhonecallNumber";
_total = _total + 1;	
myCallOwner setvariable["PhoneCallNumber",_total,true];
if(myjob == "Biker") then { player setVariable ["tf_sendingDistanceMultiplicator", 1]; };
[] spawn client_fnc_callProgress;