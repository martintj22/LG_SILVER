private ["_car","_colorBody","_colorRims", "_tintWindows", "_tintLights"];
_car = param [0, objNull, [objNull]];
_colorBody = param [1, ["",""], [[],""]];
_colorRims = param [2, "default", [""]];
_tintWindows = param [3, 0, [0]];
_tintLights = param [4, 0, [0]]; 

_colorBodyTexture = "";
_colorBodyMaterial = "";

_textureList = getArray(configfile >> "CfgIvoryTextures" >> "defaulttextures");

_texture = getText(configfile >> "CfgVehicles" >> (typeOf _car) >> "texture");

switch(typeName _colorBody) do {
	case "STRING": {
		_colorBodyTexture = _colorBody;
	};
	case "ARRAY": {
		_colorBodyTexture = _colorBody select 0;
		_colorBodyMaterial = _colorBody select 1;
	};
};

if(_texture != "" && _colorBodyTexture == "") then { _colorBodyTexture=_texture; };

_car setVariable ["ivory_bodycolor",_colorBodyTexture,true];
_colorBodyTexture = getText(configfile >> "CfgIvoryTextures" >> _colorBodyTexture >> "texture");
if(_colorBodyTexture == "") then { 
	_colorBodyTexture = selectRandom _textureList; 
	_car setVariable ["ivory_bodycolor",_colorBodyTexture,true];
	_colorBodyTexture = getText(configfile >> "CfgIvoryTextures" >> _colorBodyTexture >> "texture");
};

_car setVariable ["ivory_bodyfinish",_colorBodyMaterial,true];
_colorBodyMaterial = getText(configfile >> "CfgIvoryMaterials" >> _colorBodyMaterial >> "material");
if(_colorBodyMaterial == "") then { 
	_car setVariable ["ivory_bodyfinish","metallic",true];
	_colorBodyMaterial = "ivory_data\data\metallic.rvmat"; 
};

_colorRims = getText(configfile >> "CfgIvoryTextures" >> _colorRims >> "texture");
if(_colorRims == "") then { 
	_car setVariable ["ivory_rimcolor","default",true];
	_defaultRims = getArray(configfile >> "CfgVehicles" >> (typeOf _car) >> "hiddenSelectionsTextures");
	_colorRims = _defaultRims select 1;
} else {
	_car setVariable ["ivory_rimcolor",_colorRims,true];
};

_tintWindows = 0.1+_tintWindows*0.8;
_tintLights = 0.1+_tintLights*0.8;

if (_tintWindows < 0.1) then { _tintWindows = 0.1 };
if (_tintWindows > 0.9) then { _tintWindows = 0.9 };
if (_tintLights < 0.1) then { _tintLights = 0.1 };
if (_tintLights > 0.9) then { _tintLights = 0.9 };


_car setObjectTextureGlobal 	[0, _colorBodyTexture];
_car setObjectMaterialGlobal 	[0, _colorBodyMaterial];
_car setObjectTextureGlobal 	[1, _colorRims];
_car setObjectTextureGlobal 	[2,"#(argb,8,8,3)color(0,0,0," + str _tintWindows + ",ca)"];
_car setObjectTextureGlobal 	[3,"#(argb,8,8,3)color(0,0,0," + str _tintLights + ",ca)"];

_car setVariable ["ivory_windowtint",str _tintWindows,true];
_car setVariable ["ivory_lighttint",str _tintLights,true];

true;