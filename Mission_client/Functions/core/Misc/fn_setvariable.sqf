params["_variable","_new","_object"];

if ( _variable =="marshal" || _variable =="doc" || _variable == "mobster" || _variable == "biker" || _variable == "mafia" || _variable =="ems" || _variable =="cop" || _variable =="fire" ) then { [format["Your rank has been changed to %1 as %2",_new,_variable], true] spawn domsg; };

if(_variable == "garage") exitwith {
	_garage = player getVariable ["garage",[]];
	_garage pushback _new;
	player setVariable ["garage", _garage, false];
};


if(_variable == "usedgarage") exitwith {
	current_cars = _new;
	_garage =  player getVariable ["garage",[]];
	_information = _this select 2;
	_garage pushback _information;
	player setVariable ["garage", _garage, false];
};

if(_variable == "tracking" && (_object getVariable["tracking",FALSE])) exitwith { _object setvariable ["tracking",nil,false]; ["A bug was removed from you",false] remoteexec ["domsg",_object]; };

player setvariable [_variable, _new, false];
