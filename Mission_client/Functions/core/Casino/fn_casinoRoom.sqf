disableSerialization;
createdialog "casinoRoomMenu";

uisleep 0.05;
_display = findDisplay 1111;
_list = _display displayCtrl 1113;
lbClear _list;

_list lbAdd format["%1", "Room 101"];
_list lbSetdata [(lbSize _list)-1, str(19)];

_list lbAdd format["%1", "Room 102"];
_list lbSetdata [(lbSize _list)-1, str(20)];

_list lbAdd format["%1", "Room 201"];
_list lbSetdata [(lbSize _list)-1, str(21)];

_list lbAdd format["%1", "Room 202"];
_list lbSetdata [(lbSize _list)-1, str(22)];

_list lbAdd format["%1", "Room 301"];
_list lbSetdata [(lbSize _list)-1, str(23)];

_list lbAdd format["%1", "Room 302"];
_list lbSetdata [(lbSize _list)-1, str(24)];