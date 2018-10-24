if(facRun == 10) then 
{ 
facRun = facRun +1;
publicVariable "facRun"

["Penge printeren er startet!", true] spawn domsg;

sleep 30;  
[150,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 150!", true] spawn domsg;  

sleep 30;  
[150,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 150!", true] spawn domsg;  

sleep 30;  
[150,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 150!", true] spawn domsg;  

sleep 30;  
[150,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 150!", true] spawn domsg;  

sleep 30;  
[150,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 150!", true] spawn domsg;  

sleep 30;  
[150,true,true] call Client_fnc_addMoneyToPlayer;
["Penge printeren har givet 150!", true] spawn domsg;  

["Penge printeren nedkøler i 120 sekunder!", true] spawn domsg;  
sleep 120;
["Printeren er færdig med at nedkøle du kan starte maskinen igen!", true] spawn domsg;  
facRun = facRun -1;
publicVariable "facRun";
}
  else
    {
        ["Penge printeren er overtaget af nogle andre vent venligst!", true] spawn domsg;  
    };
