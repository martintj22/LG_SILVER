_currentitemindex = lbCurSel 1120;
if (_currentitemindex == -1) exitWith { ["You must select a person.", true] spawn domsg; };
_status2 = lbData [1120, _currentitemindex];
currentcursortarget = _status2;
currentcursortarget = call compile format["%1", currentcursortarget];

 [player, getPlayerUID currentcursortarget] remoteExec ["Server_fnc_wantedList",2];

["Generating...", false] spawn doquickmsg;

 sleep 10;

_message = "";

 {

    if ( _x select 6 == 2 && _info select 7 == 0 && _info select 8 == 1 ) then {
        _message = _message + (_x select 5) + " ";
    };

 } foreach latestWanted;

 [_message, true] spawn domsg;