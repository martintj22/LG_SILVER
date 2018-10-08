horseOdds = [["BC DOOD",round(random(1)),1 + round(random(25)),round(random(3))]
,["Goodnight",round(random(1)),1 + round(random(25)),round(random(3))]
,["Horsey McHorseface",round(random(1)),1 + round(random(25)),round(random(3))]
,["Daddys Little Pineapple",round(round(random(1))),1 + round(random(25)),round(random(3))]
,["Kinko",round(random(1)),1 + round(random(25)),round(random(3))]
,["Slumpbuster",round(random(1)),1 + round(random(25)),round(random(3))]
,["Cream Donut",round(random(1)),1 + round(random(25)),round(random(3))]
,["Aleksis",round(random(1)),1 + round(random(25)),round(random(3))]
,["Selveks Butt",round(random(1)),1 + round(random(25)),round(random(3))]
,["Mary Hinge",round(random(1)),1 + round(random(25)),round(random(3))]
,["Sellout Legionnaire",round(random(1)),1 + round(random(25)),round(random(3))]
,["uhbuii",round(random(1)),1 + round(random(25)),round(random(3))]
,["Dinner for Lang",round(random(1)),1 + round(random(25)),round(random(3))]
,["Shower Shitter",round(random(1)),1 + round(random(25)),round(random(3))]
,["Mr. Ed's Ghost",round(random(1)),1 + round(random(25)),round(random(3))]
,["TriHard",round(random(1)),1 + round(random(25)),round(random(3))]
,["CruW",round(random(1)),1 + round(random(25)),round(random(3))]
,["Jason's Lover",round(random(1)),1 + round(random(25)),round(random(3))]	
,["Bobswagger",round(random(1)),1 + round(random(25)),round(random(3))]
,["Sex Baton",round(random(1)),1 + round(random(25)),round(random(3))]
,["Crazy is sexy IRL",round(random(1)),1 + round(random(25)),round(random(3))]
,["Juicy is Juicy",round(random(1)),1 + round(random(25)),round(random(3))]
,["Bliind is sex",round(random(1)),1 + round(random(25)),round(random(3))]
,["Kracksnacker",round(random(1)),1 + round(random(25)),round(random(3))]
,["Floppy Donkey",round(random(1)),1 + round(random(25)),round(random(3))]
,["Big Stallion",round(random(1)),1 + round(random(25)),round(random(3))]
,["Crazy Horse",round(random(1)),1 + round(random(25)),round(random(3))]
,["Bubba Broke Me",round(random(1)),1 + round(random(25)),round(random(3))]
,["Beta Cuck",round(random(1)),1 + round(random(25)),round(random(3))]
,["Nobs",round(random(1)),1 + round(random(25)),round(random(3))]
,["Mauler's Mile",round(random(1)),1 + round(random(25)),round(random(3))]
,["Heisenberg",round(random(1)),1 + round(random(25)),round(random(3))]
,["Cash is a cunt",round(random(1)),1 + round(random(25)),round(random(3))]
,["Reed Stampeed(cunt)",round(random(1)),1 + round(random(25)),round(random(3))]
,["Nino's Yacht",round(random(1)),1 + round(random(25)),round(random(3))]



,["GG Homie",round(random(1)),1 + round(random(25)),round(random(3))]
,["Francis@Christianmingle.com",round(random(1)),1 + round(random(25)),round(random(3))]
,["Ordinary William",round(random(1)),1 + round(random(25)),round(random(3))]
,["Hacker on Server 2",round(random(1)),1 + round(random(25)),round(random(3))]
,["Nug Life",round(random(1)),1 + round(random(25)),round(random(3))]
,["Kiti's Whiskey",round(random(1)),1 + round(random(25)),round(random(3))]
,["Ninos Finger",round(random(1)),1 + round(random(25)),round(random(3))]
,["Lil Noodle",round(random(1)),1 + round(random(25)),round(random(3))]
,["Juicy The Juice",round(random(1)),1 + round(random(25)),round(random(3))]


,["Scoober",round(random(1)),1 + round(random(25)),round(random(3))]];

_numberCount = 0;
horseRacers = [];
while{_numbercount < 7} do {

	_newHorse = horseOdds call BIS_fnc_selectRandom;
	if !(_newHorse IN horseRacers) then { _numberCount = _numberCount + 1; horseRacers pushback _newHorse; };
	
};

raceType = [0,1,2,3] call bis_fnc_selectrandom;

publicVariable "raceType";
publicVariable "horseRacers";

_nearCasino = [6810.04,4639.41,0.00144005] nearEntities ["Man", 35];

["A new horse race is taking bets",false] remoteexec ["domsg",_nearCasino];