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
    *           initServer.sqf
    *
    */

    skipTime (ceil random 24);

    [BTSD_Grp_Blue, 1500, "add"]call BT_fnc_ressources;
    [BTSD_Grp_Red, 1500, "add"]call BT_fnc_ressources;

    []spawn BT_fnc_SalaireTeam;

        addMissionEventHandler ["HandleDisconnect", {
            params ["_unit", "_id", "_uid", "_name"];
                deleteVehicle _unit;
            FALSE;
        }];

        []spawn BT_fnc_PosStartQG;


    // Ne touchez pas à ça ! c'est en préparation de la maj
    /*["load"]call BT_fnc_SaveLoad_Server;*/
    //[] call compile preprocessFileLineNumbers "\btsd_serverside\init.sqf";