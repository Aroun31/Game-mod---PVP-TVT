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
    *           fn_GetStuff.sqf
    *
    *       DESCRIPTION :
    *               retourne l'inventaire du joueur
    *       ARGUMENTS :
    *               0 :: OBJECT :: Unit
    *       EXEMPLES :
    *               _stuff = []call BT_fnc_GetStuff;
    *
	*/

		private _BT_Unit 	= param[0, objNull, [objNull]];
		private _BT_Stuff 	= [];

			if (isNull _BT_Unit) exitWith {};

		_BT_Stuff = (
		             ((weapons _BT_Unit) call bis_fnc_consolidateArray) +
		             ((items _BT_Unit) call bis_fnc_consolidateArray) +
		             ((magazines _BT_Unit) call bis_fnc_consolidateArray) +
		             ([(uniform _BT_Unit)] call bis_fnc_consolidateArray) +
		             ([(vest _BT_Unit)] call bis_fnc_consolidateArray) +
		             ([(backpack _BT_Unit)] call bis_fnc_consolidateArray)
		            );

		_BT_Stuff