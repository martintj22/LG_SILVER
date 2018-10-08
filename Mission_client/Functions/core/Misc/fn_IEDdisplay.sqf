{
    _obj = call compile format["%1", _x];

    if( isNull (_obj) ) then {
        bombs deleteAt _forEachIndex; 
    };
} forEach bombs;

disableSerialization;
createdialog "bombMenu";

uisleep 0.05;
_display = findDisplay 1111;
_list = _display displayCtrl 1113;
lbClear _list;

{
    _list lbAdd format["%1", "Satchel Charge"];
    _list lbSetdata [(lbSize _list)-1, _x];
} foreach bombs;