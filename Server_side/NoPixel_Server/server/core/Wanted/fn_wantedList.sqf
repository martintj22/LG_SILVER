
_player = _this select 0;
_type = _this select 1;

if(_type IN [0,1]) then {

    if(_type == 0) then {   

        _fetch = ["getCrimeInactive", 2] call ExternalS_fnc_ExtDBasync;
        latestWanted = _fetch;
        [latestWanted] remoteExec ["client_fnc_wantedproduce",_player];

    };

    if(_type == 1) then {

        _fetch = ["getCrimeActive", 2] call ExternalS_fnc_ExtDBasync;
        latestWanted = _fetch;
        [latestWanted] remoteExec ["client_fnc_wantedproduce",_player];

    };


} else {
    _fetchstr = format ["getCrimeUser:%1", _type];
    _fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
    latestWanted = _fetch;
    
    [latestWanted] remoteExec ["client_fnc_wantedproduce",_player];
};