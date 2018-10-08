params["_player"];

if(_player IN serverRadioPlayers) then { 

	_radiofreqs = [99.1,99.2,99.3,99.4,99.5]; 

	_pia = serverRadioPlayers FIND _player; 

	_connectTo = _radiofreqs SELECT _pia; 

	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, _connectTo] call TFAR_fnc_SetChannelFrequency;
	callInProgress = true;
	player setVariable ["tf_unable_to_use_radio", false];
	call TFAR_fnc_HideHint;
	["You have been connected to a radio presenter.", false] spawn domsg;

};