// sustain player - remove or add statuses here!
// Koil

//karma, health, drink, battery, poop. array save
private ["_selection","_change","_arrayselection","_new"];

_adjust = param [0,"",[""]];
_type = param [1,"",[""]];
_amount = param [2,0,[0]];
_jobName = param [3,"",[""]];


	//["add","Karma",1,"MoneyOwed"] call client_fnc_sustain;
	//["add","Karma",1,"Fedex Worker"] call client_fnc_sustain;
	//["remove","Karma",1,"Default"] call client_fnc_sustain;
if(_type == "Karma") then {

	_selection = 0;

	if(_jobName == "Default") then {
		_arraySelection = 0;

		if (_adjust == "Add") then {
		//	["You just gained Experience!.",false] spawn doquickmsg;
		} else {
		//	["You just lost experience..",false] spawn doquickmsg;
		};

	};

	if(_jobName == "Fedex Worker") then {
		_arraySelection = 1;

		if (_adjust == "Add") then {
			["You just gained Fedex Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Fedex experience..",false] spawn doquickmsg;
		};

	};//

	if(_jobName == "Security") then {
		_arraySelection = 2;

		if (_adjust == "Add") then {
			["You just gained Security Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Security experience..",false] spawn doquickmsg;
		};

	};

	if(_jobName == "Radio Presenter") then {
		_arraySelection = 3;

		if (_adjust == "Add") then {
			["You just gained Radio Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Radio experience..",false] spawn doquickmsg;
		};

	};//

	if(_jobName == "Tow Truck Driver") then {
		_arraySelection = 4;

		if (_adjust == "Add") then {
			["You just gained Tow Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Tow experience..",false] spawn doquickmsg;
		};

	};//

	if(_jobName == "Garbage Man") then {
		_arraySelection = 5;

		if (_adjust == "Add") then {
			["You just gained Garbage Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Garbage experience..",false] spawn doquickmsg;
		};

	};//

	if(_jobName == "News Reporter") then {
		_arraySelection = 6;

		if (_adjust == "Add") then {
			["You just gained News Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost News experience..",false] spawn doquickmsg;
		};

	};//

	if(_jobName == "Repairman") then {
		_arraySelection = 7;

		if (_adjust == "Add") then {
			["You just gained Repairman Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Repairman experience..",false] spawn doquickmsg;
		};


	};//

	if(_jobName == "Farming") then {
		_arraySelection = 8;

		if (_adjust == "Add") then {
			["You just gained Farming Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Farming experience..",false] spawn doquickmsg;
		};


	};//

	if(_jobName == "Taxi Driver") then {
		_arraySelection = 9;


		if (_adjust == "Add") then {
			["You just gained Public Transport Experience!.",false] spawn doquickmsg;
		} else {
			["You just lost Public Transport experience..",false] spawn doquickmsg;
		};


	};

	if(_jobName == "Agility") then {
		_arraySelection = 10;


		if (_adjust == "Add") then {
			["You just gained Agility!.",false] spawn domsg;
		} else {
			["You just lost your Agility..",false] spawn domsg;
		};


	};

	if(_jobName == "Strength") then {
		_arraySelection = 11;


		if (_adjust == "Add") then {
			["You just gained Strength!.",false] spawn domsg;
		} else {
			["You just lost Strength..",false] spawn domsg;
		};


	};

	if(_jobName == "Intellect") then {
		_arraySelection = 12;

		if (_adjust == "Add") then {
			["You just gained Intellect!.",false] spawn domsg;
		} else {
			["You just lost Intellect..",false] spawn domsg;
		};

	};

	if(_jobName =="Stamina") then {
		_arraySelection = 13;


		if (_adjust == "Add") then {
			["You just gained Stamina!.",false] spawn domsg;
		} else {
			["You just lost Stamina..",false] spawn domsg;
		};


	};

	if(_jobName == "Weight") then {
		_arraySelection = 14;


		if (_adjust == "Add") then {
			["You just gained Weight!.",false] spawn domsg;
			
		} else {
			["You just lost Weight..",false] spawn domsg;
		};


	};
	//["Add","Karma",1,"Stress"] call client_fnc_sustain;
	if(_jobName == "Stress") then {
		_arraySelection = 15;

		if (_adjust == "Add") then {
			["You gained Stress!",false] spawn domsg;
		} else {
			["You lost Stress!",false] spawn domsg;
		};

	};

	if(_jobName == "DirtyMoney") then {
		_arraySelection = 16;

		if (_adjust == "Add") then {
			//["You gained reputation as a Crime Lord!.",false] spawn domsg;
		} else {
			//["You lost reputation as a Crime Lord!.",false] spawn domsg;
		};

	};

	if(_jobName == "DirtyStash") then {
		_arraySelection = 17;

		if (_adjust == "Add") then {
			//["You gained reputation as a Crime Lord!.",false] spawn domsg;
		} else {
			//["You lost reputation as a Crime Lord!.",false] spawn domsg;
		};

	};

	if(_jobName == "Bail") then {
		_arraySelection = 18;

		if (_adjust == "Add") then {
			//["You gained reputation as a Crime Lord!.",false] spawn domsg;
		} else {
			//["You lost reputation as a Crime Lord!.",false] spawn domsg;
		};

	};

	_new = client_level_array SELECT _arrayselection;

	if(_adjust == "Add") then { _new = _new + _amount; } else {  _new = _new - _amount;};

	if(_adjust == "Set") then { _new = _amount; };


	if(_new < 0) then { _new = 0; };
	client_level_array SET [_arraySelection,_new];
	_change = client_level_array;

};




if(_type == "Food") then {
	if(_adjust == "Add") then { [format["+%1 Food",_amount],true] spawn domsg; client_hunger = client_hunger + _amount; if (vehicle player == player) then { player playmove "vvv_anim_eat"; }; };
	if(_adjust == "Remove") then { client_hunger = client_hunger - _amount; };
	if(client_hunger > 100) then {client_hunger = 100;};
	if(client_hunger < 0) then {client_hunger = 0;};
	_selection = 1;
	_change = client_hunger;
	[] spawn client_fnc_hudhunger;
};

if(_type == "Drink") then {
	if(_adjust == "Add") then { [format["+%1 Drink",_amount],true] spawn domsg; client_thirst = client_thirst + _amount; if (vehicle player == player) then { player playmove "vvv_anim_drink"; }; };
	if(_adjust == "Remove") then { client_thirst = client_thirst - _amount; };
	if(client_thirst > 100) then {client_thirst = 100;};
	if(client_thirst < 0) then {client_thirst = 0;};
	_selection = 2;
	_change = client_thirst;
	[] spawn client_fnc_hudthirst;		
};

if(_type == "Battery") then {
	if(_adjust == "Add") then { client_battery = client_battery + _amount; };
	if(_adjust == "Remove") then { client_battery = client_battery - _amount; };
	if(client_battery > 100) then {client_battery = 100;};
	if(client_battery < 0) then {client_battery = 0;};	
	_selection = 3;
	_change = client_battery;
	[] spawn client_fnc_hudbattery;			
};

if(_type == "Poop") then {
	if(_adjust == "Add") then { client_poop = client_poop + _amount; };
	if(_adjust == "Remove") then { client_poop = client_poop - _amount; };
	if(client_poop > 100) then {client_poop = 100;};
	if(client_poop < 0) then {client_poop = 0;};
	_selection = 4;
	_change = client_poop;			
};
//health is 5

if(_type == "unhealthiness") then {
	if(_adjust == "Add") then { ["Remove","Karma",1,"Stamina"] call client_fnc_sustain; ["Remove","Karma",1,"Agility"] call client_fnc_sustain; ["Remove","Karma",1,"Strength"] call client_fnc_sustain; ["Add","Karma",5,"Weight"] call client_fnc_sustain;  client_unhealthiness = client_unhealthiness + _amount; };
	if(_adjust == "Remove") then { client_unhealthiness = client_unhealthiness - _amount; };
	if(client_unhealthiness > 100) then { client_unhealthiness = 100;};
	if(client_unhealthiness < 0) then { client_unhealthiness = 0;};	
	if(client_unhealthiness > 60) then {
		["You are currently very unhealthy", true] spawn domsg;
		_roll = 100 - client_unhealthiness;
		_chance = random(_roll);
		_wtf = _chance + client_unhealthiness;
		if(_wtf > 90 && _adjust == "Add") then {
			[69] spawn client_fnc_givedisease;
		};
	};
	_change = client_unhealthiness;	
	_selection = 6;	
	[] spawn client_fnc_hudunhealthiness;
};

//8 left open for licenses

//LICENSES [0,0,0,0,0,0] -- groundvehicle / gun / mining / woodlogging / fishing / 



if(_type == "license") then {

	if(_adjust == "Add") then { 

		if( !(_amount IN licenseArray) ) then {

			if(_amount == 0) then { [getplayeruid player, 0, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Driver's License.",false] spawn domsg; };
			if(_amount == 1) then { [getplayeruid player, 1, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Class 1 Weapons License.",false] spawn domsg;  };
			if(_amount == 2) then { [getplayeruid player, 2, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Mining License.",false] spawn domsg;  };
			if(_amount == 3) then { [getplayeruid player, 3, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Logging License.",false] spawn domsg; };
			if(_amount == 4) then { [getplayeruid player, 4, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Fishing License.",false] spawn domsg; };
			if(_amount == 5) then { [getplayeruid player, 5, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Truck License.",false] spawn domsg; };
			if(_amount == 6) then { [getplayeruid player, 6, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Pilot's License.",false] spawn domsg; };
			if(_amount == 7) then { [getplayeruid player, 7, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Oil Trade License.",false] spawn domsg; };
			if(_amount == 8) then { [getplayeruid player, 8, 1] remoteExec ["server_fnc_licenses",2]; ["You received a PD SWAT Leader Certification.",false] spawn domsg; };
			if(_amount == 9) then { [getplayeruid player, 9, 1] remoteExec ["server_fnc_licenses",2]; ["You received a PD SWAT Certification.",false] spawn domsg; };
			if(_amount == 10) then { [getplayeruid player, 10, 1] remoteExec ["server_fnc_licenses",2]; ["You received a PD Scuba Leader Certification.",false] spawn domsg; };
			if(_amount == 11) then { [getplayeruid player, 11, 1] remoteExec ["server_fnc_licenses",2]; ["You received a PD Scuba Certification.",false] spawn domsg; };
			if(_amount == 12) then { [getplayeruid player, 12, 1] remoteExec ["server_fnc_licenses",2]; ["You received a PD Air Leader Certification.",false] spawn domsg; };
			if(_amount == 13) then { [getplayeruid player, 13, 1] remoteExec ["server_fnc_licenses",2]; ["You received a PD Air Certification.",false] spawn domsg; };
			if(_amount == 14) then { [getplayeruid player, 14, 1] remoteExec ["server_fnc_licenses",2]; ["You received a DoC CRT Leader Certification.",false] spawn domsg; };
			if(_amount == 15) then { [getplayeruid player, 15, 1] remoteExec ["server_fnc_licenses",2]; ["You received a DoC CRT Certification.",false] spawn domsg; };
			if(_amount == 16) then { [getplayeruid player, 16, 1] remoteExec ["server_fnc_licenses",2]; ["You received a DoC Air Leader Certification.",false] spawn domsg; };
			if(_amount == 17) then { [getplayeruid player, 17, 1] remoteExec ["server_fnc_licenses",2]; ["You received a DoC Air Certification.",false] spawn domsg; };
			if(_amount == 18) then { [getplayeruid player, 18, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Boat License.",false] spawn domsg; };
			if(_amount == 19) then { [getplayeruid player, 19, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Casino Membership.",false] spawn domsg; };
			if(_amount == 20) then { [getplayeruid player, 20, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Bar Certification.",false] spawn domsg; };
			if(_amount == 21) then { [getplayeruid player, 21, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Bus License.",false] spawn domsg; };
			if(_amount == 22) then { [getplayeruid player, 22, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Class 2 Weapons License.",false] spawn domsg; };
			if(_amount == 23) then { [getplayeruid player, 23, 1] remoteExec ["server_fnc_licenses",2]; ["You received a FD Air Leader Certification.",false] spawn domsg; };
			if(_amount == 24) then { [getplayeruid player, 24, 1] remoteExec ["server_fnc_licenses",2]; ["You received a FD Air Certification.",false] spawn domsg; };
			if(_amount == 25) then { [getplayeruid player, 25, 1] remoteExec ["server_fnc_licenses",2]; ["You received a FD Scuba Leader Certification.",false] spawn domsg; };
			if(_amount == 26) then { [getplayeruid player, 26, 1] remoteExec ["server_fnc_licenses",2]; ["You received a FD Scuba Certification.",false] spawn domsg; };
			if(_amount == 27) then { [getplayeruid player, 27, 1] remoteExec ["server_fnc_licenses",2]; ["You received a Paralegal License.",false] spawn domsg; };

			licenseArray = licenseArray + [_amount];
			
		};

	};

	if(_adjust == "Remove") then { 

		if( (_amount IN licenseArray) ) then {
				
			if(_amount == 0) then { [getplayeruid player, 0, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Driver's License.",false] spawn domsg; };
			if(_amount == 1) then { [getplayeruid player, 1, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Class 1 Weapons License.",false] spawn domsg; };
			if(_amount == 2) then { [getplayeruid player, 2, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Mining License.",false] spawn domsg; };
			if(_amount == 3) then { [getplayeruid player, 3, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Logging License.",false] spawn domsg; };
			if(_amount == 4) then { [getplayeruid player, 4, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Fishing License.",false] spawn domsg; };
			if(_amount == 5) then { [getplayeruid player, 5, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Truck License.",false] spawn domsg; };
			if(_amount == 6) then { [getplayeruid player, 6, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Pilot's License.",false] spawn domsg; };
			if(_amount == 7) then { [getplayeruid player, 7, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Oil Trade License.",false] spawn domsg; };
			if(_amount == 8) then { [getplayeruid player, 8, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your PD SWAT Leader Certification.",false] spawn domsg; };
			if(_amount == 9) then { [getplayeruid player, 9, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your PD SWAT Certification.",false] spawn domsg; };
			if(_amount == 10) then { [getplayeruid player, 10, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your PD Scuba Leader Certification.",false] spawn domsg; };
			if(_amount == 11) then { [getplayeruid player, 11, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your PD Scuba Certification.",false] spawn domsg; };
			if(_amount == 12) then { [getplayeruid player, 12, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your PD Air Leader Certification.",false] spawn domsg; };
			if(_amount == 13) then { [getplayeruid player, 13, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your PD Air Certification.",false] spawn domsg; };
			if(_amount == 14) then { [getplayeruid player, 14, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your DoC CRT Leader Certification.",false] spawn domsg; };
			if(_amount == 15) then { [getplayeruid player, 15, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your DoC CRT Certification.",false] spawn domsg; };
			if(_amount == 16) then { [getplayeruid player, 16, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your DoC Air Leader Certification.",false] spawn domsg; };
			if(_amount == 17) then { [getplayeruid player, 17, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your DoC Air Certification.",false] spawn domsg; };
			if(_amount == 18) then { [getplayeruid player, 18, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Boat License.",false] spawn domsg; };
			if(_amount == 19) then { [getplayeruid player, 19, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Casino Membership.",false] spawn domsg; };
			if(_amount == 20) then { [getplayeruid player, 20, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Bar Certification.",false] spawn domsg; };
			if(_amount == 21) then { [getplayeruid player, 21, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Bus License.",false] spawn domsg; };
			if(_amount == 22) then { [getplayeruid player, 22, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Class 2 Weapons License.",false] spawn domsg; };
			if(_amount == 23) then { [getplayeruid player, 23, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your FD Air Leader Certification.",false] spawn domsg; };
			if(_amount == 24) then { [getplayeruid player, 24, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your FD Air Certification.",false] spawn domsg; };
			if(_amount == 25) then { [getplayeruid player, 25, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your FD Scuba Leader Certification.",false] spawn domsg; };
			if(_amount == 26) then { [getplayeruid player, 26, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your FD Scuba Certification.",false] spawn domsg; };
			if(_amount == 27) then { [getplayeruid player, 27, 2] remoteExec ["server_fnc_licenses",2]; ["You lost your Paralegal License.",false] spawn domsg; };


			licenseArray = licenseArray - [_amount];
			
		};

	};

	

};



if(_type == "sex") then {
	if(female) then { _change = 1; } else { _change = 2; };
	_selection = 9;	
};


if(_type == "drug") then {
	["remove","unhealthiness",1] call client_fnc_sustain;
	if(client_marijuana > 0) then { client_marijuana = client_marijuana - 1; if(client_marijuana == 0) then { player setCustomAimCoef 1; }; if(client_marijuana == 1) then { [player,18] spawn drug_marijuana_effects; 429 cutRsc ["HUDmarijuana","PLAIN"]; };   };
	if(client_cocaine > 0) then { client_cocaine = client_cocaine - 1; if(client_cocaine == 0) then { player setAnimSpeedCoef 1; }; if(client_cocaine == 1) then { [player,18] spawn drug_cocaine_effects; 430 cutRsc ["HUDcocaine","PLAIN"]; };  };
	if(client_meth > 0) then { client_meth = client_meth - 1; if(client_meth == 0) then {}; if(client_meth == 1) then { 431 cutRsc ["HUDmeth","PLAIN"]; [player,15] spawn drug_lsd_effects; };  };
	if(client_heroin > 0) then { client_heroin = client_heroin - 1; if(client_heroin == 0) then { player setUnitRecoilCoefficient 2.8; }; if(client_heroin == 1) then { 432 cutRsc ["HUDheroin","PLAIN"]; [player,18] spawn drug_heroin_effects; };  };
	if(client_energy > 0) then { client_energy = client_energy - 1; if(client_energy == 0) then { player enablefatigue true; player enablestamina true; }; if(client_energy == 1) then { 433 cutRsc ["HUDenergy","PLAIN"]; };  };
	if(client_drunk > 0) then { client_drunk = client_drunk - 1; [player,15] spawn drug_beer_effects; };
	if(client_donuts > 0) then { client_donuts = client_donuts - 1; if(client_donuts == 0) then { player setCustomAimCoef 1; player setUnitRecoilCoefficient 1.5; ["Your stomach grumbles", true] spawn domsg; }; };		
	if(extraCash > 0) then { extraCash = extraCash - 1; if(extraCash == 0) then { ["You no longer feel Charasmatic..",false] spawn domsg; }; };
};

_mydrugeffects = [client_marijuana,client_cocaine,client_meth,client_heroin,client_energy];


_myStatuses = player getvariable "statuses";

if(!isNil "_selection") then {
	_myStatuses set [_selection, _change]; 
};

_myInjuriesToUpdate = player getvariable "playerInjuries";
_myStatuses set [7, _myInjuriesToUpdate];  
_myStatuses set [10, _myDrugEffects]; 
player setVariable ["statuses",_mystatuses,false];


if(_type == "MafiaMoney") then {

	if(_adjust == "Add") then { moneyOwed = moneyOwed + _amount; };
	if(_adjust == "Remove") then { moneyOwed = moneyOwed - _amount; };
	if(_adjust == "Set") then { moneyOwed = _amount; };

	if(moneyOwed < 0) then {moneyOwed = 0;};

	loan SET [1, moneyOwed];
	_myStatuses set [11, Loan]; 

	player setVariable ["statuses",_mystatuses,false];

	[player,Loan] remoteexec ["server_fnc_updateMafiaOwed",2];
	
};

if((lastsync + 15) < time) then {
	lastsync = time; 
	[player, "statuses", (player getvariable "statuses")] remoteExec ["Server_fnc_setVariable",2];
};


// experience food drink battery poop health unhealthiness [playerinjuries], [licneses], sex, [4 drug effects], [moneyowed], married too
// _statuses = [0,100,100,100,0,0,0,[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0],0,[0,0,0,0,0],["nobody",0,"no reason","NO DATE"],_uid];