private ["_car"];
_car = param [0, objNull, [objNull]];

_displayName = getText(configfile >> "CfgVehicles" >> (typeOf _car) >> "displayName");
_maxspeed = getNumber(configfile >> "CfgVehicles" >> (typeOf _car) >> "maxSpeed");
_redline = getNumber(configfile >> "CfgVehicles" >> (typeOf _car) >> "redRpm");
_enginePower = getNumber(configfile >> "CfgVehicles" >> (typeOf _car) >> "enginePower")*1.341;
_peaktorque = getNumber(configfile >> "CfgVehicles" >> (typeOf _car) >> "peakTorque");
_seats = getNumber(configfile >> "CfgVehicles" >> (typeOf _car) >> "transportSoldier")+1;

hint format ["
	%1 \n\n
	SEATS: %2 \n
	LICENSE: %3 \n
	MAX SPEED: %4 Km/h \n
	REDLINE: %5 rpm \n
	HORSEPOWER: %6 hp \n
	TORQUE: %7 Nm \n
	BODY: %8 %9 \n
	RIMS: %10 \n
	WINDOW: %11 \n
	LIGHTS: %12
    ",
    _displayName,
    _seats,
    toUpper (_car getVariable "ivory_license"),
    round (_maxspeed),
    round (_redline),
    round (_enginePower),
    round (_peaktorque),
    toUpper getText(configfile >> "CfgIvoryMaterials" >> (_car getVariable "ivory_bodyfinish") >> "displayName"),
    toUpper getText(configfile >> "CfgIvoryTextures" >> (_car getVariable "ivory_bodycolor") >> "displayName"),
    toUpper (_car getVariable "ivory_rimcolor"),
    parseNumber(_car getVariable "ivory_windowtint")*100,
    parseNumber(_car getVariable "ivory_lighttint")*100
];
