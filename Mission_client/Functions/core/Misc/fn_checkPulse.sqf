params["_target"];


if(deadPhase == 1) then {

    [format["This person is paralyzed and will be saved by the Fire Department in %1.", [(maxTime - time),"MM:SS"] call BIS_fnc_secondsToString], true] remoteExec ["domsg", _target];

};

if(deadPhase == 2) then {

    [format["This person is unconscious and will be saved by the Fire Department in %1.", [(maxTime - time),"MM:SS"] call BIS_fnc_secondsToString], true] remoteExec ["domsg", _target];

};
