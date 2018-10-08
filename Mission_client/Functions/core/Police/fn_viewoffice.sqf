_suspect = lbCurSel 1120;
_suspect = lbData [1120, _suspect];
_suspect = call compile _suspect;

closeDialog 0;

[[player], {
    params["_target"];

    if(myOffice isEqualTo [0,0,0]) then {
        [format["%1 does not have an active office.", name player], true] remoteExec ["domsg", _target];
    } else {
        [myoffice, format["%1's Office",name player], "Location", _target] remoteexec ["client_fnc_hudHelper", _target];
        [format["%1's office has been marked on the map.", name player], true] remoteExec ["domsg", _target];
    };
    

}] remoteExec["bis_fnc_spawn", _suspect];