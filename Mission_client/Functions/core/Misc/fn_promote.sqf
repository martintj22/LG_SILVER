_data = lbData[911,lbCurSel (911)];
_rank = call compile format["%1", _data];
if(isNil "_rank") exitwith {}; // error check
[myjob,CurrentCursorTarget,_rank] remoteExec ["server_fnc_promote",2];

[format["%1Promotions",myJob], format["%1 (%2) changed %3 (%4) to rank %5.", name player, getplayeruid player, name CurrentCursorTarget, getplayeruid CurrentCursorTarget, _rank]] remoteExec ["server_fnc_log",2]; 