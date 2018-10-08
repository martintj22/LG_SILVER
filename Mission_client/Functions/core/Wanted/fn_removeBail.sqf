params["_player"];

[[player],{
    
    params["_player"];

    _bail = client_level_array select 18;

    if(_bail == 0) exitWith { ["This person does not have any bail.", true] remoteExec["domsg",_player]; };

    ["Set", "Karma", 0,"Bail"] call client_fnc_sustain;
    [_bail] call client_fnc_addMoneyToBank;

    [getplayeruid player, name _player, getplayeruid _player] remoteExec ["Server_fnc_removeBail",2];
    [getplayeruid player, name _player, getplayeruid _player] remoteExec ["Server_fnc_closeBail",2];

    [format["This person has received his %1 back.", _bail call client_fnc_numberText], true] remoteExec["domsg", _player];
    [format["You have received your %1 back.", _bail call client_fnc_numberText], true] remoteExec["domsg", player];

    ["bail", format["%1 (%2) has gave back the %3 bail of %4 (%5).", name _player, getplayeruid _player, _bail call client_fnc_numberText, name player, getplayeruid player]] remoteExec ["server_fnc_log",2];


}] remoteExec["bis_fnc_spawn",_player];