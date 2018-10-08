params["_bankType"];

_amount = parseNumber (ctrlText 1400);

if(isNil "cashWithdraw") then { cashWithdraw = 0; };
if(isNil "cashWithdrawTime") then { cashWithdrawTime = time; };

if(cashWithdrawTime + 600 < time) then { cashWithdraw = 0; };
if(!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F"]) && cashWithdraw + _amount > 5000 && cashWithdrawTime + 600 > time && !(_bankType IN [4,6]) ) exitWith { 
	[format["You can only withdraw up to $5,000.00 for every 10 minutes from an ATM. You have currently withdrawn %1. To withdraw more cash, go to a Bank or wait %2.", cashWithdraw call client_fnc_numberText, [cashWithdrawTime + 600 - time, "MM:SS"] call BIS_fnc_secondsToString], true] spawn domsg; 
};

closeDialog 0;

if (_amount > 0) then 
{

	if(_bankType == 0) then {

		_check = [2, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			
			[_amount] call Client_fnc_removeBank;
			[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			[format["You successfully withdrew %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashWithdraw = cashWithdraw + _amount; cashWithdrawTime = time; };

			["personalBank", format["%1 (%2) withdrew %3 from his/her bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough bank balance!", true] spawn domsg;
		
		};
	};

	if(_bankType == 1) then {

		[player, "mafiaBank"] remoteExec ["client_fnc_getremotevar",2];
		waitUntil { !isNil "packet"; };

		if ( player getVariable "Mafia" <= 7 ) exitWith { ["You must be at least rank 8 to withdraw.", true] spawn domsg; };
		if (_amount <= packet) then 
		{
			
			["mafiaBank", _amount, "Remove"] remoteexec ["server_fnc_setValue",2];
			[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			[format["You successfully withdrew %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashWithdraw = cashWithdraw + _amount; cashWithdrawTime = time; };

			["mafiaBank", format["%1 (%2) withdrew %3 from the Mafia bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
			
		} else {
		
			["You do not have enough bank balance!", true] spawn domsg;
		
		};
		packet = nil;

	};
	
	if(_bankType == 2) then {

		[player, "mafiaBank"] remoteExec ["client_fnc_getremotevar",2];
		waitUntil { !isNil "packet"; };

		if (_amount <= packet) then 
		{
			
			["govtBank", _amount, "Remove"] remoteexec ["server_fnc_setValue",2];
			[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			[format["You successfully withdrew %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashWithdraw = cashWithdraw + _amount; cashWithdrawTime = time; };

			["govtBank", format["%1 (%2) withdrew %3 from the Government bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2]; 
			
		} else {
		
			["You do not have enough bank balance!", true] spawn domsg;
		
		};
		packet = nil;

	};

	if(_bankType == 3) then {

		[player, "bikerBank"] remoteExec ["client_fnc_getremotevar",2];
		waitUntil { !isNil "packet"; };

		if ( player getVariable "Biker" <= 7 ) exitWith { ["You must be at least rank 8 to withdraw.", true] spawn domsg; };
		if (_amount <= packet) then 
		{
			
			["bikerBank", _amount, "Remove"] remoteexec ["server_fnc_setValue",2];
			[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			[format["You successfully withdrew %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashWithdraw = cashWithdraw + _amount; cashWithdrawTime = time; };

			["bikerBank", format["%1 (%2) withdrew %3 from the Biker bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2]; 
			
		} else {
		
			["You do not have enough bank balance!", true] spawn domsg;
		
		};
		packet = nil;

	};

if(_bankType == 4) then {

	[player, "casinoVault"] remoteExec ["client_fnc_getremotevar",2];
	waitUntil { !isNil "packet"; };
	
	if ( true ) exitWith { ["You cannot withdraw money from the vault.", true] spawn domsg; };
		if (_amount <= packet) then 
		{
			
			["casinoVault",_amount, "Remove",true] remoteexec ["server_fnc_setValue",2];
			[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			[format["You successfully withdrew %1", _amount call client_fnc_numberText], true] spawn domsg;
			["casinoVault", format["%1 (%2) withdrew %3 from the Casino vault.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2]; 
			
		} else {
		
			["You do not have enough bank balance!", true] spawn domsg;
	
		};
		packet = nil;
		
	};


	if(_bankType == 5) then {

		[player, "mobsterBank"] remoteExec ["client_fnc_getremotevar",2];
		waitUntil { !isNil "packet"; };

		if ( player getVariable "Mobster" <= 7 ) exitWith { ["You must be at least rank 8 to withdraw.", true] spawn domsg; };
		if (_amount <= packet) then 
		{
			
			["mobsterBank", _amount, "Remove"] remoteexec ["server_fnc_setValue",2];
			[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			[format["You successfully withdrew %1", _amount call client_fnc_numberText], true] spawn domsg;
			if (!(typeOf cursorObject IN ["Land_CommonwealthBank","Land_Bank_DED_House_01_F","Land_buildingsCasino2"])) then { cashWithdraw = cashWithdraw + _amount; cashWithdrawTime = time; };

			["mobsterBank", format["%1 (%2) withdrew %3 from the Mobster bank account.", name player, getplayeruid player, _amount call client_fnc_numberText]] remoteExec ["server_fnc_log",2]; 
			
		} else {

			["You do not have enough bank balance!", true] spawn domsg;
		
		};
		packet = nil;

	};

	if(_bankType == 6) then {
		
		_check = false;
		if (_amount <= (client_level_array select 17) ) then {
			_check = true;
		};
		if (_check) then 
		{
			
			[_amount] call Client_fnc_removeStash;
			[_amount,false,true] call Client_fnc_addMoneyToPlayer;
			[format["You successfully withdrew %1", _amount call client_fnc_numberText], true] spawn domsg;

			
		} else {
		
			["You do not have enough bank balance!", true] spawn domsg;
		
		};

	};
	
}
 else  
{

	["Withdrawal amount must be more than $0.00!", true] spawn domsg;
	
};


