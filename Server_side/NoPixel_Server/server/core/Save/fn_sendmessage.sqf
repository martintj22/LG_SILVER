private["_receiver"];

_receiver = _this select 0;
_message = _this select 1;
_player = _this select 2;

_isTweet = 0;
_title = format ["%1", _player];

if(_receiver isEqualTo "Tweet") then { 
    _isTweet = 1;
    _receiver = playableUnits; 
    _player = "@" + tolower(_player splitString " " joinString "");
};

if(typeName _receiver == "ARRAY") exitWith {

    {
        _updatestr = format ["insertMessage:%1:%2:%3:%4", _message, _title, _player, getplayeruid _x];
        _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

        if (_isTweet == 1) then {
            ["New Tweet", false] remoteExec ["doquickmsg", _x];
        } else {
            ["New SMS", false] remoteExec ["doquickmsg", _x];
            playSound3D ["np_sounds\sounds\smssound.ogg", _receiver, false, getPosasl _x, 25, 1, 15];
        };

        _fetchstr = format ["getMessages:%1", getPlayerUid _x];
        _fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
        _returned = str _fetch;
        _messages = _fetch;

        [missionNamespace, ["messages", _messages]] remoteExec ["setVariable", _x];

        diag_log ["inserting sms %1", _player];

    } forEach _receiver;

};


if(typeName _receiver == "STRING") exitWith {

    _updatestr = format ["insertMessage:%1:%2:%3:%4", _message, _title, _player, _receiver];
    _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

    _targetowner = _receiver call BIS_fnc_getUnitByUid;

    if(!isNull(_targetowner)) then {
            
        _fetchstr = format ["getMessages:%1", getplayeruid _targetowner];
        _fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
        _returned = str _fetch;
        _messages = _fetch;

        [missionNamespace, ["messages", _messages]] remoteExec ["setVariable", _targetowner];

        ["New SMS", false] remoteExec ["doquickmsg", _targetowner];

        playSound3D ["np_sounds\sounds\smssound.ogg", _targetowner, false, getPosasl _targetowner, 25, 1, 15];

    };

};

if(typeName _receiver == "OBJECT") exitWith {

    _updatestr = format ["insertMessage:%1:%2:%3:%4", _message, _title, _player, getplayeruid _receiver];
    _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

    ["New SMS", false] remoteExec ["doquickmsg", _receiver];

    playSound3D ["np_sounds\sounds\smssound.ogg", _receiver, false, getPosasl _receiver, 25, 1, 15];

    _fetchstr = format ["getMessages:%1", getPlayerUid _receiver];
    _fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
    _returned = str _fetch;
    _messages = _fetch;

    [missionNamespace, ["messages", _messages]] remoteExec ["setVariable", _receiver];

};



diag_log ["inserting sms %1", _player];
