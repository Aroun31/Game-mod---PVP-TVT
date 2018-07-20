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
    *           fn_RepackQG.sqf
    *
    */

    private _BTSD_VehQG = param[0, objNull, [objNull]];
    private _BTSD_unit  = param[1, objNull, [objNull]];

        if (isNull _BTSD_VehQG) exitWith {};

            private _BTSD_side      = _BTSD_VehQG getVariable ["BTSD_SideQG", sideUnknown];
            private _BTSD_arrInfo   = _BTSD_VehQG getVariable ["BTSD_InfoVeh", []];
            private _BTSD_Act       = _BTSD_VehQG getVariable ["BTSD_Act_2", 0];
            private _BTSD_vehicle   = objNull;
            private _BTSD_wait      = false;
            private _BTSD_ClassName = _BTSD_VehQG getVariable ["BTSD_OriginalQG", ""];
            private _BTSD_DirQG     = getDir _BTSD_VehQG;
            private _BTSD_PosQG     = _BTSD_VehQG modelToWorld [0, 0, 0.05];
            private _BTSD_arrObj    = _BTSD_VehQG getVariable ["BTSD_ObjDeployed", []];
            private _BTSD_Id        = 0;
            private _arrUnits       = [];


            if (_BTSD_ClassName isEqualTo "") exitWith {
                hint "Une erreur est arrivé !  \nImpossible de repacker le QG";
            };

                _BTSD_wait = ["Replie du QG", 0.1]spawn BT_fnc_Progress;
                waitUntil {scriptDone _BTSD_wait};
                if !(alive player) exitWith {};

                _BTSD_VehQG setVariable ["BTSD_VehCheck", false, true];

            {
                deleteVehicle _x;
            } forEach _BTSD_arrObj;

                deleteVehicle _BTSD_VehQG;
                _BTSD_VehQG setVariable ["BTSD_Act_2", nil, true];

                    _BTSD_vehicle   = createVehicle [_BTSD_ClassName, [0, 0, 500], [], 0, "None"];
                    _BTSD_vehicle allowDamage false;
                    [_BTSD_vehicle]spawn BT_fnc_VictoryOrNot;


                    {
                        if ((side player) isEqualTo (side _x)) then {
                            _arrUnits pushBack _x
                        };
                    } forEach allUnits;

                    [_BTSD_vehicle, ["<t color='#00FF00'>Déployer le QG<t/>", BT_fnc_DeployedQG]] remoteExec ["addAction", _arrUnits];

                    _BTSD_vehicle setVariable ["BTSD_SideQG", _BTSD_side, true];
                    _BTSD_vehicle setPos _BTSD_PosQG;
                    _BTSD_vehicle setDir _BTSD_DirQG;
                    _BTSD_vehicle setDamage (_BTSD_arrInfo param[0]);
                    _BTSD_vehicle setFuel (_BTSD_arrInfo param[1]);

                    _BTSD_vehicle allowDamage true;

                    (format ["%1\n\nVient de replier le QG", name _BTSD_unit]) remoteExecCall ["hint",_BTSD_side];