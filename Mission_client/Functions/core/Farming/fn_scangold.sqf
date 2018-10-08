if(isNil "GoldTimer") then { GoldTimer = time - 35; };

GoldTimer = time + 5;

_goldbars = nearestObjects [player, ["itemsGoldbar1"], 20];

if(count _goldbars == 0) exitwith { ["You are not near a gold bar!", true] spawn domsg; };

[format["Gold is within %1 meters of you. You can prospect when you are within 5 meters.",(_goldbars select 0) distance player], true] spawn domsg;