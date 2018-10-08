params["_player"];

disableSerialization;

_bail = ctrlText 9339;
_bail = call compile format["%1", _bail];
if(_bail > 500000) exitWith { [format["Bail amount cannot be more than %1", 500000 call client_fnc_numberText], true] spawn domsg; };
if(_bail < 1) exitWith { [format["Bail amount cannot be less than %1", 1 call client_fnc_numberText], true] spawn domsg; };

closeDialog 0;

[[_bail,player],{
    params["_bail","_player"];

    _currentBail = client_level_array select 18;
    if(_currentBail > 0) exitWith { [format["This person already has bail in the amount of %1", _currentBail call client_fnc_numberText], true] remoteExec["domsg", _player]; };

    acceptBail = [_bail,_player];

    [format["You have been offered bail in the amount of %1.", _bail call client_fnc_numberText], true] spawn domsg;

}] remoteExec["bis_fnc_spawn", _player];