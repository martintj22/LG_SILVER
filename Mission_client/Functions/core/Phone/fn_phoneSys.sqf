_type = _this select 0;

if (_type == 0) then {

    closeDialog 0;
    createDialog "client_findSMS";

};

if (_type == 1) then {

    _message = lbData[9001,lbCurSel (9001)];
    _message = call compile format["%1", _message];
    
    if(isNil "_message") then {
        _message = 0;
    };

    _selectedmessage = messages select _message;

    _sender = _selectedmessage select 2;
    _senderID = "0";
    _senderIndex = 0;
    
    _playableUnits = (playableUnits) apply {[name _x, _x]}; 
    _playableUnits sort true; 
    _playableUnits = (_playableUnits) apply {_x select 1}; 

    {
        if(_sender == name _x) exitWith {
            _senderID = getPlayerUID _x;
            _senderIndex = _forEachIndex;
        };
    } forEach _playableUnits;

    closeDialog 0;

    if(_senderID != "0") then {
        createDialog "client_findSMS";
        uiSleep 0.1;
        lbSetCurSel [1113, _senderIndex];
    } else {
        createDialog "client_findSMS";
    };
};