disableSerialization;
_index = lbCurSel (1113);
if (_index == -1) exitWith {};
_status = lbData[1113, _index];
_status = call compile format["%1", _status];
_item = _status;

uisleep 0.35;

removeuniform cockbag; 
removebackpack cockbag;
removevest cockbag;
removegoggles cockbag;
removeheadgear cockbag;

cockbag addheadgear (headgear player);
cockbag adduniform (uniform player);
cockbag addbackpack (backpack player);
cockbag addgoggles (goggles player);
cockbag addvest (vest player);

cockbag setFace (face player);

[cockbag] spawn client_fnc_destroyGroundHolders;

cockbag forceadduniform _item;
