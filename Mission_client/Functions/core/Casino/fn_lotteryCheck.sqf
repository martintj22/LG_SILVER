if(isNil "myLotteryNumbers") exitwith { myLotteryNumbers = []; }; //what? lol

params["_lotteryWinners","_winning"];

[player, "casinoVault"] remoteExec ["client_fnc_getremotevar",2];
waitUntil { !isNil "packet"; };
_casinoVault = packet;
packet = nil;

_numbercount = 0;
{
	if((_x select 0) == (_LotteryWinners select 0) && _numbercount == 0) then { _numbercount = 1; };
	if((_x select 0) == (_LotteryWinners select 0) && (_x select 1) == (_LotteryWinners select 1) && _numbercount < 3) then { _numbercount = 2; };
	if((_x select 0) == (_LotteryWinners select 0) && (_x select 1) == (_LotteryWinners select 1) && (_x select 2) == (_LotteryWinners select 2)  && _numbercount < 4) then { _numbercount = 3; };
}foreach myLotteryNumbers;

myLotteryNumbers = [];

if(_numbercount == 0) exitwith { 
	["You didnt win the lottery!", true] spawn domsg; 
};

if(_numbercount == 1) exitwith { 
	["You didnt win the lottery - you did pick the first number though!", true] spawn domsg; 
};

if(_numbercount == 2) exitwith { 

	_prize = 50000;

	_nearCasino = [6810.04,4639.41,0.00144005] nearEntities ["Man", 35];


	if(_prize*((0.75)+((1-casinoRate/100)/5)) > _casinoVault) then {

		_winning = _casinoVault;

		[format["You won %1 in the lottery but only received %2 because the casino ran out of cash.", _prize call client_fnc_numberText, _winning call client_fnc_numberText],false] spawn domsg;
		[format["Someone just won %1 but only received %2 because the casino ran out of cash.", _prize call client_fnc_numberText, _winning call client_fnc_numberText],false] remoteexec ["domsg",_nearCasino]; 
	
		["casinoVault",_winning, "Remove",true] remoteexec ["server_fnc_setValue",2];

	} else {

		_winning = _prize;

		[format["You won %1 in the lottery.", _winning call client_fnc_numberText],false] spawn domsg;
		[format["Someone just won %1.", _winning call client_fnc_numberText],false] remoteexec ["domsg",_nearCasino - [player]]; 

		["casinoVault",_winning*((0.75)+((1-casinoRate/100)/5)), "Remove",true] remoteexec ["server_fnc_setValue",2];

	};

	[_winning,true,true] call Client_fnc_addMoneyToPlayer;

	["casinoVault", format["%1 (%2) won %3 and received %4 from the lottery and the casino lost %5.", name player, getplayeruid player, _prize call client_fnc_numberText, _winning call client_fnc_numberText, _winning*((0.75)+((1-casinoRate/100)/5)) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

};	


if(_numbercount == 3) exitwith { 

	_prize = 500000;
	
	 _nearCasino = [6810.04,4639.41,0.00144005] nearEntities ["Man", 35];

	if(_prize*((0.75)+((1-casinoRate/100)/5)) > _casinoVault) then {

		_winning = _casinoVault;

		[format["You won %1 in the lottery but only received %2 because the casino ran out of cash.", _prize call client_fnc_numberText, _winning call client_fnc_numberText],false] spawn domsg;
		[format["Someone just won %1 but only received %2 because the casino ran out of cash.", _prize call client_fnc_numberText, _winning call client_fnc_numberText],false] remoteexec ["domsg",_nearCasino - [player]]; 

		["casinoVault",_winning, "Remove",true] remoteexec ["server_fnc_setValue",2];

	} else {

		_winning = _prize;

		[format["You won %1 in the lottery.", _winning call client_fnc_numberText],false] spawn domsg;
		
		[format["Someone just won %1.", _winning call client_fnc_numberText],false] remoteexec ["domsg",_nearCasino]; 

		["casinoVault",_winning*((0.75)+((1-casinoRate/100)/5)), "Remove",true] remoteexec ["server_fnc_setValue",2];

	};

	[_winning,true,true] call Client_fnc_addMoneyToPlayer;

	["casinoVault", format["%1 (%2) won %3 and received %4 from the lottery and the casino lost %5.", name player, getplayeruid player, _prize call client_fnc_numberText, _winning call client_fnc_numberText, _winning*((0.75)+((1-casinoRate/100)/5)) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
	
};

