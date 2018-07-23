	/*
    *
    *       Project :
    *              Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_ressources.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               [_unit or _group, _nrbressource, "add" or "del"]call BT_fnc_ressources;
    *
	*/

		_this params [
			["_unit", objNull, [objNull, grpNull]],
			["_Ressource", 0, [0]],
			["_type", "", [""]]
		];

		if (_type isEqualTo "") exitWith {};

			private _group = if (_unit isEqualType objNull) then [{
				(group _unit);
				},{
				_unit
			}];

        switch (_type) do {

            case "add": {

        		if (_unit isEqualType objNull) then [{

        	        (format ["%1 vient de faire gagner '%2 ressources' à l'équipe", name _unit, _Ressource]) remoteExecCall ["systemChat",_group];
        		},{

        	        (format ["L'équipe vient de gagner '%1 ressources'", _Ressource]) remoteExecCall ["systemChat", _group];
        		}];

                    [nil, _group, format["private _RessourceGrp = _DA3F_Args getVariable [""Grp_ressource"", 0];_RessourceGrp = _RessourceGrp + %1;_DA3F_Args setVariable [""Grp_ressource"", _RessourceGrp, TRUE];", _Ressource]] remoteExecCall ["BT_fnc_execCodeTarget", 2];
            };

            case "del": {
                    [nil, _group, format["private _RessourceGrp = _DA3F_Args getVariable [""Grp_ressource"", 0];_RessourceGrp = _RessourceGrp - %1;_DA3F_Args setVariable [""Grp_ressource"", _RessourceGrp, TRUE];", _Ressource]] remoteExecCall ["BT_fnc_execCodeTarget", 2];
            };
        };
