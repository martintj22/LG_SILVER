[] spawn {
private["_current","_odds","_pia"];


{
	_pia = horseRacers FIND _x;
	_current = _x select 2;
	if(_x select 3 == raceType) then { _current = _current + (_current * 0.05); };
	(horseRacers select _pia) SET [2,_current];
}foreach horseRacers;


_winners = [];
_points = [0,0,0,0,0,0,0];
_race = true;

_nearCasino = [6810.04,4639.41,0.00144005] nearEntities ["Man", 35];

	if(count _nearCasino != 0) then {
		[] remoteexec ["startHorses",_nearCasino];
	};
_POWER1 = RANDOM(2);
_POWER2 = RANDOM(2);
_POWER3 = RANDOM(2);

_shitter = 0;
while {_race} do {

	uisleep 0.5;

	if(_shitter > 100) exitwith {};

	_shitter = _shitter + 1;
	{
		_score = 0;

		if ( (_points select _forEachIndex) IN [50,49,48,47,46,45,44] ) then {

		} else {

			_probability = (_x select 2) * 0.05;
			_adjustment = random(_probability) + 1;
			
			_score = (_points select _forEachIndex);
			_guessing = _x select 2;

			if(_x select 3 == 0 && _score < 17 && _guessing < 12) then { _adjustment = _adjustment + (_adjustment * _POWER1 ); };
			if(_x select 3 == 1 && _score > 16 && _score < 34 && _guessing < 12) then { _adjustment = _adjustment + (_adjustment * _POWER2 ); };
			if(_x select 3 == 2 && _score > 33 && _guessing < 12) then { _adjustment = _adjustment + (_adjustment * _POWER3 ); };

			_score = (_points select _forEachIndex) + _adjustment;

			if(count _nearCasino != 0) then {
				if(_foreachindex == 0) then { [_adjustment,_score,_x select 0] remoteexec ["horsey1",_nearCasino]; };
				if(_foreachindex == 1) then { [_adjustment,_score,_x select 0] remoteexec ["horsey2",_nearCasino]; };
				if(_foreachindex == 2) then { [_adjustment,_score,_x select 0] remoteexec ["horsey3",_nearCasino]; };
				if(_foreachindex == 3) then { [_adjustment,_score,_x select 0] remoteexec ["horsey4",_nearCasino]; };
				if(_foreachindex == 4) then { [_adjustment,_score,_x select 0] remoteexec ["horsey5",_nearCasino]; };
				if(_foreachindex == 5) then { [_adjustment,_score,_x select 0] remoteexec ["horsey6",_nearCasino]; };
				if(_foreachindex == 6) then { [_adjustment,_score,_x select 0] remoteexec ["horsey7",_nearCasino]; };
			};

			_points SET [_forEachIndex,_score];

		};


		if(_Score > 49 ) then {

			if (!(50 IN _points)) exitwith {
				_points SET [_forEachIndex,50];
				_horse = horseRacers SELECT _foreachindex;
				_pia = horseodds FIND _horse;
				_winner = horseodds SELECT _pia;
				_newpoints = (_winner select 2) + 4;
				if(_newpoints > 20) then { _newpoints = 20; };
				_winner SET [2,_newpoints];
				horseodds SET [_pia,_winner];
				if(count _nearCasino != 0) then {
					[format["%1 came 1st in the horse races.",_horse select 0],false] REMOTEEXEC ["DOMSG",_nearCasino];

					if(_foreachindex == 0) then { [5,5,_x select 0] remoteexec ["horsey1",_nearCasino]; };
					if(_foreachindex == 1) then { [5,5,_x select 0] remoteexec ["horsey2",_nearCasino]; };
					if(_foreachindex == 2) then { [5,5,_x select 0] remoteexec ["horsey3",_nearCasino]; };
					if(_foreachindex == 3) then { [5,5,_x select 0] remoteexec ["horsey4",_nearCasino]; };
					if(_foreachindex == 4) then { [5,5,_x select 0] remoteexec ["horsey5",_nearCasino]; };
					if(_foreachindex == 5) then { [5,5,_x select 0] remoteexec ["horsey6",_nearCasino]; };
					if(_foreachindex == 6) then { [5,5,_x select 0] remoteexec ["horsey7",_nearCasino]; };
				};
				_winners pushback _foreachindex;
			};

			if (!(49 IN _points)) exitwith {
				_points SET [_forEachIndex,49];
				_horse = horseRacers SELECT _foreachindex;
				_pia = horseodds FIND _horse;
				_winner = horseodds SELECT _pia;
				_newpoints = (_winner select 2) + 3;
				if(_newpoints > 20) then { _newpoints = 20; };
				_winner SET [2,_newpoints];
				horseodds SET [_pia,_winner];
				if(count _nearCasino != 0) then {
				[format["%1 came 2nd in the horse races.",_horse select 0],false] REMOTEEXEC ["DOMSG",_nearCasino];

				if(_foreachindex == 0) then { [4,4,_x select 0] remoteexec ["horsey1",_nearCasino]; };
				if(_foreachindex == 1) then { [4,4,_x select 0] remoteexec ["horsey2",_nearCasino]; };
				if(_foreachindex == 2) then { [4,4,_x select 0] remoteexec ["horsey3",_nearCasino]; };
				if(_foreachindex == 3) then { [4,4,_x select 0] remoteexec ["horsey4",_nearCasino]; };
				if(_foreachindex == 4) then { [4,4,_x select 0] remoteexec ["horsey5",_nearCasino]; };
				if(_foreachindex == 5) then { [4,4,_x select 0] remoteexec ["horsey6",_nearCasino]; };
				if(_foreachindex == 6) then { [4,4,_x select 0] remoteexec ["horsey7",_nearCasino]; };
				};
				_winners pushback _foreachindex;

			};

			if (!(48 IN _points)) exitwith {
				_points SET [_forEachIndex,48];
				_horse = horseRacers SELECT _foreachindex;
				_pia = horseodds FIND _horse;
				_winner = horseodds SELECT _pia;
				_newpoints = (_winner select 2) + 2;
				if(_newpoints > 20) then { _newpoints = 20; };
				_winner SET [2,_newpoints];
				horseodds SET [_pia,_winner];
				if(count _nearCasino != 0) then {
				[format["%1 came 3rd in the horse races.",_horse select 0],false] REMOTEEXEC ["DOMSG",_nearCasino];			


				if(_foreachindex == 0) then { [2,2,_x select 0] remoteexec ["horsey1",_nearCasino]; };
				if(_foreachindex == 1) then { [2,2,_x select 0] remoteexec ["horsey2",_nearCasino]; };
				if(_foreachindex == 2) then { [2,2,_x select 0] remoteexec ["horsey3",_nearCasino]; };
				if(_foreachindex == 3) then { [2,2,_x select 0] remoteexec ["horsey4",_nearCasino]; };
				if(_foreachindex == 4) then { [2,2,_x select 0] remoteexec ["horsey5",_nearCasino]; };
				if(_foreachindex == 5) then { [2,2,_x select 0] remoteexec ["horsey6",_nearCasino]; };
				if(_foreachindex == 6) then { [2,2,_x select 0] remoteexec ["horsey7",_nearCasino]; };
				};
				_winners pushback _foreachindex;
			};

			if (!(47 IN _points)) exitwith {
				_points SET [_forEachIndex,47];


				_horse = horseRacers SELECT _foreachindex;
				_pia = horseodds FIND _horse;
				_winner = horseodds SELECT _pia;
				_newpoints = (_winner select 2) - 1;
				if(_newpoints < 1) then { _newpoints = 1; };
				_winner SET [2,_newpoints];
				horseodds SET [_pia,_winner];


			};			

			if (!(46 IN _points)) exitwith {
				_points SET [_forEachIndex,46];

				_horse = horseRacers SELECT _foreachindex;
				_pia = horseodds FIND _horse;
				_winner = horseodds SELECT _pia;
				_newpoints = (_winner select 2) - 2;
				if(_newpoints < 1) then { _newpoints = 1; };
				_winner SET [2,_newpoints];
				horseodds SET [_pia,_winner];

			};	

			if (!(45 IN _points)) exitwith {
				_points SET [_forEachIndex,45];

				_horse = horseRacers SELECT _foreachindex;
				_pia = horseodds FIND _horse;
				_winner = horseodds SELECT _pia;
				_newpoints = (_winner select 2) - 3;
				if(_newpoints < 1) then { _newpoints = 1; };
				_winner SET [2,_newpoints];
				horseodds SET [_pia,_winner];

			};	

			if (!(44 IN _points)) exitwith {
				_points SET [_forEachIndex,44];

				_horse = horseRacers SELECT _foreachindex;
				_pia = horseodds FIND _horse;
				_winner = horseodds SELECT _pia;
				_newpoints = (_winner select 2) - 4;
				if(_newpoints < 1) then { _newpoints = 1; };
				_winner SET [2,_newpoints];
				horseodds SET [_pia,_winner];

				_race = false;
			};	

		};

	}foreach horseRacers;

};

uisleep 10;

	if(count _nearCasino != 0) then {
[] remoteexec ["endHorses",_nearCasino];
};

[_winners] remoteexec ["client_fnc_horseWinCheck",-2];

_nearCasino = [6810.04,4639.41,0.00144005] nearEntities ["Man", 35];

_numberCount = 0;
horseRacers = [];
while{_numbercount < 7} do {

	_newHorse = horseOdds call BIS_fnc_selectRandom;
	if !(_newHorse IN horseRacers) then { _pia = horseOdds FIND _newHorse; if(_newHorse select 1 > 4) then { _roll = random(100); if (_roll > 75) then { _injury = (_newHorse select 1) * 0.25; _newhorse SET[1,_newhorse]; horseOdds SET [_pia,_newHorse]; [format["%1 received an injury and has lower odds.",_newhorse select 0], true] remoteexec ["domsg",_nearCasino]; }; }; _numberCount = _numberCount + 1; horseRacers pushback _newHorse; };

};
raceType = [0,1,2,3] call bis_fnc_selectrandom;
publicVariable "raceType";
publicVariable "horseRacers";

};