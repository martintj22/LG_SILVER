_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
_freq = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_GetChannelFrequency;
if(_freq == (_this select 0)) then { [] spawn client_fnc_tryhangup; };

["Your call was disconnected!", true] spawn domsg;