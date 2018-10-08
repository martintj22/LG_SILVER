disableSerialization;


_selectedBG = lbData[911,lbCurSel (911)];
_selectedBG = call compile format["%1", _selectedBG];

phoneBackground = _selectedBG;
if(isNil "phoneBackground") exitwith { ["Error saving", true] spawn domsg; };

[player, "phoneBackground", [phoneBackground,phoneskin]] remoteExec ["Server_fnc_setVariable",2];

[1] call Client_fnc_removeBank;



["You were charged $1.00 for your new phone background!", false] spawn domsg; 