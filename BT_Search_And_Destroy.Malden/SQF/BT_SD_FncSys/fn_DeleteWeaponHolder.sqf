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
    *           fn_DeleteWeaponHolder.sqf
    *
    */
        private _objSol = [];
        _objSol = nearestObjects [player, ["WeaponHolder"], 20];
        {
            deleteVehicle _x;
        } forEach _objSol;