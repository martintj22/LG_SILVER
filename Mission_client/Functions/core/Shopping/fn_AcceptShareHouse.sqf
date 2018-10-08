if (isNull houseinvitation) exitwith { ["House timer run out", true] spawn domsg; };

_them = houseinvitation;

_myguid = getplayeruid player;
_theirguid = getplayeruid _them;

_myarray = [_myguid,_theirguid];
_theirarray = [_theirguid,_myguid];

_myarray spawn client_fnc_sharehousefinish;
_theirarray remoteexec ["client_fnc_sharehousefinish",_them];







