    /*
    *
    *       Project :
    *               Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team / Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F-BT] Aroun Le BriCodeur
    *
    *       File :
    *           initPlayerLocal.sqf
    *
    */

    private _BTSD_handle        = FALSE;
    private _BTSD_CheckCamps    = "";
    private _BTSD_Msg           = "";

        _BTSD_CheckCamps = (group player) getVariable ["BTSD_Camps", []];

        if (_BTSD_CheckCamps isEqualTo []) then [{

                _BTSD_Msg = "Attente de l'attribution des camps";
                _BTSD_handle = "" spawn BT_fnc_SelectCamps;
                waitUntil {scriptDone _BTSD_handle};
        },{
            _BTSD_Msg = format ["%1 attribué pour les %2", _BTSD_CheckCamps # 0, _BTSD_CheckCamps # 1];
    }];

            []execVM "SQF\init_SidePlayer.sqf";

            hint _BTSD_Msg;

            waitUntil {
                _BTSD_CheckCamps = (group player) getVariable ["BTSD_Camps", []];
                !(str _BTSD_CheckCamps isEqualTo "[]")
            };

            systemChat str [_BTSD_CheckCamps];

            []spawn
            {
                waitUntil {!(isNull (findDisplay 46))};
                (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call BT_fnc_Keysboard"];
            };
