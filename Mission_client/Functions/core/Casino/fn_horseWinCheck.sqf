params["_winners","_winning"];

if(isnil "MyHorseBets") then { myhorsebets = []; };

_winnings = 0;
_winning = 0;
_winamt = 0;
{
	if((_x select 0) IN _winners) then { 

		_pia = _winners FIND (_x select 0);
		if(_pia == 0 && (_x select 2 != 0)) then { _winamt = (_x select 1) * 0.75; };
		if(_pia == 0 && (_x select 2 == 0)) then { _winamt = (_x select 1) * 0.65; };
		if(_pia == 1 && (_x select 2 == 0)) then { _winamt = (_x select 1) * 0.60; };
		if(_pia == 2 && (_x select 2 == 0)) then { _winamt = (_x select 1) * 0.55; };	
		_winnings = _winnings + _winamt; 
	};
}foreach myhorsebets;

if(count myhorsebets == 0) exitwith {};

myhorsebets = [];

[player, "casinoVault"] remoteExec ["client_fnc_getremotevar",2];
waitUntil { !isNil "packet"; };
_casinoVault = packet;
packet = nil;

if(_winnings*((0.75)+((1-casinoRate/100)/5)) > _casinoVault) then {

	_winning = _casinoVault;

	[format["You won %1 on the last horse race but only received %2 because the casino ran out of cash.", _winnings call client_fnc_numberText, _winning call client_fnc_numberText],false] spawn domsg;
	
	["casinoVault",_winning, "Remove",true] remoteexec ["server_fnc_setValue",2];

} else {

	_winning = _winnings;

	[format["You won %1 on the last horse race.", _winning call client_fnc_numberText],false] spawn domsg;
	
	["casinoVault",_winning*((0.75)+((1-casinoRate/100)/5)), "Remove",true] remoteexec ["server_fnc_setValue",2];

};

if(_winning < 1) exitwith {};
[_winning,true,true] call Client_fnc_addMoneyToPlayer;

["casinoVault", format["%1 (%2) won %3 and received %4 from horse betting and the casino lost %5.", name player, getplayeruid player, _winnings call client_fnc_numberText, _winning call client_fnc_numberText, _winning*((0.75)+((1-casinoRate/100)/5)) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];


