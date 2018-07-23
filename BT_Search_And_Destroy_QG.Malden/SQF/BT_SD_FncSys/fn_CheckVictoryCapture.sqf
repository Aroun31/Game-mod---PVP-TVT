#include "..\..\DA3F_macros.hpp"
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
    *           fn_CheckVictoryCapture.sqf
    *           []call BT_fnc_CheckVictoryCapture;
    */


            private _BTSD_AllFlags  = Cfg_MissionInfo(getArray,"RandProps","AllFlags");
            private _AllFlags       = [];
            private _victory        = FALSE;
            private _cntFlag        = 0;
            private _cntFlagW       = 0;
            private _cntFlagE       = 0;
            private _compil         = "";
            sleep 1;
            _cntFlag = count _BTSD_AllFlags;

            {
                _compil = format ["(%1 getVariable [""FlagSide"", []])param[0];", _x];
                _side = DA3F_Compil(_compil);
                switch (_side) do {
                    case west: {
                        _cntFlagW = _cntFlagW + 1;
                    };
                    case east: {
                        _cntFlagE = _cntFlagE + 1;
                    };
                };
                sleep 0.1;
            } forEach _BTSD_AllFlags;

            //systemChat str [_cntFlag, round(_cntFlag/2), _cntFlagE, _cntFlagW];

            switch (TRUE) do {
                case (_cntFlagE > round(_cntFlag/2)): {
                    "Les Opfor affirme leur puissance !" remoteExecCall ["hint", west];
                    "Votre équipe prend l'avantage" remoteExecCall ["hint", east];
                };
                case (_cntFlagW > round(_cntFlag/2)): {
                    "Les Blufor affirme leur puissance !" remoteExecCall ["hint", east];
                    "Votre équipe prend l'avantage" remoteExecCall ["hint", west];
                };

                case (_cntFlagE > _cntFlagW): {
                    "Les Opfor viennent de prendre l'avantage !" remoteExecCall ["hint", west];
                    "Votre équipe prend l'avantage" remoteExecCall ["hint", east];
                };

                case (_cntFlagW > _cntFlagE): {
                    "Les Blufor viennent de prendre l'avantage !" remoteExecCall ["hint", east];
                    "Votre équipe prend l'avantage" remoteExecCall ["hint", west];
                };



                case (_cntFlagW isEqualTo _cntFlagE): {
                    "La guerre fait rage entre les 2 équipes !\n\n50% de la map capturé pour chaque team" remoteExecCall ["hint"];
                };

                case (_cntFlagW isEqualTo _cntFlag): {
                    "Les Blufor viennent de capturer tout les drapeaux" remoteExecCall ["hint", east];
                    "Votre équipe a capturé tout les drapeaux" remoteExecCall ["hint", west];

                    "TeamLose" remoteExecCall ["BIS_fnc_endMission", east];
                    "GoodGame" remoteExecCall ["BIS_fnc_endMission", west];
                    _victory        = TRUE;
                };

                case (_cntFlagE isEqualTo _cntFlag): {
                    "Les Opfor viennent de capturer tout les drapeaux" remoteExecCall ["hint", west];
                    "Votre équipe a capturé tout les drapeaux" remoteExecCall ["hint", east];

                    "TeamLose" remoteExecCall ["BIS_fnc_endMission", west];
                    "GoodGame" remoteExecCall ["BIS_fnc_endMission", east];
                    _victory        = TRUE;
                };
            };

            if (_victory) exitWith {
                sleep 10;
                [player,"","serverCommand ""#restart"""] remoteExecCall ["BT_fnc_execCodeTarget",-2];
            };