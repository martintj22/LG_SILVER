if(isNil "lotteryPurchases") then { lotteryPurchases = []; };
if(isNil "myLotteryNumbers") then { myLotteryNumbers = []; };
if(casinoVault < 5000) exitwith { ["Vault funds are too low.", true] spawn domsg; };
_total = count myLotteryNumbers;

if(_total > 10) exitwith { ["Too many tickets, 10 max", true] spawn domsg; };


_cashcheck = [1,1000*(1+casinoRate/100)] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",1000*(1+casinoRate/100) call client_fnc_numberText], true] spawn domsg; };

[format["The lottery ticket cost you %1 because the fee is at %2%3.",1000*(1+casinoRate/100) call client_fnc_numberText, casinoRate, "%"], true] spawn domsg;

[1000*(1+casinoRate/100)] call Client_fnc_removeCash;

["mobsterBank", 1000*(1+casinoRate/100), "Add"] remoteexec ["server_fnc_setValue",2];

["mobsterBank", format["%1 (%2) bought %3 worth of lottery tickets.", name player, getplayeruid player, 1000*(1+casinoRate/100) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];


_num1 = round(random(10));
_num2 = round(random(10));
_num3 = round(random(10));

if !(player IN lotteryPurchases) then {
	lotteryPurchases pushback player;
	publicVariable "lotteryPurchases";
};

myLotteryNumbers pushback [_num1,_num2,_num3];

_total = count myLotteryNumbers;