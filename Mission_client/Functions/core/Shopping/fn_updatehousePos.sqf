params ["_house"];
["Your Partner has woken up and your house location has changed.", true] spawn domsg;

deletemarkerlocal "myhouse";

player setvariable ["house",_house,false];
myhouse = _house;