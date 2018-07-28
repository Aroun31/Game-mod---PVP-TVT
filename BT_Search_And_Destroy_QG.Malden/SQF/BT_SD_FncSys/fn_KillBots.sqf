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
    *           fn_KillBots.sqf
    *
    */

		params[
		    ["_DA3F_Unit", objNull, [objNull]],
			["_DA3F_Killer", objNull, [objNull]]
		];

			private _DA3F_distance 	= round(_DA3F_Unit distance _DA3F_Killer);
			private _DA3F_CalculDis	= (10 + (ceil(_DA3F_distance/2)));
            private _ressources     = 0;
                _ressources = _DA3F_Unit getVariable ["DA3F_PrimeKill", 50];

                _ressources = _ressources + _DA3F_CalculDis;
            private _fuckingSide = _DA3F_Unit getVariable ["BTSD_Side", sideUnknown];
			if (isPlayer _DA3F_Killer) then {
                if (_fuckingSide isEqualTo (side _DA3F_Killer)) then [{
                    [_DA3F_Killer, (_ressources - 50), "del"]call BT_fnc_ressources;
                    },{
                    [_DA3F_Killer, _ressources, "add"]call BT_fnc_ressources;
                }];
			};

    [_DA3F_Unit]spawn{
        sleep 600;
        deleteVehicle (_this select 0);
    };