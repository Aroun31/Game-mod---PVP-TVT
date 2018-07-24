#include "..\..\DA3F_macros.hpp"
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
    *           fn_SpawnBotsInCity.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/


        private _BTSD_CoutSpUnit= Cfg_MissionInfo(getNumber,"RandProps","RessourceSpRenf");

        if (_BTSD_CoutSpUnit > Ressources) exitWith {
            hint "Ton équipe ne dispose pas d'assez de ressources pour cette action";
        };

        [player, _BTSD_CoutSpUnit, "del"]call BT_fnc_ressources;

        private _DA3F_houses    = [];
        private _DA3F_Look_Mrk  = FALSE;
        private _DA3F_distance  = (80 + ceil(random 100));
        private _BTSD_Pos       = player modelToWorld [4,10,0.1];
        private _BTSD_Side      = side player;
        private _DA3F_GrpCreate = [_BTSD_Pos, _BTSD_Side, (4 + ceil(random(4)))] call BIS_fnc_spawnGroup;
        _DA3F_GrpCreate deleteGroupWhenEmpty true;
        (format ["%1\nvient de mettre des gardes dans une des villes appartenant à l'équipe", profileName]) remoteExecCall ["hint",(group player)];
        private _DA3F_prime     = (50 + round(random 100));
        private _DA3F_Unit      = objNull;

            {
                _DA3F_Unit              = _x;
                _DA3F_Unit setVariable ["DA3F_BotRandom", true, true];
                _DA3F_Unit setVariable ["DA3F_PrimeKill", _DA3F_prime, true];
                _DA3F_Unit setVariable ["BTSD_Side", _BTSD_Side, true];
                _DA3F_Unit addMPEventHandler ["mpkilled",{_this call BT_fnc_KillBots}];
                _DA3F_Unit setSkill 0.4;
            sleep 0.1;
            } forEach (units (_DA3F_GrpCreate));

        private _DA3F_PointsPassage     = (5 + ceil(random(10)));
        private _BTSD_Pos               = [];
        private _DA3F_houses            = [];
        private _BTSD_PosInBati         = [];

                for "_b" from 1 to _DA3F_PointsPassage do {
                    _BTSD_Pos   =  selectRandom[
                                    [
                                    (getpos _DA3F_unit select 0) - _DA3F_distance * sin(random 359),
                                    (getPos _DA3F_unit select 1) - _DA3F_distance * cos(random 359)
                                    ],
                                    [
                                    (getpos _DA3F_unit select 0) + _DA3F_distance * sin(random 359),
                                    (getPos _DA3F_unit select 1) + _DA3F_distance * cos(random 359)
                                    ],
                                    [
                                    (getpos _DA3F_unit select 0) + _DA3F_distance * sin(random 359),
                                    (getPos _DA3F_unit select 1) - _DA3F_distance * cos(random 359)
                                    ],
                                    [
                                    (getpos _DA3F_unit select 0) - _DA3F_distance * sin(random 359),
                                    (getPos _DA3F_unit select 1) + _DA3F_distance * cos(random 359)
                                    ]
                                ];

                    _DA3F_houses = (nearestObjects [_BTSD_Pos,["house"],100]);
                    private _DA3F_wp = _DA3F_GrpCreate addWaypoint [_BTSD_Pos, (5 + random 20), _b];

                    _DA3F_GrpCreate setVariable ["DA3F_GetWP",_DA3F_wp];

                            if !(str _DA3F_houses isEqualTo "[]") then {
                                _DA3F_house     = selectRandom(_DA3F_houses);
                                _BTSD_PosInBati = call GetPosNumBuilding(_DA3F_house);
                                _DA3F_wp setWaypointHousePosition selectRandom(_BTSD_PosInBati);
                                _DA3F_wp setWaypointPosition [getPos _DA3F_house, 5];
                            };

                        _DA3F_wp setWaypointType selectRandom(["MOVE"]); //,"SENTRY","HOLD"
                        _DA3F_wp setWaypointSpeed selectRandom(["NORMAL","LIMITED"]);// ,"NORMAL","FULL"
                        _DA3F_wp setWaypointBehaviour selectRandom(["SAFE","AWARE"]);//,"COMBAT","STEALTH"
                        _DA3F_wp setWaypointTimeout selectRandom([[5,10,20],[30,40,60]]); // ,[45,90,120]

                            if (_DA3F_Look_Mrk) then {
                                _markerstr = createMarker [format ["PosSp_%1", _BTSD_Pos],_BTSD_Pos];
                                _markerstr setMarkerShape "ICON";
                                _markerstr setMarkerType "hd_dot";
                                _markerstr setMarkerText format ["spawn : %1", _b];
                            };

                        if (_b isEqualTo (_DA3F_PointsPassage-1)) then {
                            _DA3F_wp setWaypointType "CYCLE";
                        };
                    sleep 0.1;
                };