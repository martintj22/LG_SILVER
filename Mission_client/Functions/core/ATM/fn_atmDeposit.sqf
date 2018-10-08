params["_bankType"];

_amount = parseNumber (ctrlText 1400);

if(isNil "cashDeposited") then { cashDeposited = 0; };
if(isNil "cashDepositedTime") then { cashDepositedTime = time; };

if(cashDepositedTime + 600 < time) then { cashDeposited = 0; };
if(!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F"]) && cashDeposited + _amount > 5000 && cashDepositedTime + 600 > time && !(_bankType IN [4,6]) ) exitWith { 
	[format["You can only deposit up to $5,000.00 for every 10 minutes from an ATM. You have currently deposited %1. To deposit more cash, go to a Bank or wait %2.", cashDeposited call client_fnc_numberText, [cashDepositedTime + 600 - time, "MM:SS"] call BIS_fnc_secondsToString], true] spawn domsg; 
};

closeDialog 0;

if (_amount > 0) then 
{

	if(_bankType == 0) then {

		_check = [1, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			if( ((player getvariable "cashinhand") - _amount) < (client_level_array select 16) ) exitWith {
				[format["The bank does not accept your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
			};
		
			[_amount, true] call Client_fnc_removeCash;
			[_amount,true,true] call Client_fnc_addMoneyToBank;
			[format["You successfully deposited %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashDeposited = cashDeposited + _amount; cashDepositedTime = time; };

			["personalBank", format["%1 (%2) deposited %3 into his/her bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough cash!", true] spawn domsg;
		
		};
	};

	if(_bankType == 1) then {
		
		_check = [1, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			if( ((player getvariable "cashinhand") - _amount) < (client_level_array select 16) ) exitWith {
				[format["The bank does not accept your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
			};

			["mafiaBank", _amount, "Add"] remoteexec ["server_fnc_setValue",2];
			[_amount, true] call Client_fnc_removeCash;
			[format["You successfully deposited %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashDeposited = cashDeposited + _amount; cashDepositedTime = time; };

			["mafiaBank", format["%1 (%2) deposited %3 into the Mafia bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough cash!", true] spawn domsg;
		
		};

	};

	if(_bankType == 2) then {
		
		_check = [1, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			if( ((player getvariable "cashinhand") - _amount) < (client_level_array select 16) ) exitWith {
				[format["The bank does not accept your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
			};
			
			["govtBank", _amount, "Add"] remoteexec ["server_fnc_setValue",2];
			[_amount, true] call Client_fnc_removeCash;
			[format["You successfully deposited %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashDeposited = cashDeposited + _amount; cashDepositedTime = time; };

			["govtBank", format["%1 (%2) deposited %3 into the Government bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough cash!", true] spawn domsg;
		
		};

	};


	if(_bankType == 3) then {
		
		_check = [1, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			if( ((player getvariable "cashinhand") - _amount) < (client_level_array select 16) ) exitWith {
				[format["The bank does not accept your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
			};


			["bikerBank", _amount, "Add"] remoteexec ["server_fnc_setValue",2];
			[_amount, true] call Client_fnc_removeCash;
			[format["You successfully deposited %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashDeposited = cashDeposited + _amount; cashDepositedTime = time; };

			["bikerBank", format["%1 (%2) deposited %3 into the Biker bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough cash!", true] spawn domsg;
		
		};

	};

	if(_bankType == 4) then {
		
		_check = [1, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			if( ((player getvariable "cashinhand") - _amount) < (client_level_array select 16) ) exitWith {
				[format["The vault does not accept your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
			};
			
			["casinoVault", _amount, "Add",true] remoteexec ["server_fnc_setValue",2];

			[_amount, true] call Client_fnc_removeCash;
			[format["You successfully deposited %1", _amount call client_fnc_numberText], true] spawn domsg;
			["casinoVault", format["%1 (%2) deposited %3 into the Casino vault.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough cash!", true] spawn domsg;
		
		};

	};

	if(_bankType == 5) then {
		
		_check = [1, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			if( ((player getvariable "cashinhand") - _amount) < (client_level_array select 16) ) exitWith {
				[format["The bank does not accept your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
			};
			
			["mobsterBank", _amount, "Add"] remoteexec ["server_fnc_setValue",2];
			[_amount, true] call Client_fnc_removeCash;
			[format["You successfully deposited %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashDeposited = cashDeposited + _amount; cashDepositedTime = time; };
			
			["mobsterBank", format["%1 (%2) deposited %3 into the Mobster bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough cash!", true] spawn domsg;
		
		};

	};
	
	if(_bankType == 6) then {

		_check = [1, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			if ((client_level_array select 16) - _amount < 0) exitWith 
			{
				[format["You can only stash your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
			};

			[_amount] call Client_fnc_removeCash;
			[_amount] call Client_fnc_addMoneyToStash;
			[format["You successfully deposited %1", _amount call client_fnc_numberText], true] spawn domsg;
				
		} else {
		
			["You do not have enough cash!", true] spawn domsg;
		
		};
		
	};
	

}
 else  
{

	["Your deposit amount must be more than $0.00!", true] spawn domsg; 
	
};
