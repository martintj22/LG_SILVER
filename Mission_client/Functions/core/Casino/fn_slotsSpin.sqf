/*
	File: fn_slotSpin.sqf
	Author: Jacob "PapaBear" Tyler
	Description: Takes bet, spins slots, determines if win, pays

*/
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display","_winning"];
_betamt = param [0,1,[0]];
if(casinoVault < 5000) exitwith { ["Vault funds are too low.", true] spawn domsg; };
_cashcheck = [1,_betamt*(1+casinoRate/100)] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",_betamt call client_fnc_numberText], true] spawn domsg; };

[format["The slots cost you %1 because the fee is at %2%3.",_betamt*(1+casinoRate/100) call client_fnc_numberText, casinoRate, "%"], true] spawn domsg;

[_betamt*(1+casinoRate/100)] call Client_fnc_removeCash;

["mobsterBank", _betamt*(1+casinoRate/100), "Add"] remoteexec ["server_fnc_setValue",2];

["mobsterBank", format["%1 (%2) bought %3 worth of slots.", name player, getplayeruid player, _betamt*(1+casinoRate/100) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

disableSerialization;
_display = findDisplay 5780;

_slotPic1 = _display displayCtrl 5771;
_slotPic2 = _display displayCtrl 5772;
_slotPic3 = _display displayCtrl 5773;
_winningsText = _display displayCtrl 5775;
_bet1 = _display displayCtrl 5778;
_bet2 = _display displayCtrl 5779;
_bet3 = _display displayCtrl 5781;
_bet4 = _display displayCtrl 5782;

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;

uiSleep 1;
_number = ceil(random 7);
_pplayer = _this select 0;

if (_number == 0) then {_slot1 = 0; _slotPic1 ctrlSetText "\cg_sndimg\icons\slot_zero.paa";};
if (_number == 1) then {_slot1 = 100; _slotPic1 ctrlSetText "\cg_sndimg\icons\1.paa";};
if (_number == 2) then {_slot1 = 200; _slotPic1 ctrlSetText "\cg_sndimg\icons\2.paa";};
if (_number == 3) then {_slot1 = 300; _slotPic1 ctrlSetText "\cg_sndimg\icons\3.paa";};
if (_number == 4) then {_slot1 = 400; _slotPic1 ctrlSetText "\cg_sndimg\icons\4.paa";};
if (_number == 5) then {_slot1 = 500; _slotPic1 ctrlSetText "\cg_sndimg\icons\5.paa";};
if (_number == 6) then {_slot1 = 600; _slotPic1 ctrlSetText "\cg_sndimg\icons\6.paa";};
if (_number == 7) then {_slot1 = 700; _slotPic1 ctrlSetText "\cg_sndimg\icons\7.paa";};
life_action_inUse = true;	


uiSleep 0.5;
_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot2 = 0; _slotPic2 ctrlSetText "\cg_sndimg\icons\slot_zero.paa";};
if (_number == 1) then {_slot2 = 10; _slotPic2 ctrlSetText "\cg_sndimg\icons\1.paa";};
if (_number == 2) then {_slot2 = 20; _slotPic2 ctrlSetText "\cg_sndimg\icons\2.paa";};
if (_number == 3) then {_slot2 = 30; _slotPic2 ctrlSetText "\cg_sndimg\icons\3.paa";};
if (_number == 4) then {_slot2 = 40; _slotPic2 ctrlSetText "\cg_sndimg\icons\4.paa";};
if (_number == 5) then {_slot2 = 50; _slotPic2 ctrlSetText "\cg_sndimg\icons\5.paa";};
if (_number == 6) then {_slot2 = 60; _slotPic2 ctrlSetText "\cg_sndimg\icons\6.paa";};
if (_number == 7) then {_slot2 = 70; _slotPic2 ctrlSetText "\cg_sndimg\icons\7.paa";};


uiSleep 0.5;
_number = ceil(random 7);
_pplayer = _this select 0;

if (_number == 0) then {_slot3 = 0; _slotPic3 ctrlSetText "\cg_sndimg\icons\slot_zero.paa";};
if (_number == 1) then {_slot3 = 1; _slotPic3 ctrlSetText "\cg_sndimg\icons\1.paa";};
if (_number == 2) then {_slot3 = 2; _slotPic3 ctrlSetText "\cg_sndimg\icons\2.paa";};
if (_number == 3) then {_slot3 = 3; _slotPic3 ctrlSetText "\cg_sndimg\icons\3.paa";};
if (_number == 4) then {_slot3 = 4; _slotPic3 ctrlSetText "\cg_sndimg\icons\4.paa";};
if (_number == 5) then {_slot3 = 5; _slotPic3 ctrlSetText "\cg_sndimg\icons\5.paa";};
if (_number == 6) then {_slot3 = 6; _slotPic3 ctrlSetText "\cg_sndimg\icons\6.paa";};
if (_number == 7) then {_slot3 = 7; _slotPic3 ctrlSetText "\cg_sndimg\icons\7.paa";};

uiSleep 0.5;

_slot = _slot1 + _slot2 + _slot3;

//cases for wins
switch (_slot) do
{

case 331:{_winnings = 60;};
case 332:{_winnings = 60;};
case 334:{_winnings = 60;};
case 335:{_winnings = 60;};
case 336:{_winnings = 60;};
case 337:{_winnings = 60;};

case 133:{_winnings = 60;};
case 233:{_winnings = 60;};
case 433:{_winnings = 60;};
case 533:{_winnings = 60;};
case 633:{_winnings = 60;};
case 733:{_winnings = 60;};

case 313:{_winnings = 60;};
case 323:{_winnings = 60;};
case 353:{_winnings = 60;};
case 343:{_winnings = 60;};
case 363:{_winnings = 60;};
case 373:{_winnings = 60;};

case 441:{_winnings = 70;};
case 442:{_winnings = 70;};
case 443:{_winnings = 70;};
case 445:{_winnings = 70;};
case 446:{_winnings = 70;};
case 447:{_winnings = 70;};
case 144:{_winnings = 70;};
case 244:{_winnings = 70;};
case 344:{_winnings = 70;};
case 544:{_winnings = 70;};
case 644:{_winnings = 70;};
case 744:{_winnings = 70;};
case 414:{_winnings = 70;};
case 424:{_winnings = 70;};
case 434:{_winnings = 70;};
case 454:{_winnings = 70;};
case 464:{_winnings = 70;};
case 474:{_winnings = 70;};

case 551:{_winnings = 80;};
case 552:{_winnings = 80;};
case 553:{_winnings = 80;};
case 554:{_winnings = 80;};
case 556:{_winnings = 80;};
case 557:{_winnings = 80;};
case 155:{_winnings = 80;};
case 255:{_winnings = 80;};
case 355:{_winnings = 80;};
case 455:{_winnings = 80;};
case 655:{_winnings = 80;};
case 755:{_winnings = 80;};
case 515:{_winnings = 80;};
case 525:{_winnings = 80;};
case 535:{_winnings = 80;};
case 545:{_winnings = 80;};
case 565:{_winnings = 80;};
case 575:{_winnings = 80;};

case 111:{_winnings = 200;}; 
case 222:{_winnings = 300;};
case 333:{_winnings = 300;};
case 444:{_winnings = 300;};
case 555:{_winnings = 300;};
case 166:{_winnings = 510;}; 
case 266:{_winnings = 520;}; 
case 366:{_winnings = 530;}; 
case 466:{_winnings = 540;}; 
case 566:{_winnings = 550;}; 
case 616:{_winnings = 510;}; 
case 626:{_winnings = 520;}; 
case 636:{_winnings = 530;}; 
case 646:{_winnings = 540;}; 
case 656:{_winnings = 550;}; 
case 661:{_winnings = 510;}; 
case 662:{_winnings = 520;}; 
case 663:{_winnings = 530;}; 
case 664:{_winnings = 540;}; 
case 665:{_winnings = 550;}; 
case 666:{_winnings = 600;};
case 667:{_winnings = 950;};
case 676:{_winnings = 950;}; 
case 766:{_winnings = 950;}; 
case 767:{_winnings = 950;};
case 177:{_winnings = 650;};
case 277:{_winnings = 650;};
case 377:{_winnings = 650;};
case 477:{_winnings = 650;};
case 577:{_winnings = 650;};
case 677:{_winnings = 650;};
case 717:{_winnings = 650;};
case 727:{_winnings = 650;};
case 737:{_winnings = 650;};
case 747:{_winnings = 650;};
case 757:{_winnings = 650;};
case 767:{_winnings = 650;};
case 771:{_winnings = 650;};
case 772:{_winnings = 650;};
case 773:{_winnings = 650;};
case 774:{_winnings = 650;};
case 775:{_winnings = 650;};
case 776:{_winnings = 650;};
case 777:{_winnings = 1900;};
default {_winnings = 0;}
};
uiSleep 0.5;
//multiple winnings by bet amount
_slotcash =  _winnings * ( _betamt / 95 ) ;

_winningsText ctrlSetText format["%1",_slotcash];

[player, "bikerBank"] remoteExec ["client_fnc_getremotevar",2];
waitUntil { !isNil "packet"; };
_casinoVault = packet;
packet = nil;
	
if(_slotcash*((0.75)+((1-casinoRate/100)/5)) > _casinoVault) then {
	
	_winning = _casinoVault;

	[format["You won %1 in the slots but only received %2 because the casino ran out of cash.", _slotcash call client_fnc_numberText, _winning call client_fnc_numberText],false] spawn domsg;
	
	["casinoVault",_winning, "Remove",true] remoteexec ["server_fnc_setValue",2];

} else {

	_winning = _slotcash;

	[format["You won %1 in the slots", _winning call client_fnc_numberText],false] spawn domsg;

	["casinoVault",_winning*((0.75)+((1-casinoRate/100)/5)), "Remove",true] remoteexec ["server_fnc_setValue",2];

};

[_winning,true,true] call Client_fnc_addMoneyToPlayer;

["casinoVault", format["%1 (%2) won %3 and received %4 from the slots machine and the casino lost %5.", name player, getplayeruid player, _slotcash call client_fnc_numberText, _winning call client_fnc_numberText, _winning*((0.75)+((1-casinoRate/100)/5)) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];



_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
