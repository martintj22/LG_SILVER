//if working - ["Repairing Object",15,client_fnc_repairNear,player,'AinvPknlMstpSnonWnonDnon_medic_1',player,"cg_sndimg\sounds\repair.ogg"] spawn client_fnc_dotask;
private["_thisobject"];
if(isNil "repairedobjects") then { repairedobjects = []; };
if(isNil "lastpos") then { lastpos = getpos player; };
_pay = false;
{ if( damage _x == 1 && !isPlayer _x ) then { if (player distance vehspawned < 20) then { _pay = true; }; _x setdamage 0; _thisobject = _x; }; } foreach nearestObjects [player, [], 120];

if(_thisobject IN repairedobjects || !(_pay)) exitwith {};
repairedobjects pushback _thisobject;
if(lastpos distance player < 30) then { paycheck = paycheck + 15; } else { 

	paycheck = paycheck + 50;

	["add","Karma",1,"Repairman"] call client_fnc_sustain;

	_level_check = (client_level_array select 7);
	_amount = 0;
	if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 15; };
	if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 12; };
	if(_level_check > 599) then { _amount = _level_check /10; };

	_amount = round(_amount);

	if(_amount > 0) then {
		if(_amount > 150) then { _amount = 150; };
		[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
		[_amount,true,true] call Client_fnc_addMoneyToPlayer;
	};

};
lastpos = getpos player;