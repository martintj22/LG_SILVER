params ["_windows","_lights","_wheels","_finish","_color","_newgarage","_plate","_player","_spoiler"];

_player setvariable ["garage",_newgarage,false];

diag_log format["%1 %2 %3 %4 %5 %6 %7", _windows, _lights, _wheels, _finish, _color, _spoiler, _Plate];

_checkstr = format ["updateCarParts:%1:%2:%3:%4:%5:%6:%7", _windows, _lights, _wheels, _finish, _color, _spoiler, _Plate];

_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery;

