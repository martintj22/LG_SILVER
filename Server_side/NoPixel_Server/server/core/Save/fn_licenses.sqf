params["_steamid","_license","_method"];


if(_method == 1) then {

    _updatestr = format ["insertLicense:%1:%2", _steamid, _license];
    _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

};

if(_method == 2) then {

    _updatestr = format ["deleteLicense:%1:%2", _steamid, _license];
    _update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

};

if(_method == 3) then {

    

};