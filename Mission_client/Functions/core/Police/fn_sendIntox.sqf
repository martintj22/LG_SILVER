params["_sender"];
private["_message","_drunk","_marijuana","_heroin","_cocaine","_meth"];
    
if ( client_drunk < 0 ) then { _drunk = 0; } else { _drunk = round(client_drunk); };
if ( client_marijuana < 0 ) then { _marijuana = 0; } else { _marijuana = round(client_marijuana); }; 
if ( client_heroin < 0 ) then { _heroin = 0; } else { _heroin = round(client_heroin); }; 
if ( client_cocaine < 0 ) then { _cocaine = 0; } else { _cocaine = round(client_cocaine); }; 
if ( client_meth < 0 ) then { _meth = 0; } else { _meth = round(client_meth); }; 

_message = "";

if(_drunk > 0 || _marijuana > 0 || _heroin > 0 || _cocaine > 0 || _meth > 0) then {

    if(_drunk > 0) then { _message = _message + format["Alcohol: %1. ", _drunk]; };
    if(_marijuana > 0) then { _message = _message + format["Marijuana: %1. ", _marijuana]; };
    if(_heroin > 0) then { _message = _message + format["Heroin: %1. ", _heroin]; };
    if(_cocaine > 0) then { _message = _message + format["Cocaine: %1. ", _cocaine]; };
    if(_meth > 0) then { _message = _message + format["Meth: %1. ", _meth]; };

} else {

    _message = "Person is not intoxicated in any way.";

};


[_message, true] remoteExec ["domsg", _sender];