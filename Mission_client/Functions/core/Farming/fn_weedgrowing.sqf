WaterArray = ["WARNING: The leaves are fading!","WARNING: The dirt looks too dry!","WARNING: The plant is wiltering!"];
PruneArray = ["WARNING: Has too many leaves covering the buds!","WARNING: Looks overgrown!"];
CoolArray2 = ["WARNING: Is getting brown spots on the leaves!","WARNING: Is drying out from the heat!"];
HeatArray2 = ["WARNING: There is too much moisture!"];
TurnoverArray = ["WARNING: The soil needs turning!"];
private["_stage1","_stage2"];
_count = 0;
checkFinish2 = false;
while{_count < 10 && growingweed} do {
	checkFinish2 = true;
	sleep 10;
	checkFinish2 = false;
	_randomValue = round(random 5);
	if(_randomValue == 1 || _randomvalue == 0) then { requiredOutput2 = "Water"; _message = waterArray call BIS_fnc_selectRandom; [_message,false] spawn domsg; };
	if(_randomValue == 2) then { requiredOutput2 = "Prune"; _message = PruneArray call BIS_fnc_selectRandom;  [_message,false] spawn domsg; };
	if(_randomValue == 3) then { requiredOutput2 = "Cool"; _message = CoolArray2 call BIS_fnc_selectRandom;  [_message,false] spawn domsg; };
	if(_randomValue == 4) then { requiredOutput2 = "Heat"; _message = HeatArray2 call BIS_fnc_selectRandom;  [_message,false] spawn domsg; };
	if(_randomValue == 5) then { requiredOutput2 = "Turnover"; _message = TurnoverArray call BIS_fnc_selectRandom;  [_message,false] spawn domsg; };
	sleep 20;	
	_count = _count + 1;
	MYDT2 setpos [(getpos mydt2 select 0),(getpos mydt2 select 1),(getpos mydt2 select 2)+0.15];
};

if(totalskills < 0) then { totalskills = 0; };

mydrugvalue2 = mydrugvalue2 - totalskills;

if(mydrugvalue2 < 1) then { mydrugvalue2 = 1; };

player removeaction myAction12;
player removeaction myAction22;
player removeaction myAction32;
player removeaction myAction42;
player removeaction myAction52;


if(isNull mydt2) exitwith {};

_randomValue = round(random 3);
_randomValue = _randomValue + 1;



_item = format["CG_WeedBag%1", myDrugValue2];

["Add","Karma",2,"Farming"] call client_fnc_sustain;
["Add","Karma",1,"Stress"] call client_fnc_sustain;


if(player distance [1409.98,5740.65,0.00143814] < 400) then { 
	_randomValue = round(random 5);
	_randomvalue = _randomvalue + _randomvalue;
};

[format["You grew %1 bags of weed!",_randomvalue], true] spawn domsg;

while {_randomValue > 0} do { player additem _item; _randomValue = _randomValue - 1; };

deletevehicle myDT2;
player additem "NP_GrowingPlot";
