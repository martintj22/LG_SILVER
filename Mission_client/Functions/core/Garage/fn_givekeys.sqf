params ["_keys"];

{ 
	if !(_x in current_cars) then { current_cars pushback _x; }; 
} foreach _keys;

["You received a set of keys!", true] spawn domsg;