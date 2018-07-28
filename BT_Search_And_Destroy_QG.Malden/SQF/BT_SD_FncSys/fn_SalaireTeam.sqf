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
    *           fn_SalaireTeam.sqf
    *
	*/


        private _BT_PayActive   = Cfg_MissionInfo(getNumber,"RandProps","BT_PayActive");
        private _BT_PayTime     = Cfg_MissionInfo(getNumber,"RandProps","BT_timePay");
        private _BT_PayRess     = Cfg_MissionInfo(getNumber,"RandProps","BT_Ress_Paye");

            if (_BT_PayActive isEqualTo 0) exitWith {

                (format ["Search & Destroy | info server :: Salaire désactivé", nil]) remoteExecCall ["systemChat"];
                    };
                (format ["Search & Destroy | info server :: Salaire activé", nil]) remoteExecCall ["systemChat"];
                (format ["Search & Destroy | info server :: %1.Rsc tout les %2.min", _BT_PayRess, _BT_PayTime]) remoteExecCall ["systemChat"];
                (format ["Search & Destroy | Soyez fair-play, Bon jeu à tous", _BT_PayRess]) remoteExecCall ["systemChat"];


    for "_i" from 0 to 1 step 0  do {

        Uisleep (_BT_PayTime * 60);

            (format ["Le serveur vient de transférer %1 rsc", _BT_PayRess]) remoteExecCall ["systemChat"];
            (format ["Prochain paiement dans %1min", _BT_PayTime]) remoteExecCall ["systemChat"];

            [BTSD_Grp_Blue, _BT_PayRess, "add"]call BT_fnc_ressources;
            [BTSD_Grp_Red, _BT_PayRess, "add"]call BT_fnc_ressources;

        };

