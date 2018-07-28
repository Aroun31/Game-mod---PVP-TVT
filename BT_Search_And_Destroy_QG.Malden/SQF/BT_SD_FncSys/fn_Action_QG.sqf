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
    *           fn_Action_QG.sqf
    *           this call BT_fnc_Action_QG;
    */
/*
    _this spawn {

    private _BTSD_Side  = _this getVariable ["BTSD_SideQG", sideUnknown];
    private _BTSD_wait  = false;
    private _check      = false;
        if (_BTSD_Side isEqualTo sideUnknown) exitWith {};

            switch (_BTSD_Side) do {
                case west: {
                    _this setObjectTextureGlobal [1,"#(rgb,8,8,3)color(0,0.05,0.3,0.25)"];
                };

                case east: {
                    _this setObjectTextureGlobal [1,"#(rgb,8,8,3)color(0.3,0.01,0,0.25)"];
                };
            };


        _this setVariable ["BTSD_VehCheck", true, true];

        waitUntil {
        sleep 1;
        _check = _this getVariable ["BTSD_VehCheck", false];
        if!(alive _this) then {
            _BTSD_wait = true;
        };

        if!(_check) then {
            _BTSD_wait = true;
        };

        _BTSD_wait
        };

            switch (_BTSD_Side) do {
                case west: {
                    "Les Blufor viennent de perdre leur QG !" remoteExecCall ["hint", east];
                    "Votre QG est détruit !" remoteExecCall ["hint", west];
                    sleep 4;

                    "TeamLose" remoteExecCall ["BIS_fnc_endMission", west];
                    "GoodGame" remoteExecCall ["BIS_fnc_endMission", east];

                };

                case east: {
                    "Les Opfor viennent de perdre leur QG !" remoteExecCall ["hint", west];
                    "Votre QG est détruit !" remoteExecCall ["hint", east];
                    sleep 4;

                    "TeamLose" remoteExecCall ["BIS_fnc_endMission", east];
                    "GoodGame" remoteExecCall ["BIS_fnc_endMission", west];
                };
            };
    };
*/
     [_this]spawn BT_fnc_VictoryOrNot;
    private _BTSD_Id = _this addAction ["<t color='#00FF00'>Déployer le QG<t/>",BT_fnc_DeployedQG, nil, -999, TRUE, FALSE, "", "player isEqualTo (vehicle player)"];
    _this setVariable ["BTSD_Act_1", _BTSD_Id, true];