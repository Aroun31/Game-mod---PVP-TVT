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

        addMissionEventHandler ["HandleDisconnect", {
            params ["_unit", "_id", "_uid", "_name"];
                deleteVehicle _unit;
            FALSE;
        }];

        []spawn BT_fnc_PosStartQG;