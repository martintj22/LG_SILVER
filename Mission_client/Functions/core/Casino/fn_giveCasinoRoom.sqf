_str = lbData[1113, (lbCurSel 1113)];
_room = call compile format["%1", _str];

[_room]  remoteExec ["client_fnc_rentroom", CurrentCursorTarget];

closeDialog 0;