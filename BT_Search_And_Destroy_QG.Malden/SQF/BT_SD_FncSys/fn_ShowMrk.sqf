/*
*
*       Dev'Arma 3 France
*       [DA3F] Aroun Le BriCodeur
*       fn_No_Show_mrk_by_Side.sqf
*		me soutenir / to support me
*		https://www.paypal.me/LeBriCodeur
*[] call BT_fnc_ShowMrk;
*/

private _DA3F_list_No_Show_Mrk_for_Defense 		= ["BTSD_Mrk_WeaponShopAssaillant","BTSD_Spawn_Vehicle"]; // listing Name your marker
private _DA3F_list_No_Show_Mrk_for_Assaillant 	= ["BTSD_Mrk_WeaponShopDefense","BTSD_Mrk_Jail"];

	// ... etc ...
	    private _BTSD_ArrClass		= []call BT_fnc_SelectCamps;
	    //private _BTSD_ArrClass		= (group player) getVariable ["BTSD_Camps", []];

	    _BTSD_Class                 = _BTSD_ArrClass param[1];

	// Add other side

	    switch (_BTSD_Class) do {

	        case "Defense": {
	            {
	                _x setMarkerAlphaLocal 0;
	            } forEach _DA3F_list_No_Show_Mrk_for_Defense;
	        };

	        case "Assaillant": {
	            {
	                _x setMarkerAlphaLocal 0;
	            } forEach _DA3F_list_No_Show_Mrk_for_Assaillant;
	        };

	    };
