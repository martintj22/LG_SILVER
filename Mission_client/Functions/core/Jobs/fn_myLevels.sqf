_DirtyMoney = (client_level_array select 16);
_dirtymoneylevel = 0;
if(_dirtymoney != 0) then {
	_cash = player getVariable "cashinhand";
	 _bank = player getVariable "cashinbank";
	_totalcash = _cash + _bank;
	_DirtyMoneyLevel = round((_dirtymoney / _Totalcash) * 100);
	if(_DirtyMoneyLevel > 100) then { _DirtyMoneyLevel = 100; };
};

_agility = "Normal";

if (((client_level_array select 10) / 100) > -1 && ((client_level_array select 10) / 100) < 2 ) then { _agility = "Sub Par"; };

if (((client_level_array select 10) / 100) > 1 && ((client_level_array select 10) / 100) < 3 ) then { _agility = "Great"; };

if (((client_level_array select 10) / 100) > 2 ) then { _agility = "Athletic"; };

_strength = "Normal";

if (((client_level_array select 11) / 100) > -1 && ((client_level_array select 11) / 100) < 2 ) then { _strength = "Sub Par"; };

if (((client_level_array select 11) / 100) > 1 && ((client_level_array select 11) / 100) < 3 ) then { _strength = "Great"; };

if (((client_level_array select 11) / 100) > 2 ) then { _strength = "Athletic"; };


_intellect = "Normal";

if (((client_level_array select 12) / 100) > -1 && ((client_level_array select 12) / 100) < 2 ) then { _intellect = "Sub Par"; };

if (((client_level_array select 12) / 100) > 1 && ((client_level_array select 12) / 100) < 3 ) then { _intellect = "Great"; };

if (((client_level_array select 12) / 100) > 2 ) then { _intellect = "Athletic"; };


_stamina = "Normal";

if (((client_level_array select 13) / 100) > -1 && ((client_level_array select 13) / 100) < 2 ) then { _stamina = "Sub Par"; };

if (((client_level_array select 13) / 100) > 1 && ((client_level_array select 13) / 100) < 3 ) then { _stamina = "Great"; };

if (((client_level_array select 13) / 100) > 2 ) then { _stamina = "Athletic"; };


_weight = "Healthy";

if (((client_level_array select 14) / 100) > -1 && ((client_level_array select 14) / 100) < 2 ) then { _weight = "Healthy"; };

if (((client_level_array select 14) / 100) > 1 && ((client_level_array select 14) / 100) < 3 ) then { _weight = "Chubby"; };

if (((client_level_array select 14) / 100) > 2 ) then { _weight = "Obese"; };


hint parsetext format["

<t align='left' color='#FFCC00' size='1.35'> <img size='1' image='CG_Jobs\icons\info.paa'/> Player Stats <br/> </t><br/>
<t align='left' color='#FFCC00' size='1.05'> Character: %1 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Fedex: %2 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Security: %3 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Radio: %4 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Towing: %5 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Garbage: %6 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> News: %7 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Repairman: %8 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Farming: %9 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Public Transport: %10 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Agility: %11 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Strength: %12 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Intellect: %13 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Stamina: %14 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Weight: %15 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Stress: %16 <br/> </t>
<t align='left' color='#FFCC00' size='1.05'> Dirty Money: %%17 <br/> </t>
</t>
",

((client_level_array select 0) / 300),
((client_level_array select 1) / 300),
((client_level_array select 2) / 300),
((client_level_array select 3) / 300),
((client_level_array select 4) / 300),
((client_level_array select 5) / 300),
((client_level_array select 6) / 300),
((client_level_array select 7) / 300),
((client_level_array select 8) / 300),
((client_level_array select 9) / 300),
_agility,
_strength,
_intellect,
_stamina,
_weight,
((client_level_array select 15) / 300),
_DirtyMoney call client_fnc_numberText

];