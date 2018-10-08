params["_type"];

if(_type == 0) then {

    disableSerialization;
    createdialog "danceMenu";

    uisleep 0.05;
    _display = findDisplay 1111;
    _list = _display displayCtrl 1113;
    lbClear _list;

    _list lbAdd format["%1", "Crazy "];
    _list lbSetdata [(lbSize _list)-1, "vvv_Crazy_Dance"];

    _list lbAdd format["%1", "Crazy Drunk"];
    _list lbSetdata [(lbSize _list)-1, "vvv_crazydrunkdance"];

    _list lbAdd format["%1", "Smooth"];
    _list lbSetdata [(lbSize _list)-1, "vvv_Dance"];

    _list lbAdd format["%1", "Dubstep"];
    _list lbSetdata [(lbSize _list)-1, "vvv_dubstepdance"];

    _list lbAdd format["%1", "Dubstep Pop"];
    _list lbSetdata [(lbSize _list)-1, "vvv_dubsteppop"];

    _list lbAdd format["%1", "Duo Ivan"];
    _list lbSetdata [(lbSize _list)-1, "vvv_duoivan"];

    _list lbAdd format["%1", "Duo Stephan"];
    _list lbSetdata [(lbSize _list)-1, "vvv_duostephan"];

    _list lbAdd format["%1", "Hip Hop"];
    _list lbSetdata [(lbSize _list)-1, "vvv_hiphopdance"];

    _list lbAdd format["%1", "Nightclub"];
    _list lbSetdata [(lbSize _list)-1, "vvv_nightclubdance"];

    _list lbAdd format["%1", "Robot"];
    _list lbSetdata [(lbSize _list)-1, "vvv_robotdance"];

    _list lbAdd format["%1", "Russian"];
    _list lbSetdata [(lbSize _list)-1, "vvv_russiandance"];

    _list lbAdd format["%1", "Stephan"];
    _list lbSetdata [(lbSize _list)-1, "vvv_stephan"];
};

if(_type == 1) then {

    _str = lbData[1113, (lbCurSel 1113)];

    [player, _str] remoteExec ["switchMove"];

    closeDialog 0;

};