//SUSPECTID / OFFICERID / CHARGES / STATUS / EVIDENCE / activate


_currentitemindex = lbCurSel 1120;
if (_currentitemindex == -1) exitWith { ["You must select a person.", true] spawn domsg; };
_status2 = lbData [1120, _currentitemindex];
currentcursortarget = _status2;
currentcursortarget = call compile format["%1", currentcursortarget];

 [player, getPlayerUID currentcursortarget] remoteExec ["Server_fnc_wantedList",2];