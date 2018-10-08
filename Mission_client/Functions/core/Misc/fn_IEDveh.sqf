private["_bomb","_target"];

_bomb = 0;
_target = CurrentCursorTarget;

if ( !("np_SatchelCharge" IN magazines player) ) exitWith { ["You do not have an IED.", true] spawn domsg; };

_bomb = createVehicle ["SatchelCharge_F", getpos _target, [], 0, "CAN_COLLIDE"];
_bomb attachTo [_target,[0,0,-1]];

_name = ("bomb" + (str round(random(10000))));
missionNamespace setVariable [_name, _bomb];

bombs pushBack _name;

player removeMagazine "np_SatchelCharge";

["Bomb has been planted.", true] spawn domsg;