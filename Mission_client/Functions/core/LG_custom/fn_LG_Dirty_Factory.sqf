

if(myJob == "Mafia") then {
 onlyFac = 1;
 publicVariable "onlyFac";
 	if(player distance [2687.35,1462.83,0.00144196] < 400) then {
	} else {
  	 ["You must be near Deathfall Factory to cook meth!", true] spawn domsg;
};






};
 
 //faction start 
["Penge maskinen er startet!", true] spawn domsg; 
        sleep 30;
[500,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 500!", true] spawn domsg; 
	sleep 30;
[500,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 500!", true] spawn domsg; 
	sleep 30;
[500,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 500!", true] spawn domsg; 
["Penge printeteren er ved at genoplade, den kan startes igen om 1.min!", true] spawn domsg; 
	sleep 60;
