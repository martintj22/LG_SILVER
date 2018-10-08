params ["_suspect", "_suspectID", "_officer","_officerID","_charges","_status","_evidence","_active","_jailtime",["_approved",""],["_approvedGUID",""],["_closed",""],["_closedGUID",""]];

_updatestr = format ["insertCrime:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13", _suspect, _suspectID, _officer, _officerID, _charges, _status, _evidence, _active, _jailtime, _approved, _approvedGUID, _closed, _closedGUID];
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;