_room = _this select 0;
_casino = (nearestObjects [player,["Land_buildingsCasino2"],500] select 0);

["You have rented a room. You will lose keys to the room in 60 minutes.", true] spawn domsg;

_casino setVariable[format["bis_disabled_Door_%1",_room], 0];

uiSleep 3540;

["You will lose keys to the room in 1 minute.", true] spawn domsg;
uiSleep 60;

_casino setVariable[format["bis_disabled_Door_%1",_room], 1];
_casino animate [format["door%1",_room],0];
