//tells player the money current owed
//[player] remoteexec ["server_fnc_MafiaOwed",2];

params["_player"];

[MafiaLoan1,MafiaLoan2] remoteExec ["client_fnc_LoanUpdate",_player];
