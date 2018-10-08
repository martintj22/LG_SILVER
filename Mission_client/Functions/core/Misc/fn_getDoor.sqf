private ["_house","_door","_numOfDoors"];  
_house = [_this,0,objNull,[objNull]] call BIS_fnc_param;  
if (isNull _house) exitWith {0};  
if (!(_house isKindOf "House_F")) exitWith {0};  
_door = 0; 
 
_arr = [ 
 
    ["Land_buildingsCasino2", 
        [ 
            ["mem_door01_trigger",["door01","door02"],"bis_disabled_Door_01"], 
            ["mem_door03_trigger",["door03","door04"],"bis_disabled_Door_03"], 
            ["mem_door05_trigger",["door05","door06"],"bis_disabled_Door_05"], 
            ["mem_door07_trigger",["door07","door08"],"bis_disabled_Door_07"], 
            ["mem_door09_trigger",["door09","door10"],"bis_disabled_Door_09"], 
            ["mem_door11_trigger",["door11"],"bis_disabled_Door_09"], 
            ["mem_door12_trigger",["door12"],"bis_disabled_Door_11"], 
            ["mem_door13_trigger",["door13"],"bis_disabled_Door_12"], 
            ["mem_door14_trigger",["door14"],"bis_disabled_Door_13"], 
            ["mem_door15_trigger",["door15"],"bis_disabled_Door_14"], 
            ["mem_door16_trigger",["door16","door17"],"bis_disabled_Door_16"], 
            ["mem_door18_trigger",["door18"],"bis_disabled_Door_18"], 
            ["mem_door19_trigger",["door19"],"bis_disabled_Door_19"], 
            ["mem_door20_trigger",["door20"],"bis_disabled_Door_20"], 
            ["mem_door21_trigger",["door21"],"bis_disabled_Door_21"], 
            ["mem_door22_trigger",["door22"],"bis_disabled_Door_22"], 
            ["mem_door23_trigger",["door23"],"bis_disabled_Door_23"], 
            ["mem_door24_trigger",["door24"],"bis_disabled_Door_24"], 
            ["mem_door25_trigger",["door25"],"bis_disabled_Door_25"], 
            ["mem_door26_trigger",["door26"],"bis_disabled_Door_26"], 
            ["mem_vaultdoor_trigger",["vaultdoor"],"bis_disabled_Door_vd"], 
            ["mem_garagedoor_trigger",["garagedoor"],"bis_disabled_Door_gd"] 
        ] 
    ],

    ["Land_buildingsbasement1",
        [
            ["mem_door1_trigger",["door1"],"bis_disabled_Door_01"]
        ]
    ],

    ["Land_buildingsNightclub2",
        [
            ["mem_door01_trigger",["door01","door02"],"bis_disabled_Door_01"],
            ["mem_door03_trigger",["door03"],"bis_disabled_Door_03"],
            ["mem_door04_trigger",["door04"],"bis_disabled_Door_04"],
            ["mem_door05_trigger",["door05"],"bis_disabled_Door_05"],
            ["mem_door06_trigger",["door06"],"bis_disabled_Door_06"],
            ["mem_door07_trigger",["door07"],"bis_disabled_Door_07"],
            ["mem_door08_trigger",["door08"],"bis_disabled_Door_08"],
            ["mem_door09_trigger",["door09"],"bis_disabled_Door_09"],
            ["mem_door10_trigger",["door10"],"bis_disabled_Door_10"]
        ]
    ],

    ["Land_buildingsJailCellBlock1",
        [
            ["mem_door01_trigger",["door01"],"bis_disabled_Door_01"],
            ["mem_door02_trigger",["door02"],"bis_disabled_Door_02"],
            ["mem_door03_trigger",["door03"],"bis_disabled_Door_03"],
            ["mem_door04_trigger",["door04"],"bis_disabled_Door_04"],
            ["mem_doorcell1_trigger",["doorcell1"],"bis_disabled_Door_c1"],
            ["mem_doorcell2_trigger",["doorcell2"],"bis_disabled_Door_c2"],
            ["mem_doorcell3_trigger",["doorcell3"],"bis_disabled_Door_c3"],
            ["mem_doorcell4_trigger",["doorcell4"],"bis_disabled_Door_c4"]
        ]
    ],

    ["Land_PoliceStation",
        [
            ["Interact1",["door_1"],"bis_disabled_Door_01"],
            ["Interact2",["door_2"],"bis_disabled_Door_02"],
            ["Interact3",["door_3"],"bis_disabled_Door_03"],
            ["Interact4",["door_4"],"bis_disabled_Door_04"],
            ["Interact5",["door_5"],"bis_disabled_Door_05"],
            ["Interact6",["door_6"],"bis_disabled_Door_06"],
            ["Interact7",["door_7"],"bis_disabled_Door_07"]
        ]
    ]
 
]; 
 
{ 
 
    if(typeOf _house == _x select 0) exitWith { 
 
        for "_i" from 0 to (count (_x select 1)) do { 
            _array = _x select 1; 
 
            _selectionPos = _house selectionPosition (_array select _i select 0);  
            _worldSpace = _house modelToWorld _selectionPos;  
 
            if (player distance _worldSpace <= 5) exitWith { 
                _door = [(_array select _i select 0), (_array select _i select 1), (_array select _i select 2)];
            };  
 
        };  
 
    }; 
 
} foreach _arr; 
 
_door;