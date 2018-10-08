disableSerialization;
_index = lbCurSel (911);
if (_index == -1) exitWith { ["You must select the ticket that you want to pay.", true] spawn domsg; };
_status = lbData[911, _index];
_status = call compile format["%1", _status];

if (_status select 6 != 2) exitWith { ["This is not a ticket.", true] spawn domsg; };

if (_status select 8 == 0) exitWith { ["This ticket has already been paid or closed.", true] spawn domsg; };

_cashcheck = [1, _status select 9] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",(_status select 9) call client_fnc_numberText], true] spawn domsg; };

[_status, name player, getplayeruid player] remoteExec ["Server_fnc_wantedRemove",2];
[_status select 0] remoteExec ["Server_fnc_acceptWarrant",2];

[_status select 9] call Client_fnc_removeCash;
["govtBank", _status select 9, "Add"] remoteExec["server_fnc_setValue",2];
["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, (_status select 9) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

["You have paid for the ticket.",false] spawn domsg;

[player, getPlayerUID player] remoteExec ["Server_fnc_wantedList",2];
[] spawn client_fnc_wantedinformationupdate;