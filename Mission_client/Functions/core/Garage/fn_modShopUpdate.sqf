disableSerialization;

params ["_display", "_handle"];

private _list_upgrades = _display displayCtrl 15001;
private _list_textures = _display displayCtrl 15002;
private _list_materials = _display displayCtrl 15003;
private _list_rims = _display displayCtrl 15004;
private _slider_windows = _display displayCtrl 15005;
private _text_windows = _display displayCtrl 15006;
private _slider_lights = _display displayCtrl 15007;
private _text_lights = _display displayCtrl 15008;

call
{
	if(_handle isEqualTo "init") exitWith
	{
		disableSerialization;

		params ["_display"];

		selectedVehicle = ((getMarkerPos "modshop_marker") nearEntities ["Car", 10]) select 0;
		if(isNull selectedvehicle) exitWith { ["There is no vehicle in the shop to mod!", true] spawn domsg;};

		if((typeOf selectedVehicle) find "ivory_" isEqualTo -1) then
		{
			_slider_windows ctrlShow false;
			_text_windows ctrlShow false;
			_slider_lights ctrlShow false;
			_text_lights ctrlShow false;
		};

		private _current_class = typeOf selectedVehicle;
		private _start = 1;
		private _stop = 2;
		private _upgrade_array = [];

		private _current_class_array = _current_class splitString "_"; 
		private _current_upgrade_level = _current_class_array deleteAt (count _current_class_array -1);
		private _base_class = _current_class_array joinString "_";

		private _price = 
		{
			if((_x select 0) isEqualTo _base_class) exitWith
			{
				_x select 1
			};
		} foreach client_civilian_price_list;

		_upgrade_array = call
		{
			private _tmp = [];

			if(_current_upgrade_level isEqualTo "2") exitWith
			{
				["This car is already fully upgraded!"]
			};

			if(_current_upgrade_level isEqualTo "1") then
			{
				_start = 2;
			};

			for "_i" from _start to _stop do
			{
				_tmp pushBack [[format ["Stage %1", _i], format ["%1_%2", _base_class, _i], (_price/10)*_i]];
			};

			_tmp
		};

		lbClear _list_upgrades;
		{
			_display_name = _x select 0;
			_class = param [1, "", [""]];
			_price = param [2, 0, [0]];
			_list_upgrades lbAdd format["%1", _display_name];
			_list_upgrades lbSetdata [(lbSize _list_upgrades)-1, format [%1:%2, _class, _price]];
		} foreach _upgrade_array;
		
		_texture_array = configProperties [configFile >> "CfgIvoryTextures" >> _base_class, "isClass _x"];
		_price = 10000;

		lbClear _list_textures;
		{
			_display_name = _x select 0;
			_texture = _x select 1;
			_list_textures lbAdd format["%1", _display_name];
			_list_textures lbSetdata [(lbSize _list_textures)-1, format [%1:%2, _texture, _price]];
		} foreach _texture_array;

		_material_array = configProperties [configFile >> "CfgIvoryMaterials" >> _base_class >> "material", "isClass _x"];
		_price = 5000;

		lbClear _list_materials;
		{
			_display_name = _x select 0;
			_material = _x select 1;
			_list_materials lbAdd format["COST: %2 - %1",_display_name, _price call client_fnc_numberText];
			_list_materials lbSetdata [(lbSize _list_materials)-1, format [%1:%2, _material, _price]];
		} foreach _material_array;

		_list_upgrades lbSetCurSel 0;
		_list_textures lbSetCurSel 0;
		_list_materials lbSetCurSel 0;

		
		if(ctrlShown _slider_windows) then
		{
			_price = 3000;

			lbClear _list_rims;
			{
				_display_name = _x select 0;
				_texture = _x select 1;
				_list_rims lbAdd format["COST: %2 - %1",_display_name, _price call client_fnc_numberText];
				_list_rims lbSetdata [(lbSize _list_rims)-1, format [%1:%2, _texture, _price]];
			} foreach _texture_array;
			_list_rims lbSetCurSel 0;

			_slider_windows sliderSetRange [0, 10];
			_slider_windows sliderSetPosition 0;
			_slider_lights sliderSetRange [0, 10];
			_slider_lights sliderSetPosition 0;
		};
		
		selectedVehicleCam = "CAMERA" camCreate (getPos selectedVehicle); 
		showCinemaBorder true; 
		selectedVehicleCam cameraEffect ["EXTERNAL", "BACK"];
		selectedVehicleCam camSetTarget selectedVehicle;
		selectedVehicleCam camSetRelPos [2.7,1,0.25];
		selectedVehicleCam camSetFOV .99;
		selectedVehicleCam camCommit 0;
	};

	if(_handle isEqualTo "upgrade") exitWith
	{
		_data = _list_upgrades lbData (lbCurSel _list_upgrades)];
	
		selectedVehicle setObjectMaterial [0, _data];
	};

	if(_handle isEqualTo "texture") exitWith
	{
		_data = _list_textures lbData (lbCurSel _list_textures)];
	
		selectedVehicle setObjectMaterial [0, _data];
	};

	if(_handle isEqualTo "finish") exitWith
	{
		_data = _list_materials lbData (lbCurSel _list_materials)];

		selectedVehicle setObjectMaterial [0, _data];
	};

	if(_handle isEqualTo "rims") exitWith
	{
		_data = _list_rims lbData (lbCurSel _list_rims));

		selectedVehicle setObjectTexture [1, _data];
	};

	if(_handle isEqualTo "tint") exitWith
	{
		private _update_tint_windows = format ["#(argb,8,8,3)color(0,0,0,%1,ca)", (sliderPosition _slider_windows)/10];
		private _update_tint_lights = format ["#(argb,8,8,3)color(0,0,0,%1,ca)", (sliderPosition _slider_lights)/10];

		selectedVehicle setObjectTexture [2, _update_tint_windows];
		selectedVehicle	setObjectTexture [3, _update_tint_lights];
	};

	if(_handle isEqualTo "commit") exitWith
	{
		private _class = typeOf selectedVehicle;
		private _current_config = (getObjectTextures selectedVehicle);
		private _texture_body = _current_config select 0;
		private _material_body = (getObjectMaterials selectedVehicle) select 0;
		

		if!((_class find "ivory_") isEqualTo -1) then
		{
			private _texture_rim = _current_config select 1;
			private _texture_tint_windows = _current_config select 2;
			private _texture_tint_lights = _current_config select 3;

			[_class, [_texture_body, _material_body], _texture_rim, _texture_tint_windows, _texture_tint_lights] call client_fnc_ivoryInitVehicle;
		}
		else
		{
			[_class, [_texture_body, _material_body]] call client_fnc_initVehicle;
		};
		
		closeDialog 0;
	};

	if(_handle isEqualTo "exit") exitWith
	{
		selectedVehicleCam cameraEffect ["TERMINATE,"BACK"]; 
		camDestroy selectedVehicleCam; 
	};
};
