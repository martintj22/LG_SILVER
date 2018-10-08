_cardArray = [];
_baseCardArray = [
	["2 of Clubs","2_of_clubs",2],
	["2 of Diamonds","2_of_diamonds",2],
	["2 of Hearts","2_of_hearts",2],
	["2 of Spades","2_of_spades",2],

	["3 of Clubs","3_of_clubs",3],
	["3 of Diamonds","3_of_diamonds",3],
	["3 of Hearts","3_of_hearts",3],
	["3 of Spades","3_of_spades",3],

	["4 of Clubs","4_of_clubs",4],
	["4 of Diamonds","4_of_diamonds",4],
	["4 of Hearts","4_of_hearts",4],
	["4 of Spades","4_of_spades",4],

	["5 of Clubs","5_of_clubs",5],
	["5 of Diamonds","5_of_diamonds",5],
	["5 of Hearts","5_of_hearts",5],
	["5 of Spades","5_of_spades",5],

	["6 of Clubs","6_of_clubs",6],
	["6 of Diamonds","6_of_diamonds",6],
	["6 of Hearts","6_of_hearts",6],
	["6 of Spades","6_of_spades",6],

	["7 of Clubs","7_of_clubs",7],
	["7 of Diamonds","7_of_diamonds",7],
	["7 of Hearts","7_of_hearts",7],
	["7 of Spades","7_of_spades",7],

	["8 of Clubs","8_of_clubs",8],
	["8 of Diamonds","8_of_diamonds",8],
	["8 of Hearts","8_of_hearts",8],
	["8 of Spades","8_of_spades",8],

	["9 of Clubs","9_of_clubs",9],
	["9 of Diamonds","9_of_diamonds",9],
	["9 of Hearts","9_of_hearts",9],
	["9 of Spades","9_of_spades",9],

	["10 of Clubs","10_of_clubs",10],
	["10 of Diamonds","10_of_diamonds",10],
	["10 of Hearts","10_of_hearts",10],
	["10 of Spades","10_of_spades",10],

	["Jack of Clubs","Jack_of_clubs",10],
	["Jack of Diamonds","Jack_of_diamonds",10],
	["Jack of Hearts","Jack_of_hearts",10],
	["Jack of Spades","Jack_of_spades",10],

	["Queen of Clubs","Queen_of_clubs",10],
	["Queen of Diamonds","Queen_of_diamonds",10],
	["Queen of Hearts","Queen_of_hearts",10],
	["Queen of Spades","Queen_of_spades",10],

	["King of Clubs","King_of_clubs",10],
	["King of Diamonds","King_of_diamonds",10],
	["King of Hearts","King_of_hearts",10],
	["King of Spades","King_of_spades",10],

	["Ace of Clubs","Ace_of_clubs",11],
	["Ace of Diamonds","Ace_of_diamonds",11],
	["Ace of Hearts","Ace_of_hearts",11],
	["Ace of Spades","Ace_of_spades",11]
	
];

{
	_cardArray pushback _x;
	_cardArray pushback _x;
	_cardArray pushback _x;
	_cardArray pushback _x;	
	_cardArray pushback _x;
	_cardArray pushback _x;
	_cardArray pushback _x;
	_cardArray pushback _x;
}foreach _baseCardArray;

BJgameCardArray = _cardArray;
BJgameStarted = true;




