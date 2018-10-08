disableSerialization;
_index = lbCurSel (1113);
_message = ctrlText 9331;
if(_message == "Enter a Message") exitwith {};
if(_message find ":" > -1) exitWith {
    ["You cannot use a colon (':') in your message.", true] spawn domsg;
};
if (_index == -1) exitWith {};
_status = lbData[1113, _index];
_status = call compile format["%1", _status];
closedialog 0;
sleep 0.05;
if(isNil "_status") exitwith { };
[_status,_message,name player, format["Mail from %1",name player]] remoteExec ["server_fnc_sendMail",2];