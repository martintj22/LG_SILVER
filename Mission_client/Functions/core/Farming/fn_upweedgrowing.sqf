_required = _this select 0;
if(checkFinish2) exitwith { ["You need to wait before doing that!", true] spawn domsg; };

if(requiredOutput2 == _required) then { 
	["Looks like it worked!",false] spawn doquickmsg;
	totalskills = totalskills - 1;
	playSound3D ["CG_Jobs\sounds\woodchop\woodchop1.ogg", player, false, getPosasl player, 2, 1, 15];
} else { 
	myDrugValue2 = myDrugValue2 - 1; 
	["Oops!",false] spawn doquickmsg;
	_randomValue = random 30;
	if(_randomValue < 5) exitwith { 
		growingweed = false;
		player removeaction myAction12;
		player removeaction myAction22;
		player removeaction myAction32;
		player removeaction myAction42;
		player removeaction myAction52;
		deletevehicle myDT2;
	};
};
checkFinish2 = true;