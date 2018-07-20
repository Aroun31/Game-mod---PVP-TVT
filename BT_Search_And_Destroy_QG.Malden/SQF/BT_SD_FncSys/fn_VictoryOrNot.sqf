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
    *           fn_VictoryOrNot.sqf
    *           [_veh]call BT_fnc_VictoryOrNot;
    */


        private _BTSD_veh   = param[0, objNull, [objNull]];
        private _BTSD_wait  = false;
        private _check      = false;
        private _BTSD_side  = _BTSD_veh getVariable ["BTSD_SideQG", sideUnknown];

            switch (_BTSD_side) do {
                case west: {
                    _BTSD_veh setObjectTextureGlobal [1,"#(rgb,8,8,3)color(0,0.05,0.3,0.25)"];
                };

                case east: {
                    _BTSD_veh setObjectTextureGlobal [1,"#(rgb,8,8,3)color(0.3,0.01,0,0.25)"];
                };
            };



        _BTSD_veh setVariable ["BTSD_VehCheck", true, true];

        waitUntil {
            sleep 1;

            _check = _BTSD_veh getVariable ["BTSD_VehCheck", false];

                if !(_check) then {
                    _BTSD_wait = true;
                };

                if !(alive _BTSD_veh) then {
                    _BTSD_wait = true;
                };

            _BTSD_wait
        };

            if !(_check) exitWith {};

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

