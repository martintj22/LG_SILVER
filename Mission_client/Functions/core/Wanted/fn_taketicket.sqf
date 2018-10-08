disableSerialization;
createdialog "PayTicket_Menu";

uisleep 0.05;
_display = findDisplay 1111;
_list = _display displayCtrl 1113;
lbClear _list;
{

    if(_x select 2 == getplayeruid player && _x select 7 == 0) then {
        _list lbAdd format["T%1 - %2", _x select 0, (_x select 9) call client_fnc_numberText];
        _list lbSetdata [(lbSize _list)-1,str([_x select 0, _x select 9])];
    };

} foreach myLatestWanted;