disableSerialization;

_index = lbCurSel (911);
_status = lbData[911, _index];
_status = call compile format["%1", _status];

if (_status select 8 == 0) exitWith { ["This is already archived.", true] spawn domsg; };
if (_status select 2 == getPlayerUid player) exitWith { ["You can't close your own crime.", true] spawn domsg; };

_newWanted = ctrlText 1400;
_newWanted = call compile format["%1", _newWanted];

[_status, name player, getplayeruid player] remoteExec ["Server_fnc_wantedRemove",2];