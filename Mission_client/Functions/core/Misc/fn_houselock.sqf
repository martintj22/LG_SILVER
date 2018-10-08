params["_house","_type"];

 for [{_i=1}, {_i <= 20}, {_i = _i + 1}] do {
     _house setVariable [format["bis_disabled_Door_%1", _i], _type, true];
};