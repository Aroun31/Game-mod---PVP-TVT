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
    *           fn_ClearVeh.sqf
    *			["bag"-"item"-"mag"-"weap"-"all",_veh]call BT_fnc_ClearVeh;
    */

    params[
        ["_BTSD_Type", "all", ["", []]],
    	["_BTSD_veh", objNull, [objNull]]
    ];

    if (_BTSD_Type isEqualType "") then {
    	_BTSD_Type = [_BTSD_Type];
    };

    {
	    switch (_x) do {

	        case "bag": {
		        clearBackpackCargo _BTSD_veh;
	        };

	        case "item": {
	        	clearItemCargoGlobal _BTSD_veh;
	        };

	        case "mag": {
	        	clearWeaponCargoGlobal _BTSD_veh;
	        };

	        case "weap": {
	        	clearMagazineCargoGlobal _BTSD_veh;
	        };

	        case "all": {
	        	clearWeaponCargoGlobal _BTSD_veh;
		        clearBackpackCargo _BTSD_veh;
	        	clearItemCargoGlobal _BTSD_veh;
		        clearMagazineCargoGlobal _BTSD_veh;
	        };
	    };
    } forEach _BTSD_Type;