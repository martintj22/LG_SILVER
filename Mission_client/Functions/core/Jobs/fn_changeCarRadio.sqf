//serverRadios = [99.1,99.2,99.3,99.4,99.5];

_newFreq = serverRadios select (_this select 0);


_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, _newFreq] call TFAR_fnc_SetChannelFrequency;
callInProgress = false;
myCallOwner = player;
player setVariable ["tf_unable_to_use_radio", true];
call TFAR_fnc_HideHint;
["You switched radio!", false] spawn domsg;