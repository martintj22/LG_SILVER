//city, towns or housing areas. 70kmh
_type1 = []; // speed limit 90kmh
_type2 = []; // speed limit 130kmh


// 10 to 35 over limit - $250 ticket
// [name player,getplayeruid player, "Silver Lake", "0", format["Speeding to the third degree.",], 2, 0, 1, 250] remoteexec ["server_fnc_addcriminal",2];

// 36 to 70 over limit - $500 ticket
// [name player,getplayeruid player, "Silver Lake", "0", format["Speeding to the second degree.",], 2, 0, 1, 500] remoteexec ["server_fnc_addcriminal",2];

// 71+ over limit - arrest warrant for first degree speeding
// [name player,getplayeruid player, "Silver Lake", "0", format["Speeding to the first degree.",] , 1 ,0, 1, 0] remoteexec ["server_fnc_addcriminal",2];
