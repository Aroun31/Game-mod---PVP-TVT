	/*
    *
    *       Project :
    *              Alice Project / °Opérations° / Community FR / Farming-Party
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_Progress.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *              ["fouille"]spawn BT_fnc_Progress;
    *
	*/

    disableSerialization;
    	if (DA3F_IsAction) exitWith {};
    		DA3F_IsAction = TRUE;
    	_this params["_DA3F_Showtxt", ["_DA3F_time", 0.05, [0]]];

            if (_DA3F_time isEqualTo 0) then {
                _DA3F_time = 0.05;
            };

        private _DA3F_Layer     = ("DA3F_BarProg" call BIS_fnc_rscLayer);
                _DA3F_Layer cutRsc ["DA3F_BarProg", "PLAIN"];

        private _DA3F_display 	= uinamespace getvariable ["DA3F_BarProg", displayNull];

            scopeName "ProgressNeutre";

                private _DA3F_progress      = _DA3F_display displayCtrl 1800;
                private _DA3F_text          = _DA3F_display displayCtrl 1100;
                private _DA3F_loop          = TRUE;
                private _DA3F_Exit          = FALSE;
                private _DA3F_GetProgress   = 0;
                private _DA3F_SetProgress   = 0;
                private _DA3F_Convert       = 0;
                private _DA3F_Symbol        = "%";
				private _DA3F_IsComa 		= FALSE;

        //systemChat str [_DA3F_Showtxt, _DA3F_time, _DA3F_Layer, _DA3F_display];

                    while { _DA3F_loop } do {

                        scopeName "ProgressLoop";
                        _DA3F_GetProgress 		= progressPosition _DA3F_progress;
                        /*_DA3F_IsComa 			= player getvariable ["BTSD_Coma", FALSE];*/

                        if (_DA3F_GetProgress isEqualTo 1) then {
                        	_DA3F_Exit		= TRUE;
                            _DA3F_loop      = FALSE;
                            breakTo "ProgressNeutre";
                        };
/*
                        if (_DA3F_IsComa) then {
                            _DA3F_loop       = FALSE;
                            breakTo "ProgressNeutre";
                        };
*/

                        if !(alive player) then {
                            _DA3F_loop       = FALSE;
                            breakTo "ProgressNeutre";
                        };

                        _DA3F_GetProgress = _DA3F_GetProgress + 0.02;
                        _DA3F_SetProgress = linearConversion [0, 1, _DA3F_GetProgress, 0, 1, TRUE];

                        _DA3F_Convert     = round ( (_DA3F_SetProgress) * 100 );
                        _DA3F_progress progressSetPosition _DA3F_SetProgress;

                        _DA3F_text ctrlSetStructuredText parseText format ["<t color='#FEFEFE' size='1' align='center' >%1<t/><br/><t color='#F0F000' size='1' align='center' >%2%3<t/>", _DA3F_Showtxt, _DA3F_Convert, _DA3F_Symbol];

                        [_DA3F_text]call BT_fnc_HeightText;
                        sleep _DA3F_time;

                    };

			DA3F_IsAction = FALSE;
            _DA3F_Layer cutText ["", "PLAIN"];

			if !(_DA3F_Exit) exitWith {
				hint "Action interrompu";
			};