	/*
    *
    *       Project :
    *              Alice Project / °Opérations° / Community FR / Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_switchTitleModCombat.sqf
    *
	*/

	params[["_DA3F_Switch", false, [false]]];

        private _DA3F_Msg = "<t color='#568FAE' size='1'>Mode Combat :<\t><br/><t color='%2' size='1.3'>%1<\t>";

			("DA3F_Combat" call bis_fnc_rscLayer) cutRsc ["DA3F_Combat","PLAIN"];
                waitUntil {!isNull (uiNameSpace getVariable "DA3F_Combat");};

	            private _DA3F_Display = uiNameSpace getVariable "DA3F_Combat";
	            private _DA3F_SetText = _DA3F_Display displayCtrl 1100;

        _DA3F_SetText ctrlSetBackgroundColor [0,0,0,0.95];

		switch (_DA3F_Switch) do
			{
				//Active
				case true:
				{
                    _DA3F_SetText ctrlSetStructuredText (parseText format [_DA3F_Msg,"Activé",'#F5261A']);
                    _DA3F_SetText ctrlSetPosition [safeZoneX+safeZoneW-0.1455,safeZoneY+safeZoneH-0.958];
                    //_DA3F_SetText ctrlSetBackgroundColor [0.9,0.1,0.1,0.65];
		    	};

				//Desactive
			    case false:
			    {
                	_DA3F_SetText ctrlSetStructuredText (parseText format [_DA3F_Msg,"Désactivé",'#60F93E']);
	            	_DA3F_SetText ctrlSetPosition [safeZoneX+safeZoneW-0.1455,safeZoneY+safeZoneH-0.958];
	            	//_DA3F_SetText ctrlSetBackgroundColor [0.1,0.9,0.1,0.65];
		    	};
			};

	_DA3F_SetText ctrlCommit 0.4;