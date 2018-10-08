{
    _obj = call compile format["%1", _x];

    if( isNull (_obj) ) then {
        hackedcars deleteAt _forEachIndex; 
    };
} forEach hackedcars;

disableSerialization;
createdialog "hackcarMenu";

uisleep 0.05;
_display = findDisplay 1111;
_list = _display displayCtrl 1113;
lbClear _list;

{
    _obj = call compile format["%1", _x];

    _list lbAdd format["%1", getText(configFile >> "cfgVehicles" >> typeOf _obj >> "displayName")];
    _list lbSetdata [(lbSize _list)-1, _x];
} foreach hackedcars;