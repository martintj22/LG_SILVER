disableSerialization;

_status = lbData[9001,lbCurSel (9001)];
_status = call compile format["%1", _status];

if(!dialog) then {	createdialog "openMail"; };

[0, player] remoteExec ["server_fnc_readmail", 2];

unreadMail = 0;

uisleep 0.05;

_display = findDisplay 9999;


_list = _display displayCtrl 9001;

lbClear _list;


_n = 0;
{
	_list lbAdd format["%1", _x select 1];
	_list lbSetdata [(lbSize _list)-1,str(_n)];
	_n = _n + 1;
} foreach mail;


if(isNil "_status") exitwith {};

_selectedmessage = mail select _status;

_Btn4 = _display displayCtrl 9110;
_Btn4 ctrlSetStructuredText parsetext format["<t color='#33CC33'>TITLE: %1<br/>SENDER: %2<br/>DATE: %3</t><br/><br/><t color='#ffffff'>%4</t>", _selectedmessage select 1, _selectedmessage select 2, _selectedmessage select 3, _selectedmessage select 0];
_btn4 ctrlCommit 0;

[_Btn4] call BIS_fnc_ctrlFitToTextHeight;
