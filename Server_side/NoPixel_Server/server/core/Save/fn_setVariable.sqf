// fn_setvariable server side.. sneaky and cheeky.


// fn_setvariable server side.. sneaky and cheeky.



_object = _this select 0;
_variable = _this select 1;
_new = _this select 2;

if(isNil "_new") exitwith { };


if(_variable == "usedgarage") exitwith {
	GarageVariableWhore setvariable [_object, _new, false];
};

if(_variable == "getunitloadout" && (_object getvariable "sync") == 0) exitwith {};

_object setvariable [_variable, _new, false];