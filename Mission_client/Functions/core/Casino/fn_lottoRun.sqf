if((count lotteryPurchases) == 0) exitwith {};

_num1 = round(random(10));
_num2 = round(random(10));
_num3 = round(random(10));

LotteryWinners = [_num1,_num2,_num3];

[lotteryWinners] remoteexec ["client_fnc_lotteryCheck",lotteryPurchases];

lotteryPurchases = [];

publicVariable "lotteryPurchases";