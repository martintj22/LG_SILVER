params["_freq"];

player setvariable["PhoneCallNumber",_freq,true];
player setvariable["PhoneID",_freq,true];
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, _freq] call TFAR_fnc_SetChannelFrequency;
callInProgress = false;
myCallOwner = player;
player setVariable ["tf_unable_to_use_radio", false];
call TFAR_fnc_HideHint;

_title = "None";

if(myJob IN ["Cop","doc","EMS"]) then {

   switch (_freq) do {
        case 33.1: { _title = "FD"; };
        case 33.2: { _title = "DoC"; };
        case 33.3: { _title = "PD Patrol"; };
        case 33.4: { _title = "PD Highway"; };
        case 33.5: { _title = "PD Marshal"; };
        case 33.6: { _title = "PD Detective"; };
        case 33.7: { _title = "PD Extra"; };
    };

};

if(myJob IN ["Biker"]) then {

   switch (_freq) do {
        case 69.1: { _title = "Biker"; };
    };

};

[format["You are now on %1 %2 frequency.", _title, _freq], true] spawn domsg;