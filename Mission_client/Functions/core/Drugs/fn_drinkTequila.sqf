if(isNil "extraCash") then { extraCash = 0; };

[player, 60] spawn drug_beer_effects;
extraCash = extraCash + 12;
["You feel very charismatic and receive extra benefits.",false] spawn domsg;
