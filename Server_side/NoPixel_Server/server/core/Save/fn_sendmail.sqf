_receiver = _this select 0;
_mail = _this select 1;
_player = _this select 2;
_title = _this select 3;

if(typeName _receiver == "ARRAY") exitWith {

    {

        _updatestr = format ["insertMail:%1:%2:%3:%4", _mail, _title, _player, getplayeruid _x];
        _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
        
        _fetchstr = format ["getMail:%1", getPlayerUid _x];
        _fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
        _returned = str _fetch;
        _mail = _fetch;

        [missionNamespace, ["mail", _mail]] remoteExec ["setVariable", _x];

        ["New Mail", false] remoteExec ["doquickmsg", _x];

    } forEach _receiver;

};

if(typeName _receiver == "STRING") exitWith {

    _updatestr = format ["insertMail:%1:%2:%3:%4", _mail, _title, _player, _receiver];
    _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
    
    ["New Mail", false] remoteExec ["doquickmsg", _receiver];

    _targetowner = _receiver call BIS_fnc_getUnitByUid;

    if(!isNull(_targetowner)) then {
            
        _fetchstr = format ["getMail:%1", _targetowner];
        _fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
        _returned = str _fetch;
        _mail = _fetch;

        [missionNamespace, ["mail", _mail]] remoteExec ["setVariable", _targetowner];

    };

};

if(typeName _receiver == "OBJECT") exitWith {

    _updatestr = format ["insertMail:%1:%2:%3:%4", _mail, _title, _player, getplayeruid _receiver];
    _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

    _fetchstr = format ["getMail:%1", getPlayerUid _receiver];
    _fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
    _returned = str _fetch;
    _mail = _fetch;

    [missionNamespace, ["mail", _mail]] remoteExec ["setVariable", _receiver];

    ["New Mail", false] remoteExec ["doquickmsg", _receiver];

};





diag_log ["inserting mail %1", _player];
