_weaponholder = nearestObjects [player,["weaponholder"], 3] select 0;

_weapons = getWeaponCargo _weaponholder; 
_magazines = getMagazineCargo _weaponholder; 
_items = getItemCargo _weaponholder; 
_backpack = getBackpackCargo _weaponholder; 

if ( !(_weapons isEqualTo [[],[]]) ) then { 
        clearWeaponCargoGlobal _weaponholder;
        { evidenceBox addWeaponCargoGlobal [( _weapons select 0 ) select _forEachIndex,( _weapons select 1 ) select _forEachindex]; } forEach ( _weapons select 0 );
};

if ( !(_magazines isEqualTo [[],[]]) ) then {
        clearMagazineCargoGlobal _weaponholder;
        { evidenceBox addMagazineCargoGlobal [( _magazines select 0 ) select _forEachIndex,( _magazines select 1 ) select _forEachindex]; } forEach ( _magazines select 0 );
};

if ( !(_items isEqualTo [[],[]]) ) then {
        clearItemCargoGlobal _weaponholder;
        { evidenceBox addItemCargoGlobal [( _items select 0 ) select _forEachIndex,( _items select 1 ) select _forEachindex]; } forEach ( _items select 0 );
};

if ( !(_backpack isEqualTo [[],[]]) ) then {
        clearBackpackCargoGlobal _weaponholder;
        { evidenceBox addBackpackCargoGlobal [( _backpack select 0 ) select _forEachIndex,( _backpack select 1 ) select _forEachindex]; } forEach ( _backpack select 0 );
};

["You have seized the weapons and items.", true] spawn domsg;