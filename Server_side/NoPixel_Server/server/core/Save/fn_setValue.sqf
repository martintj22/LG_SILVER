params ["_key","_value",["_type","None"],["_public",false]];

if(isNil "_value") exitwith { diag_log format ["Error Nil: %1 = %2", _key, _type]; };

if(typeName _value == "SCALAR") then { _value = round(_value); };

if(isNil "_value") exitwith { diag_log format ["Error Nil 2: %1 = %2", _key, _type]; };

if(_type == "Add") then {
    _value = (call compile _key) + _value;
};

if(_type == "Remove") then {
    _value = (call compile _key) - _value;
};

_fetch = [0, format ["setValue:%1:%2", _value, _key]] call ExternalS_fnc_ExtDBquery;
missionNamespace setVariable [_key, _value];

if(_public) then {
    publicVariable _key;
};